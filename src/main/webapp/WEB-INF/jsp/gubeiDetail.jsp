<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<c:if test="${empty param.view}">
<script>
	$.fn.editable.defaults.mode = 'popup';

	$(document).ready(function() {
		$('.editable').editable();
	});
</script>
</c:if>
<h3 align="center">生产工单</h3>
<table class="oms_table" style="margin-left: auto; margin-right: auto; border: 0px">
	<tr>
		<td style="width:100px">客户名称:</td>
		<td style="width:200px" align="left">
			<div style="width:200px; text-align:left;  word-break: break-all;">
			<a href="#" id="customer" data-type="text" data-pk="customer" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入客户名称">
				<c:out value="${plan.customer}"/>
			</a>
			</div>
			<c:if test="${empty param.view}">
			<script>
			$('#customer').editable({
					placement: 'bottom'
			});
			</script>
			</c:if>
		</td>
		<td style="width:100px">销售性质：</td>
		<td style="width:200px" align="left">
			<label><input ${param.view} id="sale-domestic" class="ajaxCheckbox" type="checkbox" name="sale-domestic" ${plan.planItems['sale-domestic'].itemValue}><span> 内销</span></label>
			<label><input ${param.view} id="sale-export" class="ajaxCheckbox" type="checkbox" name="sale-export" ${plan.planItems['sale-export'].itemValue}><span> 外销</span></label>
			<c:if test="${empty param.view}">
			<script>
			$('.ajaxCheckbox').change(function() {
		        $.ajax({
		        	  method: "POST",
		        	  url: "<%=request.getContextPath()%>/do/plan/save.html",
		        	  data: { name: this.name, pk: this.name, value: this.checked ? 'checked' : ''}
		        	})
		        	  .done(function( msg ) {
		        	  })
		        	  .error(function( msg ) {
		        		  alert('保存失败');
		        	  });
		    });
			</script>
			</c:if>
		</td>
	</tr>
	<tr>
		<td>订单编号:</td>
		<td>
			<a href="#" class="editable" id="orderNo" data-type="text" data-pk="orderNo" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入订单编号">
				<c:out value="${plan.planItems['orderNo'].itemValue}"/>
			</a>
		</td>
		<td>工    厂：</td>
		<td>
			<a href="#" class="editable" id="factory" data-type="text" data-pk="factory" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入工厂">
				<c:out value="${plan.planItems['factory'].itemValue}"/>
			</a>
		</td>
	</tr>
	<tr>
		<td>工单编号:</td>
		<td>
			<a href="#" class="editable" id="gongdanNo" data-type="text" data-pk="gongdanNo" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入工单编号">
				<c:out value="${plan.planItems['gongdanNo'].itemValue}"/>
			</a>
		</td>
		<td>日    期：</td>
		<td>
			<a href="#" id="orderDate" data-type="date" data-pk="orderDate" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入日期">
				<c:out value="${plan.planItems['orderDate'].itemValue}"/>
			</a>
			<c:if test="${empty param.view}">
			<script>
			$('#orderDate').editable({
				placement: 'bottom'
			});
			</script>
			</c:if>
		</td>
	</tr>
</table>
<table class="oms_table" border="1" style="margin-left: auto;margin-right: auto; width:80%">
    <tbody>
		<tr>
			<td style="width:140px; word-break:break-all;" rowspan = "12">生<br/>产<br/>资<br/>料</td>
			<td>产品名称</td>
			<td>产品型号</td>
			<td>产品描述</td>
			<td>PCBA版本号</td>
			<td>客户编码</td>
			<td>古北编码</td>
			<td>备注</td>
		</tr>
		<tr>
			<td style="width:100px; word-break:break-all;"><a href="#" class="editable" id="productName" data-type="text" data-pk="productName" 
				data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入产品名称">
				<c:out value="${plan.planItems['productName'].itemValue}"/>
				</a>
			</td>
			<td style="width:100px; word-break:break-all;">
				<a href="#" class="editable" id="productModel" data-type="text" data-pk="productModel" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入产品型号">
					<c:out value="${plan.planItems['productModel'].itemValue}"/>
				</a>
			</td>
			<td style="width:120px; word-break:break-all;">
				<a href="#" class="editable" id="product_description" data-type="textarea" data-pk="product_description" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入产品描述">
					<c:out value="${plan.planItems['product_description'].itemValue}"/>
				</a>
			</td>
			<td style="width:60px; word-break:break-all;">
				<a href="#" class="editable" id="pcbVer" data-type="text" data-pk="pcbVer" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入PCB版本号 ">
					<c:out value="${plan.planItems['pcbVer'].itemValue}"/>
				</a>
			</td>
			<td style="width:100px; word-break:break-all;">
				<a href="#" class="editable" id="customer_code" data-type="text" data-pk="customer_code" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入客户编码 ">
					<c:out value="${plan.planItems['customer_code'].itemValue}"/>
				</a>
			</td>
			<td style="width:100px; word-break:break-all;">
				<a href="#" class="editable" id="gubei_code" data-type="text" data-pk="gubei_code" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入古北编码 ">
					<c:out value="${plan.planItems['gubei_code'].itemValue}"/>
				</a>
			</td>
			<td style="width:160px; word-break:break-all;">
				<a href="#" class="editable" id="comment" data-type="textarea" data-pk="comment" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入备注">
					<c:out value="${plan.planItems['comment'].itemValue}"/>
				</a>
			</td>
		</tr>
		<tr>
			<td>类别</td>
			<td colspan="6">
				<label><input id="cat-zhengji" class="ajaxCheckbox-cat" type="checkbox" name="cat-zhengji" ${plan.planItems['cat-zhengji'].itemValue}><span> 整机</span></label>
				<label><input id="cat-pcba" class="ajaxCheckbox-cat" type="checkbox" name="cat-pcba" ${plan.planItems['cat-pcba'].itemValue}><span> PCBA</span></label>
				<label><input id="cat-mokuai" class="ajaxCheckbox-cat" type="checkbox" name="cat-mokuai" ${plan.planItems['cat-mokuai'].itemValue}><span> 模块</span></label>
				<label><input id="cat-other" class="ajaxCheckbox-cat" type="checkbox" name="cat-other" ${plan.planItems['cat-other'].itemValue}><span> 其他</span></label>
				<c:if test="${empty param.view}">
				<script>
				$('.ajaxCheckbox-cat').change(function() {
			        $.ajax({
			        	  method: "POST",
			        	  url: "<%=request.getContextPath()%>/do/plan/save.html",
			        	  data: { name: this.name, pk: this.name, value: this.checked ? 'checked' : ''}
			        	})
			        	  .done(function( msg ) {
			        	  })
			        	  .error(function( msg ) {
			        		  alert('保存失败');
			        	  });
			    });
				</script>
				</c:if>
			</td>
		</tr>
		<tr>
			<td>贴片BOM</td>
			<td style="word-break:break-all;" colspan = "4">
				<a href="#" id="bom" data-type="textarea" data-pk="bom" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入产品P/N"><c:out value="${plan.planItems['bom'].itemValue}"/></a>
				<c:if test="${empty param.view}">
				<script>
					$(function(){
					    $('#bom').editable({
					        url: '<%=request.getContextPath()%>/do/plan/save.html',
					        title: '贴片BOM',
					        rows: 2
					    });
					});
				</script>
				</c:if>
			</td>
			<td style="width:60px; word-break:break-all;" rowspan = "5">项目经理</td>
			<td rowspan = "5">
				<a href="#" id="custel" data-type="textarea" data-pk="custel" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入项目经理信息"><c:out value="${plan.planItems['custel'].itemValue}"/></a>
				<c:if test="${empty param.view}">
				<script>
					$(function(){
					    $('#custel').editable({
					        url: '<%=request.getContextPath()%>/do/plan/save.html',
					        title: '项目经理信息',
					        rows: 2
					    });
					});
				</script>
				</c:if>
			</td>
		</tr>
		<tr>
			<td>组装BOM</td>
			<td style="word-break:break-all;" colspan = "4">
				<a href="#" id="zuzhuang_bom" data-type="textarea" data-pk="zuzhuang_bom" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入组装bom"><c:out value="${plan.planItems['zuzhuang_bom'].itemValue}"/></a>
				<c:if test="${empty param.view}">
				<script>
					$(function(){
					    $('#zuzhuang_bom').editable({
					        url: '<%=request.getContextPath()%>/do/plan/save.html',
					        title: '组装BOM',
					        rows: 2
					    });
					});
				</script>
				</c:if>
			</td>
		</tr>
		<tr>
			<td>包装BOM</td>
			<td colspan = "4">
				<a href="#" id="baozhuang_bom" data-type="textarea" data-pk="baozhuang_bom" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入包装bom"><c:out value="${plan.planItems['baozhuang_bom'].itemValue}"/></a>
				<c:if test="${empty param.view}">
				<script>
					$(function(){
					    $('#baozhuang_bom').editable({
					        url: '<%=request.getContextPath()%>/do/plan/save.html',
					        title: '包装BOM',
					        rows: 2
					    });
					});
				</script>
				</c:if>
			</td>
		</tr>
		<tr>
			<td>SMT资料包</td>
			<td colspan = "4"><a href="#" id="smtDocPackage" data-type="textarea" data-pk="smtDocPackage" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入产品P/N"><c:out value="${plan.planItems['smtDocPackage'].itemValue}"/></a>
				<c:if test="${empty param.view}">
				<script>
					$(function(){
					    $('#smtDocPackage').editable({
					    	url: '<%=request.getContextPath()%>/do/plan/save.html',
					        title: 'SMT资料包',
					        rows: 5
					    });
					});
				</script>
				</c:if>
			</td>
		</tr>
		<tr>
			<td>银网文件</td>
			<td colspan = "4">
				<a href="#" id="yinwang_file" data-type="textarea" data-pk="yinwang_file" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入银网文件"><c:out value="${plan.planItems['yinwang_file'].itemValue}"/></a>
				<c:if test="${empty param.view}">
				<script>
					$(function(){
					    $('#yinwang_file').editable({
					        url: '<%=request.getContextPath()%>/do/plan/save.html',
					        title: '银网文件',
					        rows: 2
					    });
					});
				</script>
				</c:if>
			</td>
		</tr>
		<tr>
			<td>芯片预烧录文件</td>
			<td colspan = "4">
				<a href="#" id="chipdebug_file" data-type="textarea" data-pk="chipdebug_file" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入芯片预烧录文件"><c:out value="${plan.planItems['chipdebug_file'].itemValue}"/></a>
				<c:if test="${empty param.view}">
				<script>
				$(function(){
				    $('#chipdebug_file').editable({
				        url: '<%=request.getContextPath()%>/do/plan/save.html',
				        title: '芯片预烧录文件',
				        rows: 2
				    });
				});
				</script>
				</c:if>
			</td>
			<td rowspan = "4">测试部</td>
			<td rowspan = "4">
				<a href="#" id="test_part" data-type="textarea" data-pk="test_part" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入测试部信息"><c:out value="${plan.planItems['test_part'].itemValue}"/></a>
				<c:if test="${empty param.view}">
				<script>
				$(function(){
				    $('#test_part').editable({
				        url: '<%=request.getContextPath()%>/do/plan/save.html',
				        title: '测试部信息',
				        rows: 2
				    });
				});
				</script>
				</c:if>
			</td>
		</tr>
		<tr>
			<td>固件烧录信息</td>
			<td colspan = "4">
				<a href="#" id="gujiandebug_message" data-type="textarea" data-pk="gujiandebug_message" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入固件烧录信息"><c:out value="${plan.planItems['gujiandebug_message'].itemValue}"/></a>
				<c:if test="${empty param.view}">
				<script>
				$(function(){
				    $('#gujiandebug_message').editable({
				        url: '<%=request.getContextPath()%>/do/plan/save.html',
				        title: '固件烧录信息',
				        rows: 2
				    });
				});
				</script>
				</c:if>
			</td>
		</tr>
		<tr>
			<td>MAC列表获取</td>
			<td colspan = "4">
				<a href="#" id="maclist_message" data-type="textarea" data-pk="maclist_message" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入MAC列表获取"><c:out value="${plan.planItems['maclist_message'].itemValue}"/></a>
				<c:if test="${empty param.view}">
				<script>
				$(function(){
				    $('#maclist_message').editable({
				        url: '<%=request.getContextPath()%>/do/plan/save.html',
				        title: 'MAC列表获取',
				        rows: 2
				    });
				});
				</script>
				</c:if>
			</td>
		</tr>
		<tr>
			<td>烧录,测试工具</td>
			<td colspan = "4">
				<a href="#" id="burn_test_tool" data-type="textarea" data-pk="burn_test_tool" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入烧录，测试工具"><c:out value="${plan.planItems['burn_test_tool'].itemValue}"/></a>
				<c:if test="${empty param.view}">
				<script>
				$(function(){
				    $('#burn_test_tool').editable({
				        url: '<%=request.getContextPath()%>/do/plan/save.html',
				        title: '烧录，测试工具',
				        rows: 2
				    });
				});
				</script>
				</c:if>
			</td>
		</tr>
		<tr>
			<td style="width:140px; word-break:break-all;" rowspan = "2">绿色产品<br/>生产要求(必选)</td>
			<td colspan = "7">工艺要求：
				<label><input id="fabrication-wuqian" class="ajaxCheckbox-fabrication" type="checkbox"  ${plan.planItems['fabrication-wuqian'].itemValue}><span> 无铅工艺</span></label>
				<label><input id="fabrication-youqian" class="ajaxCheckbox-fabrication" type="checkbox" ${plan.planItems['fabrication-youqian'].itemValue}><span> 有铅工艺</span></label>
				<c:if test="${empty param.view}">
				<script>
				$('.ajaxCheckbox-fabrication').change(function() {
			        $.ajax({
			        	  method: "POST",
			        	  url: "<%=request.getContextPath()%>/do/plan/save.html",
			        	  data: { name: this.id, pk: this.id, value: this.checked ? 'checked' : ''}
			        	})
			        	  .done(function( msg ) {
			        	  })
			        	  .error(function( msg ) {
			        		  alert('保存失败');
			        	  });
			    });
				</script>
				</c:if>
			</td>
		</tr>
		<tr>
			<td colspan = "7">有害物质标准要求:
				<label><input id="youhaiwuzhi-rohs" class="ajaxCheckbox-youhaiwuzhi" type="checkbox"  ${plan.planItems['youhaiwuzhi-rohs'].itemValue}><span> 要求符合《有害物质限用管理标准》; (若为ROHS工艺请选项)</span></label>
				<label><input id="youhaiwuzhi-qita" class="ajaxCheckbox-youhaiwuzhi" type="checkbox" ${plan.planItems['youhaiwuzhi-qita'].itemValue}><span> 其他要求</span></label>
				<c:if test="${empty param.view}">
				<script>
				$('.ajaxCheckbox-youhaiwuzhi').change(function() {
			        $.ajax({
			        	  method: "POST",
			        	  url: "<%=request.getContextPath()%>/do/plan/save.html",
			        	  data: { name: this.id, pk: this.id, value: this.checked ? 'checked' : ''}
			        	})
			        	  .done(function( msg ) {
			        	  })
			        	  .error(function( msg ) {
			        		  alert('保存失败');
			        	  });
			    });
				</script>
				</c:if>
			</td>
		</tr>
		<tr>
			<td>生产性质（必选）</td>
			<td colspan = "7">
				<label><input id="manufacture-lianchan" class="ajaxCheckbox-manufacture" type="checkbox"  ${plan.planItems['manufacture-lianchan'].itemValue}><span> 量产</span></label>
				<label><input id="manufacture-shichan" class="ajaxCheckbox-manufacture" type="checkbox" ${plan.planItems['manufacture-shichan'].itemValue}><span> 试产（小批量设计验证）</span></label>
				<label><input id="manufacture-softupdate" class="ajaxCheckbox-manufacture" type="checkbox" ${plan.planItems['manufacture-softupdate'].itemValue}><span> 软件升级</span></label>
				<c:if test="${empty param.view}">
				<script>
				$('.ajaxCheckbox-manufacture').change(function() {
			        $.ajax({
			        	  method: "POST",
			        	  url: "<%=request.getContextPath()%>/do/plan/save.html",
			        	  data: { name: this.id, pk: this.id, value: this.checked ? 'checked' : ''}
			        	})
			        	  .done(function( msg ) {
			        	  })
			        	  .error(function( msg ) {
			        		  alert('保存失败');
			        	  });
			    });
				</script>
				</c:if>
			</td>
		</tr>
		<tr>
               <td>委托加工方</td>
               <td>订单批量</td>
               <td>分批投产数量</td>
               <td>预计生产日期</td>
               <td>预计交货日期</td>
			<td colspan = "3">备注</td>
           </tr>
		<tr>
			<td>
			<a href="#" class="editable" id="producer" data-type="text" data-pk="producter" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入委托加工方">
				<c:out value="${plan.planItems['producer'].itemValue}"/>
			</a>
			</td>
			<td>
				<a href="#" class="editable" id="dingdan_total" data-type="text" data-pk="dingdan_total" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入订单批量">
					<c:out value="${plan.planItems['dingdan_total'].itemValue}"/>
				</a>
			</td>
			<td>
				<a href="#" class="editable" id="fenpi_total" data-type="text" data-pk="fenpi_total" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入分批投产数量">
					<c:out value="${plan.planItems['fenpi_total'].itemValue}"/>
				</a>
			</td>
			<td>
				<a href="#" class="editable" id="manufactureDate" data-type="date" data-pk="manufactureDate" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入预计生产日期">
					<c:out value="${plan.planItems['manufactureDate'].itemValue}"/>
				</a>
			</td>
			<td>
				<a href="#" class="editable" id="completeDate" data-type="date" data-pk="completeDate" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入预计交货日期">
					<c:out value="${plan.planItems['completeDate'].itemValue}"/>
				</a>
			</td>
			<td colspan = "3">
				<a href="#" class="editable" id="comment_1" data-type="textarea" data-pk="comment_1" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入备注">
					<c:out value="${plan.planItems['comment_1'].itemValue}"/>
				</a>
			</td>
		</tr>
		<tr>
			<td>备注</td>
			<td colspan = "7" >
				<div id="comments_2" data-type="wysihtml5" data-pk="comments_2">
					<c:out value="${plan.planItems['comments_2'].itemValue}" escapeXml="false"/>
				</div>
				<c:if test="${empty param.view}">
				<script>
				$('#comments_2').editable({
			        url: '<%=request.getContextPath()%>/do/plan/save.html',
			        title: '备注',
			        wysihtml5:{
			        	"font-styles": true, //Font styling, e.g. h1, h2, etc. Default true
			        	"emphasis": true, //Italics, bold, etc. Default true
			        	"lists": true, //(Un)ordered lists, e.g. Bullets, Numbers. Default true
			        	"html": false, //Button which allows you to edit the generated HTML. Default false
			        	"link": false, //Button to insert a link. Default true
			        	"image": false, //Button to insert an image. Default true,
			        	"color": true //Button to change color of font 
			        }
			    });
				</script>
				</c:if>
			</td>
		</tr>
		<tr>
			<td rowspan = "4">客户确认</td>
			<td rowspan = "2">标记</td>
			<td>主板S/N</td>
			<td colspan = "3">
				<a href="#" class="editable" id="zhuban_sn" data-type="text" data-pk="zhuban_sn" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入主板S/N">
					<c:out value="${plan.planItems['zhuban_sn'].itemValue}"/>
				</a>
			</td>
			<td>生产部</td>
			<td>
				<a href="#" class="editable" id="product_part" data-type="text" data-pk="product_part" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入生产部信息">
					<c:out value="${plan.planItems['product_part'].itemValue}"/>
				</a>
			</td>
		</tr>
		<tr>
			<td>IMEI</td>
			<td colspan = "3">
				<a href="#" class="editable" id="imei" data-type="text" data-pk="imei" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入IMEI">
					<c:out value="${plan.planItems['imei'].itemValue}"/>
				</a>
			</td>
			<td>质量部</td>
			<td>
				<a href="#" class="editable" id="quality_part" data-type="text" data-pk="quality_part" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入测试部信息">
					<c:out value="${plan.planItems['quality_part'].itemValue}"/>
				</a>
			</td>
		</tr>
		<tr>
			<td>物料齐套时间</td>
			<td>
				<a href="#" class="editable" id="wuliao_completeDate" data-type="date" data-pk="wuliao_completeDate" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入物料齐套时间">
					<c:out value="${plan.planItems['wuliao_completeDate'].itemValue}"/>
				</a>
			</td>
			<td colspan = "3"></td>
			<td>物流部</td>
			<td>
				<a href="#" class="editable" id="logistics_part" data-type="text" data-pk="logistics_part" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入物流部信息">
					<c:out value="${plan.planItems['logistics_part'].itemValue}"/>
				</a>
			</td>
		</tr>
		<tr>
			<td>客户型号</td>
			<td>
				<a href="#" class="editable" id="customerModel" data-type="text" data-pk="customerModel" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入客户型号">
					<c:out value="${plan.planItems['customerModel'].itemValue}"/>
				</a>
			</td>
			<td colspan = "3"></td>
			<td>产品经理</td>
			<td>
				<a href="#" class="editable" id="productmanager_part" data-type="text" data-pk="productmanager_part" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入产品经理信息">
					<c:out value="${plan.planItems['productmanager_part'].itemValue}"/>
				</a>
			</td>
		</tr>
		<tr>
			<td colspan = "2" rowspan = "3">委托加工确认</td>
			<td>生产日期</td>
			<td colspan = "3">
				<a href="#" class="editable" id="product_Date" data-type="date" data-pk="product_Date" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入生产日期">
					<c:out value="${plan.planItems['product_Date'].itemValue}"/>
				</a>
			</td>
			<td rowspan = "3">签名</td>
			<td rowspan = "3">
				<a href="#" class="editable" id="signature" data-type="text" data-pk="signature" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入签名">
					<c:out value="${plan.planItems['signature'].itemValue}"/>
				</a>
			</td>
		</tr>
		<tr>
			<td>交货日期</td>
			<td colspan = "3">
				<a href="#" class="editable" id="jiaohuo_Date" data-type="date" data-pk="jiaohuo_Date" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入交货日期">
					<c:out value="${plan.planItems['jiaohuo_Date'].itemValue}"/>
				</a>
			</td>
		</tr>
		<tr>
			<td>资料签收</td>
			<td colspan = "3">
				<a href="#" class="editable" id="ziliao_qinashou" data-type="text" data-pk="ziliao_qinashou" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入资料签收">
					<c:out value="${plan.planItems['ziliao_qinashou'].itemValue}"/>
				</a>
			</td>
		</tr>
	</tbody>
</table>

<center>
	<table style="border:0;">
		<tr>
			<th style="width:80px">制表</th>
			<td style="width:160px">${plan.creator.userDispName}</td>
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
</center>
