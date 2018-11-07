package com.newtronics.tx.service.impl;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.Map;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;
import org.springframework.ui.freemarker.FreeMarkerTemplateUtils;
import org.springframework.util.StringUtils;

import com.newtronics.tx.model.Plan;
import com.newtronics.tx.model.User;
import com.newtronics.tx.service.MailService;

import freemarker.core.ParseException;
import freemarker.template.Configuration;
import freemarker.template.MalformedTemplateNameException;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import freemarker.template.TemplateNotFoundException;

@Service
public class MailServiceImpl implements MailService {

	@Autowired
	private JavaMailSender mailSender;

	@Autowired
	private Configuration freemarkerConfiguration;

	@Value("${mail.from}")
	private String from;

	@Value("${mail.subject}")
	private String subject;

	@Override
	@Async
	public void sendReviewEmail(final Plan model, final com.newtronics.tx.model.Template tmp) {
		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper helper;
		try {
			helper = new MimeMessageHelper(message, MimeMessageHelper.MULTIPART_MODE_MIXED_RELATED,
					StandardCharsets.UTF_8.name());

			StringBuffer sb = new StringBuffer();
			for (User u : tmp.getReviewers()) {
				if (!StringUtils.isEmpty(u.getEmail())) {
					if (sb.length() > 0) {
						sb.append(";");
					}
					sb.append(u.getEmail());
				}
			}
			String receipts = sb.toString();
			if (!StringUtils.isEmpty(receipts)) {
				Template t = freemarkerConfiguration.getTemplate(tmp.getViewName() + "Detail.ftl");
				Map<String, Object> tmpMode = new HashMap<String, Object>();
				tmpMode.put("plan", model);
				String html = FreeMarkerTemplateUtils.processTemplateIntoString(t, tmpMode);

				helper.setTo(receipts.split(";"));
				helper.setText(html, true);
				helper.setSubject(subject);
				helper.setFrom(from);

				mailSender.send(message);
			}

		} catch (MessagingException e) {
			e.printStackTrace();
		} catch (TemplateNotFoundException e) {
			e.printStackTrace();
		} catch (MalformedTemplateNameException e) {
			e.printStackTrace();
		} catch (ParseException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (TemplateException e) {
			e.printStackTrace();
		}

	}
}
