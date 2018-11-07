/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.newtronics.controller;

import java.security.Principal;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.PropertyUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.newtronics.common.ApproveResult;
import com.newtronics.common.PlanStatus;
import com.newtronics.tx.model.Plan;
import com.newtronics.tx.model.PlanItem;
import com.newtronics.tx.model.Template;
import com.newtronics.tx.model.User;
import com.newtronics.tx.service.MailService;
import com.newtronics.tx.service.PlanService;
import com.newtronics.tx.service.TemplateService;
import com.newtronics.tx.service.UserService;

/**
 *
 * @author xiangweiwang
 */

@Controller
@RequestMapping(value = "/plan")
@SessionAttributes({ "plan" })
public class PlanController {

	private Logger log = Logger.getLogger(PlanController.class);

	@Autowired
	private UserService userService;

	@Autowired
	private PlanService planService;

	@Autowired
	private TemplateService templateService;

	@Autowired
	private MailService mailService;

	@RequestMapping(value = "filter.html", method = { RequestMethod.POST })
	public ModelAndView filter(Principal principal, ModelMap modelMap,
			@RequestParam(name = "dateFrom", required = false) String dateFrom,
			@RequestParam(name = "dateTo", required = false) String dateTo,
			@RequestParam(name = "customer", required = false) String customer,
			@RequestParam(name = "notifyNo", required = false) String notifyNo) {
		@SuppressWarnings("unchecked")
		Map<String, String> search = (Map<String, String>) modelMap.get("search");
		if (search == null) {
			search = new HashMap<String, String>();
			modelMap.put("search", search);
		} else {
			search.clear();
		}
		if(!StringUtils.isEmpty(dateFrom)) {
			search.put("dateFrom", dateFrom);
		}
		if(!StringUtils.isEmpty(dateTo)) {
			search.put("dateTo", dateTo);
		}
		if(!StringUtils.isEmpty(customer)) {
			search.put("customer", customer);
		}
		if(!StringUtils.isEmpty(notifyNo)) {
			search.put("notifyNo", notifyNo);
		}
		ModelAndView mv = list(principal, modelMap, "0", "10");
		mv.setViewName("listPlanTable");
		return mv;
	}

	/**
	 * 显示所有的计划列表 TODO:加入查询条件
	 * 
	 * @return
	 */
	@RequestMapping(value = "list.html", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView list(Principal principal, ModelMap modelMap,
			@RequestParam(name = "page", required = false) String page,
			@RequestParam(name = "pageSize", required = false) String pageSize) {

		int p = 0;
		if (!StringUtils.isEmpty(page)) {
			p = Integer.valueOf(page);
		}
		int ps = 10;
		if (!StringUtils.isEmpty(pageSize)) {
			ps = Integer.valueOf(pageSize);
		}

		@SuppressWarnings("unchecked")
		Map<String, String> search = (Map<String, String>) modelMap.get("search");
		if (search == null) {
			search = new HashMap<String, String>();
			modelMap.put("search", search);
		}

		Long totalCount = planService.getPageCount(search);
		Long pageCount = (totalCount + ps - 1) / ps;
		modelMap.put("pageCount", pageCount);

		if (totalCount > 0) {
			List<Plan> plans = planService.listPlan(p, ps, search);
			modelMap.put("plans", plans);
		}

		List<Template> templates = templateService.findAllTemplatesByCreator(principal.getName());
		modelMap.put("templates", templates);

		templates = templateService.findAllVisibleTemplate(principal.getName());
		modelMap.put("visibleTemplates", templates);

		ModelAndView mv = new ModelAndView();
		mv.setViewName("listPlan");
		return mv;
	}

	/**
	 * 从创建计划迁移而来，创建Plan对象并保持在内存中
	 * 
	 * @param templateId
	 * @return
	 */
	@RequestMapping(value = "input.html", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView inputPlan(Principal principal, @RequestParam(name = "templateId", required = false) String templateId,
			@RequestParam(name = "notifyNo", required = false) String notifyNo,
			@RequestParam(name = "planId", required = false) String planId) {
		ModelAndView mv = new ModelAndView();
		
		Plan plan = null;
		String tid = templateId;
		if (StringUtils.isEmpty(notifyNo)) {
			// 新建计划
			User user = userService.getUserByName(principal.getName());
			plan = new Plan();
			plan.setCreateDate(new Date());
			plan.setCreator(user);
		} else {
			// 打开已有计划，查询DB
			plan = planService.findPlanById(planId);
			if (plan != null) {
				tid = plan.getTemplateId();
			}
		}
		if (plan == null || StringUtils.isEmpty(tid)) {
			// TODO:
			// 数据校验
			mv.addObject("error", "未找到该计划，请刷新页面");
			mv.addObject("returnPage", "/do/plan/list.html");
			mv.setViewName("error");
			return mv;
		}

		Template template = templateService.findTemplateById(tid);
		if (template == null) {
			// TODO
			// 数据校验
		}

		// 若客户未设定，把模板客户名设为客户
		if (StringUtils.isEmpty(plan.getCustomer())) {
			plan.setCustomer(template.getName());
		}
		if (StringUtils.isEmpty(plan.getTemplateId())) {
			plan.setTemplateId(tid);
		}

		mv.setViewName(template.getViewName());
		mv.addObject("plan", plan);
		mv.addObject("template", template);
		return mv;
	}

	/**
	 * 保存计划的数据项目 如果Session中的Plan对象未持续化，则插入到DB，否则更新DB
	 * 
	 * @param principal
	 * @param modelMap
	 * @param name
	 * @param value
	 * @param pk
	 * @return
	 */
	@RequestMapping(value = "save.html", method = RequestMethod.POST)
	@ResponseBody
	public String saveItem(Principal principal, ModelMap modelMap, @RequestParam("name") String name,
			@RequestParam("pk") String pk, @RequestParam(name = "value", required = false) String value,
			@RequestParam(name = "value[]", required = false) String values) {

		Plan plan = (Plan) modelMap.get("plan");
		if (plan == null || principal == null || StringUtils.isEmpty(principal.getName())) {
			return "已过期，请重新登陆";
		}
		String response = "成功";
		try {
			// PlanItem表存在此项目，则更新PlanItem表
			if (PropertyUtils.isReadable(plan, name) && PropertyUtils.isWriteable(plan, name)) {
				BeanUtils.setProperty(plan, name, value == null ? values : value);
			} else {
				Map<String, PlanItem> items = plan.getPlanItems();
				PlanItem item = items.get(name);
				if (item == null) {
					item = new PlanItem();
					items.put(name, item);
				}
				item.setPlan(plan);
				item.setItemName(pk);
				item.setItemValue(value == null ? values : value);
			}

			plan.setUpdateDate(new Date());
			if (StringUtils.isEmpty(plan.getNotifyNo())) {
				plan = planService.insertPlan(plan);
			} else {
				plan = planService.updatePlan(plan);
			}
			modelMap.put("plan", plan);
		} catch (Exception e) {
			log.error(e.getMessage());
			response = "发生错误";
		}
		return response;
	}

	/**
	 * 提交創建的計劃，該計劃會進入審核狀態
	 * 
	 * @param principal
	 * @param modelMap
	 * @param planId
	 * @return
	 */
	@RequestMapping(value = "submitReview.html", method = RequestMethod.POST)
	public ModelAndView submitReview(Principal principal, ModelMap modelMap, @RequestParam("planId") String planId) {
		ModelAndView mv = new ModelAndView();

		try {
			Plan plan = (Plan) modelMap.get("plan");
			if (plan == null || StringUtils.isEmpty(plan.getTemplateId())) {
				mv.addObject("error", "未找到该计划，请刷新页面");
				mv.addObject("returnPage", "/do/plan/list.html");
				mv.setViewName("error");
				return mv;
			}
			if (plan.getStatus() != PlanStatus.CREATING) {
				// exception
				mv.addObject("error", "状态错误");
				mv.addObject("returnPage", "/do/plan/list.html");
				mv.setViewName("error");
				return mv;
			}

			if (StringUtils.isEmpty(plan.getNotifyNo())) {
				Template template = templateService.findTemplateById(plan.getTemplateId());
				mv.addObject("error", "未输入任何内容");
				mv.addObject("plan", plan);
				mv.setViewName(template.getViewName());
				return mv;
			}
			User creator = userService.getUserByName(principal.getName());
			plan.setCreator(creator);
			plan.setCreateDate(new Date());
			plan.setStatus(PlanStatus.REVIEWING);
			plan.setReviewStatus(ApproveResult.NONE);
			plan.setApproveStatus(ApproveResult.NONE);
			planService.updatePlan(plan);

			Template template = templateService.findTemplateById(plan.getTemplateId());
			if (template != null && !StringUtils.isEmpty(template.getReviewers())) {
				mailService.sendReviewEmail(plan, template);
			}

		} catch (Exception e) {
			log.error(e.getMessage());
		}

		// success
		return list(principal, modelMap, "0", "10");
	}

	@RequestMapping(value = "review.html", method = RequestMethod.POST)
	public ModelAndView completeReview(Principal principal, ModelMap modelMap, @RequestParam("planId") String planId,
			@RequestParam("action") String action) {
		ModelAndView mv = new ModelAndView();

		try {
			Plan plan = (Plan) modelMap.get("plan");
			if (plan == null || StringUtils.isEmpty(plan.getTemplateId())) {
				mv.addObject("error", "未找到该计划，请刷新页面");
				mv.addObject("returnPage", "/do/plan/list.html");
				mv.setViewName("error");
				return mv;
			}
			if (plan.getStatus() != PlanStatus.REVIEWING) {
				// exception
				mv.addObject("error", "状态错误");
				mv.addObject("returnPage", "/do/plan/list.html");
				mv.setViewName("error");
				return mv;
			}
			User creator = userService.getUserByName(principal.getName());
			plan.setReviewer(creator);
			plan.setReviewDate(new Date());
			if ("发回修改".equals(action)) {
				plan.setStatus(PlanStatus.CREATING);
				plan.setReviewStatus(ApproveResult.REJECTED);
			} else {
				plan.setStatus(PlanStatus.APPROVING);
				plan.setReviewStatus(ApproveResult.APPROVED);
			}

			planService.updatePlan(plan);

			Template template = templateService.findTemplateById(plan.getTemplateId());
			if (template != null && template.getApprovers() != null && !template.getApprovers().isEmpty()) {
				mailService.sendReviewEmail(plan, template);
			}

		} catch (Exception e) {
			log.error(e.getMessage());
		}

		// success
		return list(principal, modelMap, "0", "10");
	}

	@RequestMapping(value = "approve.html", method = RequestMethod.POST)
	public ModelAndView completeApprove(Principal principal, ModelMap modelMap, @RequestParam("planId") String planId,
			@RequestParam("action") String action) {
		ModelAndView mv = new ModelAndView();

		try {
			Plan plan = (Plan) modelMap.get("plan");
			if (plan == null || StringUtils.isEmpty(plan.getTemplateId())) {
				mv.addObject("error", "未找到该计划，请刷新页面");
				mv.addObject("returnPage", "/do/plan/list.html");
				mv.setViewName("error");
				return mv;
			}

			if (plan.getStatus() != PlanStatus.APPROVING) {
				// exception
				mv.addObject("error", "状态错误");
				mv.addObject("returnPage", "/do/plan/list.html");
				mv.setViewName("error");
				return mv;
			}

			User creator = userService.getUserByName(principal.getName());
			plan.setApprover(creator);
			plan.setApproveDate(new Date());
			if ("发回修改".equals(action)) {
				plan.setStatus(PlanStatus.CREATING);
				plan.setReviewStatus(ApproveResult.REJECTED);
				plan.setApproveStatus(ApproveResult.REJECTED);
			} else {
				plan.setStatus(PlanStatus.APPROVED);
				plan.setApproveStatus(ApproveResult.APPROVED);
			}
			planService.updatePlan(plan);

			Template template = templateService.findTemplateById(plan.getTemplateId());
			if (template != null) {
				StringBuffer sb = new StringBuffer();
				for (User u : template.getApprovers()) {
					if (!StringUtils.isEmpty(u.getEmail())) {
						if (sb.length() > 0) {
							sb.append(";");
						}
						sb.append(u.getEmail());
					}
				}

			}

		} catch (Exception e) {
			log.error(e.getMessage());
		}

		// success
		return list(principal, modelMap, "0", "10");
	}
}
