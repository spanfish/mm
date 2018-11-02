<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page contentType="text/html;charset=utf-8" pageEncoding="UTF-8"%>

<html>
	<head>
		<meta http-equiv="cache-control" content="max-age=0" />
        <meta http-equiv="cache-control" content="no-cache" />
        <meta http-equiv="expires" content="Tue, 01 Jan 1980 1:00:00 GMT" />
        <meta http-equiv="pragma" content="no-cache" />
        
		<title>生产计划</title>

		<script src="<%=request.getContextPath()%>/resources/jquery/jquery-2.0.3.min.js"></script>
		
		<link href="<%=request.getContextPath()%>/resources/main.css" rel="stylesheet">
		<link href="<%=request.getContextPath()%>/resources/w3.css" rel="stylesheet">
		<!-- bootstrap -->
		<link href="<%=request.getContextPath()%>/resources/bootstrap300/css/bootstrap.css" rel="stylesheet">
		<script src="<%=request.getContextPath()%>/resources/bootstrap300/js/bootstrap.js"></script>
		
		<!-- X-editable -->
		<link href="<%=request.getContextPath()%>/resources/bootstrap3-editable/css/bootstrap-editable.css" rel="stylesheet">
		<script src="<%=request.getContextPath()%>/resources/bootstrap3-editable/js/bootstrap-editable.min.js"></script>
		
		<!-- wysihtml5 -->
		
		<link href="<%=request.getContextPath()%>/resources/x-editable/inputs-ext/wysihtml5/bootstrap-wysihtml5-0.0.3/bootstrap-wysihtml5-0.0.3.css" rel="stylesheet">  
        <script src="<%=request.getContextPath()%>/resources/x-editable/inputs-ext/wysihtml5/bootstrap-wysihtml5-0.0.3/wysihtml5-0.3.0.min.js"></script>  
        <script src="<%=request.getContextPath()%>/resources/x-editable/inputs-ext/wysihtml5/bootstrap-wysihtml5-0.0.3/bootstrap-wysihtml5-0.0.3.min.js"></script>
        <script src="<%=request.getContextPath()%>/resources/x-editable/inputs-ext/wysihtml5/wysihtml5-0.0.3.js"></script>
		

		<script>
			$.fn.editable.defaults.mode = 'popup';
		
			$(document).ready(function() {
				$('.editable').editable();
			});
		</script>
		<style>
			th {
			font-weight:normal;}
		</style>
	</head>
	<body style=" width: 100%;">
		<jsp:include page="navi.jsp">
			<jsp:param name="page" value="home" />
		</jsp:include>

		<c:if test="${plan == null or not empty error}">
			<div class="w3-panel w3-red">
			    <h3>出错了</h3>
			    <p><c:out value="${error}"/></p>
			</div>
			<c:if test="${plan == null}">
			<a href="<%=request.getContextPath()%>/do/plan/list.html">返回</a>
			</c:if>
		</c:if>
		
		<c:if test="${plan != null}">
		<c:if test="${not empty plan.message }">
			<div class="w3-panel w3-yellow">
			    <p><c:out value="${plan.message}"/></p>
			</div>
		</c:if>
				<table border="1" style="margin-left: auto;margin-right: auto; width:80%">
			<thead>
				<tr>
					<th style="text-align: center;" colspan="10" align="center"><h2>上海盛本智能科技有限公司</h2></th>
				</tr>
			</thead>
			<tfoot align="center">
				<tr>
					<td colspan="10">
						<table style="border:0; width:100%; height:100%">
							<tr>
								<th style="width:80px">制表</th>
								<td style="width:160px">${plan.creator.username}</td>
								<th style="width:80px">审核</th>
								<td style="width:160px">
									<c:if test="${plan.reviewStatus == 'REJECTED'  or plan.reviewStatus == 'APPROVED'}">
									<div class="stamp stamp-${plan.reviewStatus}">
										<span><fmt:formatDate value="${plan.reviewDate}" pattern="yyyy-MM-dd" /></span>
										<span><c:out value="${plan.reviewer.userDispName}"></c:out></span>
									</div>
									</c:if>
								</td>
								<th style="width:80px">承认</th>
								<td style="width:160px">
									<c:if test="${plan.approveStatus == 'REJECTED'  or plan.approveStatus == 'APPROVED'}">
									<div class="stamp stamp-${plan.approveStatus}">
										<span><fmt:formatDate value="${plan.reviewDate}" pattern="yyyy-MM-dd" /></span>
										<span><c:out value="${plan.approver.userDispName}"></c:out></span>
									</div>
									</c:if>
								</td>
								<td></td>
							</tr>
						</table>
					</td>
				</tr>
		    	<tr>
		        	<td colspan="10">
		        		<c:if test="${plan.status == 'CREATING' }">
		        		<form name="form" method="POST" action="<%=request.getContextPath()%>/do/plan/submitReview.html">
		        			<input type="hidden" name="planId" value="${plan.planId}">
		        			<input type="submit" value="提交审核"/>
		        		</form>
		        		</c:if>
		        		
		        		<c:if test="${plan.status == 'REVIEWING' }">
		        		<form name="form" method="POST" action="<%=request.getContextPath()%>/do/plan/review.html">
		        			<input type="hidden" name="planId" value="${plan.planId}">
		        			<input type="submit" name="action" value="发回修改"/>
		        			<input type="submit" name="action" value="通过审核"/>
		        		</form>
		        		</c:if>
		        		
		        		<c:if test="${plan.status == 'APPROVING' }">
		        		<form name="form" method="POST" action="<%=request.getContextPath()%>/do/plan/approve.html">
		        			<input type="hidden" name="planId" value="${plan.planId}">
		        			<input type="submit" name="action" value="发回修改"/>
		        			<input type="submit" name="action" value="承认"/>
		        		</form>
		        		</c:if>
		        		<c:if test="${plan.status == 'APPROVED' }">
		        		
		        		</c:if>
		        	</td>
		      	</tr>
		    </tfoot>
			<tr>
				<th colspan = "8" rowspan = "3">
					<a href="#" id="product_book" data-type="textarea" data-pk="product_book" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入通知书信息"><c:out value="${plan.planItems['product_book'].itemValue}"/></a>
					<script>
					$(function(){
					    $('#product_book').editable({
					        url: '<%=request.getContextPath()%>/do/plan/save.html',
					        title: '通知书',
					        rows: 2
					    });
					});
					</script>
				</th>
				<td colspan = "2">表单编号:
					<a href="#" id="list_number" data-type="textarea" data-pk="list_number" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入表单编号"><c:out value="${plan.planItems['list_number'].itemValue}"/></a>
					<script>
					$(function(){
					    $('#list_number').editable({
					        url: '<%=request.getContextPath()%>/do/plan/save.html',
					        title: '表单编号',
					        rows: 2
					    });
					});
					</script>
				</td>
			</tr>
			<tr>
				<td colspan = "2">版本号:
					<a href="#" class="editable" id="version_number" data-type="text" data-pk="version_number" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入版本号">
						<c:out value="${plan.planItems['version_number'].itemValue}"/>
					</a>
				</td>
			</tr>
			<tr>
				<td colspan = "2">编号:
					<a href="#" class="editable" id="edit_number" data-type="text" data-pk="edit_number" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入编号">
						<c:out value="${plan.planItems['edit_number'].itemValue}"/>
					</a>
				</td>
			</tr>
			<tr>
				<th rowspan = "2">订单信息</th>
				<th>客户</th>
				<td colspan = "4">
					<a href="#" class="editable" id="cus_name" data-type="text" data-pk="cus_name" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入客户">
						<c:out value="${plan.planItems['cus_name'].itemValue}"/>
					</a>				
				</td>
				<th>产品型号</th>
				<td colspan = "3">
					<a href="#" class="editable" id="productModel" data-type="text" data-pk="productModel" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入产品型号">
						<c:out value="${plan.planItems['productModel'].itemValue}"/>
					</a>
				</td>
			</tr>
			<tr>
				<th>生产性质</th>
				<td colspan = "4">
						<div style="width:200px; text-align:left; word-break: break-all;"><a href="#" id="manufactureType" data-type="checklist" data-pk="manufactureType" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="生产性质"></a></div> 
					<script>
						$(function() {
							$('#manufactureType').editable({
								value : [${plan.planItems['manufactureType'].itemValue}],
								source : [ {
									value : 1,
									text : '试产'
								}, {
									value : 2,
									text : '小批'
								}, {
									value : 3,
									text : '量产'
								}],
								placement: 'bottom',
								display:function(value, sourceData){
									var html = [], checked = $.fn.editableutils.itemsByValue(value, sourceData);
									if (checked.length) {
								    	$.each(checked, function(i, v) {
								        	html.push($.fn.editableutils.escape(v.text));
								      	});
								      	$(this).html(html.join(', '));
								    } else {
								      	$(this).empty();
								    }
								}
							});
						});
					</script>
				</td>
				<th>订单数量</th>
				<td colspan = "3">
					<a href="#" class="editable" id="dingdan_total" data-type="text" data-pk="dingdan_total" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入订单批量">
						<c:out value="${plan.planItems['dingdan_total'].itemValue}"/>
					</a>
				</td>
			</tr>
			<tr>
				<th rowspan = "3">工单信息</th>
				<th>产品信息</th>
				<th>生产单号</th>
				<td colspan = "2"><a href="#" id="product_list_number" data-type="textarea" data-pk="product_list_number" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入生产单号"><c:out value="${plan.planItems['product_list_number'].itemValue}"/></a>
					<script>
					$(function(){
					    $('#product_list_number').editable({
					        url: '<%=request.getContextPath()%>/do/plan/save.html',
					        title: '生产单号',
					        rows: 2
					    });
					});
					</script>
				</td>
				<th>成品料号</th>
				<td colspan = "2"><a href="#" id="chengpin_number" data-type="textarea" data-pk="chengpin_number" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入成品料号"><c:out value="${plan.planItems['chengpin_number'].itemValue}"/></a>
					<script>
					$(function(){
					    $('#chengpin_number').editable({
					        url: '<%=request.getContextPath()%>/do/plan/save.html',
					        title: '成品料号',
					        rows: 2
					    });
					});
					</script>
				</td>
				<th>整机颜色</th>
				<td>
					<a href="#" class="editable" id="" data-type="text" data-pk="machine_colour" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入整机颜色">
						<c:out value="${plan.planItems['machine_colour'].itemValue}"/>
					</a>
				</td>
			</tr>
			<tr>
				<th>生产类别</th>
				<td colspan = "8"><a href="#" id="category" data-type="checklist" data-pk="category" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入生产类别"></a>
				<script>
					$(function() {
						$('#category').editable({
							value : [${plan.planItems['category'].itemValue}],
							source : [ {
								value : 1,
								text : '核心板PCBA'
							}, {
								value : 2,
								text : '主板PCBA'
							}, {
								value : 3,
								text : '副板'
							}, {
								value : 4,
								text : '机头'
							}, {
								value : 5,
								text : '底座'
							}, {
								value : 6,
								text : '包装'
							}, {
								value : 7,
								text : '返工'
							}, {
								value : 8,
								text : '升级出货'
							}],
							display:function(value, sourceData){
								var html = [], checked = $.fn.editableutils.itemsByValue(value, sourceData);
								if (checked.length) {
							    	$.each(checked, function(i, v) {
							        	html.push($.fn.editableutils.escape(v.text));
							      	});
							      	$(this).html(html.join(', '));
							    } else {
							      	$(this).empty();
							    }
							}
						});
					});
				</script>
				</td>
			</tr>
			<tr>
				<th>是否走系统</th>
				<td colspan = "4">
					<label><input type = "checkbox" name = "style" checked>是</label>
					<label><input type = "checkbox" name = "style">否</label>
				</td>
				<th>即时出货</th>
				<td colspan = "3">
					<label><input type = "checkbox" name = "style" checked>是</label>
					<label><input type = "checkbox" name = "style">否</label>
				</td>
			</tr>
			<tr>
				<th rowspan = "15">生产资料信息</th>
				<th>核心板bom</th>
				<td colspan = "8">N/A</td>
			</tr>
				<th>主板bom</th>
				<td colspan = "8">QR300_MAIN_P4_V1.2_20180921(20180914)</td>
			</tr>
			<tr>
				<th>副板bom</th>
				<td colspan = "8">N/A</td>
			</tr>
			<tr>
				<th>STM资料包</th>
				<td colspan = "8">QR300_BFZJ1800540_MAIN_P4_SMT_20180925.rar</td>
			</tr>
			<tr>
				<th>组装BOM</th>
				<td colspan = "8">N/A</td>
			</tr>
			<tr>
				<th>配置BOM</th>
				<td colspan = "8">N/A</td>
			</tr>
			<tr>
				<th>包装BOM</th>
				<td colspan = "8">N/A</td>
			</tr>
			<tr>
				<th>工艺文件</th>
				<td colspan = "8">QR300 CIT测试需求及流程 (for非及时出货) -20180830.xls</td>
			</tr>
			<tr>
				<th>组包装SOP</th>
				<td colspan = "8">N/A</td>
			</tr>
			<tr>
				<th>标签打印包</th>
				<td colspan = "8">N/A</td>
			</tr>
			<tr>
				<th rowspan = "5">软件版本</th>
				<th>平台版本</th>
				<td colspan = "7">/QR/AC35_Tool/PA_V1.9.7/MercuryPlat_V1.9.7.7z</td>
			</tr>
			<tr>
				<th>AP版本</th>
				<td colspan = "7">/QR/QR300/STM/QR300_SMT_APP_V2.09.7705_K_20180830_sec.rar</td>
			</tr>
			<tr>
				<th>模块版本</th>
				<td colspan = "7">/POS/pos/MH1902/QR100/BOOTLOADER/001_Signed/MH1920_BL_20180223.hex.sig.zip </hr>
				/POS/pos/MH1902/QR300/SMT/V9.39.864/MH1902FW_QR300_DEBUG_MB01_V9.39.864_180914.bin.7z</td>
			</tr>
			<tr>
				<th>读取版本号</th>
				<td colspan = "7"></td>
			</tr>
			<tr>
				<th>QCN/PRI</th>
				<td colspan = "7"></td>
			</tr>
			<tr>
				<th>注意事项(返工流程)</th>
				<td colspan = "9"></td>
			</tr>
			<tr>
				<th rowspan = "8">配置信息</th>
				<th rowspan = "6">频段</th>
				<td><label><input type = "checkbox" name = "style">GSM</label></td>
				<td><label><input type = "checkbox" name = "style">850</label></td>
				<td><label><input type = "checkbox" name = "style" checked>900</label></td>
				<td><label><input type = "checkbox" name = "style" checked>1800</label></td>
				<td><label><input type = "checkbox" name = "style">1900</label></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td><label><input type = "checkbox" name = "style">CDMA</label></td>
				<td><label><input type = "checkbox" name = "style">800</label></td>
				<td><label><input type = "checkbox" name = "style">1900</label></td>
				<td><label><input type = "checkbox" name = "style">AWS</label></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td><label><input type = "checkbox" name = "style">WCDMA</label></td>
				<td><label><input type = "checkbox" name = "style">850</label></td>
				<td><label><input type = "checkbox" name = "style">900</label></td>
				<td><label><input type = "checkbox" name = "style">1900</label></td>
				<td><label><input type = "checkbox" name = "style">2100</label></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td><label><input type = "checkbox" name = "style">TD-SCDMA</label></td>
				<td><label><input type = "checkbox" name = "style">B34</label></td>
				<td><label><input type = "checkbox" name = "style">B39</label></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td rowspan = "2"><label><input type = "checkbox" name = "style"></label>LTE-FDD</td>
				<td><label><input type = "checkbox" name = "style">B38</label></td>
				<td><label><input type = "checkbox" name = "style">B39</label></td>
				<td><label><input type = "checkbox" name = "style">B40</label></td>
				<td><label><input type = "checkbox" name = "style">B41</label></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td><label><input type = "checkbox" name = "style">B1</label></td>
				<td><label><input type = "checkbox" name = "style">B2</label></td>
				<td><label><input type = "checkbox" name = "style">B3</label></td>
				<td><label><input type = "checkbox" name = "style">B5</label></td>
				<td><label><input type = "checkbox" name = "style">B7</label></td>
				<td><label><input type = "checkbox" name = "style">B8</label></td>
				<td><label><input type = "checkbox" name = "style">B9</label></td>
			</tr>
			<tr>
				<th>主板配置码</th>
				<td colspan = "4">5</td>
				<th>成品配置</th>
				<td colspan = "3">N/A</td>
			</tr>
			<tr>
				<th>灌装SN密匙</th>
				<td colspan = "4">
					<label><input type = "checkbox" name = "style">是</label>
					<label><input type = "checkbox" name = "style" checked>否</label>
				</td>
				<th>灌装客户密匙</th>
				<td colspan = "4">
					<label><input type = "checkbox" name = "style">是</label>
					<label><input type = "checkbox" name = "style" checked>否</label>
				</td>
			</tr>
			<tr>
				<th rowspan = "3">号段信息</th>
				<th>BT号段</th>
				<td colspan = "3">N/A</td>
				<th>WIFI号段</th>
				<td colspan = "4">N/A</td>
			</tr>
			<tr>
				<th>MEID号段</th>
				<td colspan = "3">N/A</td>
				<th>IMEI号段</th>
				<td colspan = "4">N/A</td>
			</tr>
			<tr>
				<th>PSN/KSN</th>
				<td colspan = "3">NQR3B05</td>
				<th>DSN/TUSN</th>
				<td colspan = "4">N/A
			</td>
			</tr>
			<tr>
				<th>工单确认</th>
				<td colspan = "3">PM:</td>
				<td colspan = "3">SPM:</td>
				<td colspan = "3">PMC:</td>
			</tr>
		</tbody>
		</table>
	</c:if>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
