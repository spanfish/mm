<h3 align="center">杭州涂鸦信息技术有限公司<br>生产工单</h3>
<table class="oms_table" style="margin-left: auto; margin-right: auto; border: 0px">
	<tr>
		<td>订单编号:</td>
		<td>
			<a href="#" class="editable" id="orderNo" data-type="textarea" data-pk="orderNo" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入订单编号">${(plan.planItems['orderNo'].itemValue)!}</a>
		</td>
		<td>工    厂：</td>
		<td>
			<a href="#" class="editable" id="factory" data-type="textarea" data-pk="factory" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入工厂">${(plan.planItems['factory'].itemValue)!}</a>
		</td>
	</tr>
	<tr>
		<td>工单编号:</td>
		<td>
			<a href="#" class="editable" id="gongdanNo" data-type="textarea" data-pk="gongdanNo" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入工单编号">${(plan.planItems['gongdanNo'].itemValue)!}</a>
		</td>
		<td>日    期：</td>
		<td>
			<a href="#" id="orderDate" data-type="date" data-pk="orderDate" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入日期">${(plan.planItems['orderDate'].itemValue)!}
			</a>
		</td>
	</tr>
	<tr>
		<td>SO:</td>
		<td style="width:100px; word-break:break-all;">
			<a href="#" class="editable" id="so_No" data-type="textarea" data-pk="so_No" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入SO">${(plan.planItems['so_No'].itemValue)!}</a>
		</td>
	</tr>
</table>

<table class="oms_table" border="1" style="margin-left: auto;margin-right: auto; width:80%">
    <tbody>
		<tr>
			<th rowspan = "10" style=text-align:left width=9%px>生产资料</th>
			<th style=text-align:left width=9%px>产品名称</th>
			<th style=text-align:left width=20%px>物料编码</th>
			<th style=text-align:left width=21%px>客户模组编码</th>
			<th style=text-align:left width=10%px>产品型号</th>
			<th style=text-align:left width=10%px>信息描述</th>
			<th style=text-align:left width=21%px>订单批量(pcs)</th>
		</tr>
		<tr>
			<td style="width:100px; word-break:break-all;">
				<a href="#" class="editable" id="productName" data-type="textarea" data-pk="productName" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入产品名称">${(plan.planItems['productName'].itemValue)!}</a>
			</td>
			<td style="width:100px; word-break:break-all;">
				<a href="#" class="editable" id="materialNo" data-type="textarea" data-pk="materialNo" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入物料编码">${(plan.planItems['materialNo'].itemValue)!}</a>
			</td>
			<td style="width:100px; word-break:break-all;">
				<a href="#" class="editable" id="custModelNo" data-type="textarea" data-pk="custModelNo" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入客户模组编码">${(plan.planItems['custModelNo'].itemValue)!}</a>
			</td>
			<td style="width:100px; word-break:break-all;">
				<a href="#" class="editable" id="productModel" data-type="textarea" data-pk="productModel" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入产品型号">${(plan.planItems['productModel'].itemValue)!}</a>
			</td>
			<td style="width:120px; word-break:break-all;">
				<a href="#" class="editable" id="product_description" data-type="textarea" data-pk="product_description" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入信息描述">${(plan.planItems['product_description'].itemValue)!}</a>
			</td>
			<td style="width:160px; word-break:break-all;">
				<a href="#" class="editable" id="orderQuantity" data-type="textarea" data-pk="orderQuantity" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入订单批量(pcs)">${(plan.planItems['orderQuantity'].itemValue)!}</a>
			</td>
		</tr>
		<tr>
			<td>类别</td>
			<td colspan="5">
				<label><input ${canWrite!'disabled'} id="cat-biaozhun" class="ajaxCheckbox-cat" type="checkbox" name="cat-biaozhun" ${(plan.planItems['cat-biaozhun'].itemValue)!}><span> 标准模块</span></label>
				<label><input ${canWrite!'disabled'} id="cat-zhuanjieban" class="ajaxCheckbox-cat" type="checkbox" name="cat-zhuanjieban" ${(plan.planItems['cat-zhuanjieban'].itemValue)!}><span> 转接板模块</span></label>
				<#if canWrite??>
				<script>
					$('.ajaxCheckbox-cat').change(function() {
				        $.ajax({
				        	  method: "POST",
				        	  url: "${(rc.getContextPath())!}/do/plan/save.html",
				        	  data: { name: this.name, pk: this.name, value: this.checked ? 'checked' : ''}
				        	})
				        	  .done(function( msg ) {
				        	  })
				        	  .error(function( msg ) {
				        		  alert('保存失败');
				        	  });
				    });
				</script>
				</#if>
			</td>
		</tr>
		<tr>
			<td>生产BOM</td>
			<td style="word-break:break-all;" colspan = "3">
				<a href="#" id="bom" data-type="textarea" data-pk="bom" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入生产BOM">${(plan.planItems['bom'].itemValue)!}</a>
				<#if canWrite??>
				<script>
					$(function(){
					    $('#bom').editable({
					        url: '${(rc.getContextPath())!}/do/plan/save.html',
					        title: '生产BOM',
					        rows: 2
					    });
					});
				</script>
				</#if>
			</td>
			<td>BOM版本</td>
			<td>
				<a href="#" id="bomVer" data-type="textarea" data-pk="bomVer" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入BOM版本">${(plan.planItems['bomVer'].itemValue)!}</a>
				<#if canWrite??>
				<script>
					$(function(){
					    $('#bomVer').editable({
					        url: '${(rc.getContextPath())!}/do/plan/save.html',
					        title: 'BOM版本',
					        rows: 2
					    });
					});
				</script>
				</#if>
			</td>
		</tr>
		<tr>
			<td>固件KEY</td>
			<td style="word-break:break-all;" colspan = "3">
				<a href="#" id="firwareKey" data-type="textarea" data-pk="firwareKey" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入固件KEY">${(plan.planItems['firwareKey'].itemValue)!}</a>
				<#if canWrite??>
				<script>
					$(function(){
					    $('#firwareKey').editable({
					        url: '${(rc.getContextPath())!}/do/plan/save.html',
					        title: '固件KEY',
					        rows: 2
					    });
					});
				</script>
				</#if>
			</td>
			<td>固件版本</td>
			<td>
				<a href="#" id="firwareVer" data-type="textarea" data-pk="firwareVer" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入固件版本">${(plan.planItems['firwareVer'].itemValue)!}</a>
				<#if canWrite??>
				<script>
					$(function(){
					    $('#firwareVer').editable({
					        url: '${(rc.getContextPath())!}/do/plan/save.html',
					        title: '固件版本',
					        rows: 2
					    });
					});
				</script>
				</#if>
			</td>
		</tr>
		<tr>
			<td>固件名称</td>
			<td style="word-break:break-all;" colspan = "3">
				<a href="#" id="firwareName" data-type="textarea" data-pk="firwareName" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入固件名称">${(plan.planItems['firwareName'].itemValue)!}</a>
				<#if canWrite??>
				<script>
					$(function(){
					    $('#firwareName').editable({
					        url: '${(rc.getContextPath())!}/do/plan/save.html',
					        title: '固件名称',
					        rows: 2
					    });
					});
				</script>
				</#if>
			</td>
			<td>热点名称</td>
			<td>
				<a href="#" id="hotspotName" data-type="textarea" data-pk="hotspotName" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入热点名称">${(plan.planItems['hotspotName'].itemValue)!}</a>
				<#if canWrite??>
				<script>
					$(function(){
					    $('#hotspotName').editable({
					        url: '${(rc.getContextPath())!}/do/plan/save.html',
					        title: '热点名称',
					        rows: 2
					    });
					});
				</script>
				</#if>
			</td>
		</tr>
		<tr>
			<td>SMT资料包</td>
			<td colspan = "3"><a href="#" id="smtDocPackage" data-type="textarea" data-pk="smtDocPackage" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入SMT资料包">${(plan.planItems['smtDocPackage'].itemValue)!}</a>
				<#if canWrite??>
				<script>
					$(function(){
					    $('#smtDocPackage').editable({
					    	url: '${(rc.getContextPath())!}/do/plan/save.html',
					        title: 'SMT资料包',
					        rows: 5
					    });
					});
				</script>
				</#if>
			</td>
			<th>FLASH烧录软件</th>
			<td>
				<a href="#" class="editable" id="flashSoft" data-type="textarea" data-pk="flashSoft" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入FLASH烧录软件">
					<#if plan.planItems["flashSoft"]?has_content>${plan.planItems['flashSoft'].itemValue}</#if></a>
			</td>
		</tr>
		<tr>
			<td>硬件测试工具</td>
			<td colspan = "3">
				<a href="#" id="hardwareTestTool" data-type="textarea" data-pk="hardwareTestTool" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入硬件测试工具">
				<#if plan.planItems["hardwareTestTool"]?has_content>${plan.planItems['hardwareTestTool'].itemValue}</#if></a>
	
				<script>
				$(function(){
				    $('#hardwareTestTool').editable({
				        url: '${(rc.getContextPath())!}/do/plan/save.html',
				        title: '硬件测试工具',
				        rows: 2
				    });
				});
				</script>

			</td>
			<th>check软件名称</th>
			<td>
				<a href="#" class="editable" id="checkSoftName" data-type="textarea" data-pk="checkSoftName" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入check软件名称">
					<#if plan.planItems["checkSoftName"]?has_content>${plan.planItems['checkSoftName'].itemValue}</#if></a>
			</td>
		</tr>
		<tr>
			<th>授权激活码</th>
			<td colspan = "4">
				<a href="#" class="editable" id="authKey" data-type="textarea" data-pk="authKey" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入授权激活码">
					<#if plan.planItems["authKey"]?has_content>${plan.planItems['authKey'].itemValue}</#if></a>
			</td>
			<td></td>
		</tr>
		<tr>
			<th>激活测试软件名称</th>
			<td colspan = "5">
				<a href="#" class="editable" id="authSoftName" data-type="textarea" data-pk="authSoftName" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入激活测试软件名称">
					<#if plan.planItems["authSoftName"]?has_content>${plan.planItems['authSoftName'].itemValue}</#if></a>
			</td>
		</tr>
		<tr>
			<td style="width:140px; word-break:break-all;" rowspan = "2" colspan="2">绿色产品<br/>生产要求(必选)</td>
			<td colspan = "5">工艺要求：
				<#if plan.planItems["fabrication-wuqian"]?has_content>
					<label><input id="fabrication-wuqian" class="ajaxCheckbox-fabrication" type="checkbox" ${plan.planItems['fabrication-wuqian'].itemValue}><span> 无铅工艺</span></label>
				<#else>
					<label><input id="fabrication-wuqian" class="ajaxCheckbox-fabrication" type="checkbox"><span> 无铅工艺</span></label>
				</#if>
				
				<#if plan.planItems["fabrication-youqian"]?has_content>
					<label><input id="fabrication-youqian" class="ajaxCheckbox-fabrication" type="checkbox" ${plan.planItems['fabrication-youqian'].itemValue}><span> 有铅工艺</span></label>
				<#else>
					<label><input id="fabrication-youqian" class="ajaxCheckbox-fabrication" type="checkbox"><span> 有铅工艺</span></label>
				</#if>

				<script>
				$('.ajaxCheckbox-fabrication').change(function() {
			        $.ajax({
			        	  method: "POST",
			        	  url: "${(rc.getContextPath())!}/do/plan/save.html",
			        	  data: { name: this.id, pk: this.id, value: this.checked ? 'checked' : ''}
			        	})
			        	  .done(function( msg ) {
			        	  })
			        	  .error(function( msg ) {
			        		  alert('保存失败');
			        	  });
			    });
				</script>
			</td>
		</tr>
		<tr>
			<td colspan = "5">有害物质标准要求:
			<#if plan.planItems["youhaiwuzhi-rohs"]?has_content>
				<label><input id="youhaiwuzhi-rohs" class="ajaxCheckbox-youhaiwuzhi" type="checkbox"  ${plan.planItems['youhaiwuzhi-rohs'].itemValue}><span> 要求符合《有害物质限用管理标准》; (若为ROHS工艺请选项)</span></label>
			<#else>
				<label><input id="youhaiwuzhi-rohs" class="ajaxCheckbox-youhaiwuzhi" type="checkbox"><span> 要求符合《有害物质限用管理标准》; (若为ROHS工艺请选项)</span></label>
			</#if>
			
			<#if plan.planItems["youhaiwuzhi-qita"]?has_content>
				<label><input id="youhaiwuzhi-qita" class="ajaxCheckbox-youhaiwuzhi" type="checkbox" ${plan.planItems['youhaiwuzhi-qita'].itemValue}><span> 其他要求</span></label>
			<#else>
				<label><input id="youhaiwuzhi-qita" class="ajaxCheckbox-youhaiwuzhi" type="checkbox" ><span> 其他要求</span></label>
			</#if>

				<script>
				$('.ajaxCheckbox-youhaiwuzhi').change(function() {
			        $.ajax({
			        	  method: "POST",
			        	  url: "${(rc.getContextPath())!}/do/plan/save.html",
			        	  data: { name: this.id, pk: this.id, value: this.checked ? 'checked' : ''}
			        	})
			        	  .done(function( msg ) {
			        	  })
			        	  .error(function( msg ) {
			        		  alert('保存失败');
			        	  });
			    });
				</script>

			</td>
		</tr>
		<tr>
			<td colspan="2">生产性质（必选）</td>
			<td colspan = "5">
			<#if plan.planItems["manufacture-lianchan"]?has_content>
				<label><input id="manufacture-lianchan" class="ajaxCheckbox-manufacture" type="checkbox"  ${plan.planItems['manufacture-lianchan'].itemValue}><span> 量产</span></label>
			<#else>
				<label><input id="manufacture-lianchan" class="ajaxCheckbox-manufacture" type="checkbox"><span> 量产</span></label>
			</#if>
			
			<#if plan.planItems["manufacture-shichan"]?has_content>
				<label><input id="manufacture-shichan" class="ajaxCheckbox-manufacture" type="checkbox" ${plan.planItems['manufacture-shichan'].itemValue}><span> 试产（小批量设计验证）</span></label>
			<#else>
				<label><input id="manufacture-shichan" class="ajaxCheckbox-manufacture" type="checkbox"><span> 试产（小批量设计验证）</span></label>
			</#if>
			
			<#if plan.planItems["manufacture-softupdate"]?has_content>
				<label><input id="manufacture-softupdate" class="ajaxCheckbox-manufacture" type="checkbox" ${plan.planItems['manufacture-softupdate'].itemValue}><span> 软件升级</span></label>
			<#else>
				<label><input id="manufacture-softupdate" class="ajaxCheckbox-manufacture" type="checkbox"><span> 软件升级</span></label>
			</#if>

				<script>
				$('.ajaxCheckbox-manufacture').change(function() {
			        $.ajax({
			        	  method: "POST",
			        	  url: "${(rc.getContextPath())!}/do/plan/save.html",
			        	  data: { name: this.id, pk: this.id, value: this.checked ? 'checked' : ''}
			        	})
			        	  .done(function( msg ) {
			        	  })
			        	  .error(function( msg ) {
			        		  alert('保存失败');
			        	  });
			    });
				</script>

			</td>
		</tr>
		<tr>
			<th height=10%>预计生产日期</th>
			<td colspan = "3">
				<a href="#" class="editable" id="manufactureDate" data-type="date" data-pk="manufactureDate" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入预计生产日期">
					<#if plan.planItems["manufactureDate"]?has_content>${plan.planItems['manufactureDate'].itemValue}</#if></a>
			</td>
			<th>预计交货日期</th>
			<td colspan = "2">
				<a href="#" class="editable" id="completeDate" data-type="date" data-pk="completeDate" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入预计交货日期">
					<#if plan.planItems["completeDate"]?has_content>${plan.planItems['completeDate'].itemValue}</#if></a>
			</td>
		</tr>
		<tr>
			<th rowspan = "2" height=10%>客户要求</th>
			<th>客户订单号</th>
			<th>物料编码</th>
			<th>物料型号</th>
			<th>model号</th>
			<th colspan = "2">批次号</th>
		</tr>
		<tr>
			<td>
			<a href="#" class="editable" id="custOrderNo" data-type="textarea" data-pk="custOrderNo" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入客户订单号">
				<#if plan.planItems["custOrderNo"]?has_content>${plan.planItems['custOrderNo'].itemValue}</#if></a>
			</td>
			<td>
				<a href="#" class="editable" id="custMaterialNo" data-type="textarea" data-pk="custMaterialNo" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入物料编码">
					<#if plan.planItems["custMaterialNo"]?has_content>${plan.planItems['custMaterialNo'].itemValue}</#if></a>
			</td>
			<td>
				<a href="#" class="editable" id="materialModel" data-type="textarea" data-pk="materialModel" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入物料型号">
					<#if plan.planItems["materialModel"]?has_content>${plan.planItems['materialModel'].itemValue}</#if></a>
			</td>
			
			<td>
				<a href="#" class="editable" id="modelNo" data-type="textarea" data-pk="modelNo" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入model号">
					<#if plan.planItems["modelNo"]?has_content>${plan.planItems['modelNo'].itemValue}</#if></a>
			</td>
			<td colspan = "2">
				<a href="#" class="editable" id="sequenceNo" data-type="textarea" data-pk="sequenceNo" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入批次号">
					<#if plan.planItems["sequenceNo"]?has_content>${plan.planItems['sequenceNo'].itemValue}</#if></a>
			</td>
		</tr>
		<tr>
			<th height=5%>标签</th>
			<td colspan = "6">
				<a href="#" class="editable" id="mark" data-type="textarea" data-pk="mark" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入标签">
				<#if plan.planItems["mark"]?has_content>${plan.planItems['mark'].itemValue}</#if></a>
			</td>
		</tr>
		<tr>
			<th height=10%>其他备注</th>
			<td colspan = "6" >
				<div id="comments_2" data-type="wysihtml5" data-pk="comments_2">
					<#if plan.planItems["comments_2"]?has_content>${plan.planItems['comments_2'].itemValue}</#if>
				</div>

				<script>
				$('#comments_2').editable({
			        url: '${(rc.getContextPath())!}/do/plan/save.html',
			        title: '其他备注',
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
			</td>
		</tr>
	</tbody>
</table>
<#if canWrite??>
	<script>
		$('#orderDate').editable({
			placement: 'bottom'
		});
		
		$.fn.editable.defaults.mode = 'popup';
	
		$(document).ready(function() {
			$('.editable').editable();
		});
	</script>
</#if>