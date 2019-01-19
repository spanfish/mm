<h4 align="center">杭州中科微电子有限公司<br>生产计划通知书</h4>
<table class="oms_table" style="margin-left: auto; margin-right: auto; border: 0px">
		<tr>
			<td style="width:100px">文件编号:</td>
			<td style="width:200px">
				<a href="#" class="editable" id="file_No" data-type="text" data-pk="file_No" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入文件编号">${(plan.planItems['file_No'].itemValue)!}
				</a>
			</td>
			<td style="width:100px">日    期：</td>
			<td style="width:200px">
				<a href="#" id="orderDate" data-type="date" data-pk="orderDate" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入日期">${(plan.planItems['orderDate'].itemValue)!}
				</a>
			</td>
		</tr>
		<tr>
			<td style="width:100px";>收件部门:</td>
			<td style="width:200px">
				<a href="#" class="editable" id="shoujian_part" data-type="text" data-pk="shoujian_part" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入文件编号">${(plan.planItems['shoujian_part'].itemValue)!}
				</a>
			</td>
		</tr>
</table>

<table class="oms_table" border="1" style="margin-left: auto;margin-right: auto; width:80%">
    <tbody>
		<tr>
			<td style="width:100px" rowspan = "8"  word-break:break-all >生产资料</td>
			<td style="width:100px">产品名称 </td>
			<td style="width:200px">产品型号 </td>
			<td style="width:200px">PCB 版本号 </td>
			<td colspan = "2" style="width:200px">客户</td>
		</tr>
		<tr>
			<td style="width:100px" word-break:break-all;>
				<a href="#" class="editable" id="productName" data-placement="bottom" data-type="textarea" data-pk="productName" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入产品名称">${(plan.planItems['productName'].itemValue)!}</a>
			</td>
			<td style="width:200px" word-break:break-all;>
				<a href="#" class="editable" id="productModel" data-placement="bottom" data-type="textarea" data-pk="productModel" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入产品型号">${(plan.planItems['productModel'].itemValue)!}</a>
			</td>
			<td style="width:200px" word-break:break-all;>
				<a href="#" class="editable" id="pcbVer" data-placement="bottom" data-type="textarea" data-pk="pcbVer" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入PCB版本号 ">${(plan.planItems['pcbVer'].itemValue)!}</a>
			</td>
			<td style="width:200px" word-break:break-all; colspan = "2">
				<a href="#" class="editable" id="client" data-placement="bottom" data-type="textarea" data-pk="client" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入客户 ">${(plan.planItems['client'].itemValue)!}</a>
			</td>
		</tr>
		<tr>
			<td style="width:100px">BOM编号</td>
			<td style="width:400px" style="word-break:break-all;" colspan = "2">
				<a href="#" id="bom" data-type="textarea" data-pk="bom" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入BOM编号">${(plan.planItems['bom'].itemValue)!}</a>
				<#if canWrite??>
				<script>
					$(function(){
					    $('#bom').editable({
					        url: '${(rc.getContextPath())!}/do/plan/save.html',
					        title: 'BOM编号',
					        rows: 2
					    });
					});
				</script>
				</#if>
			</td>
			<td style="width:100px" rowspan ="3">项目经理</td>
			<td style="width:100px" rowspan ="3">
				<a href="#" id="custel" data-type="textarea" data-pk="custel" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入项目经理">${(plan.planItems['custel'].itemValue)!}</a>
				<#if canWrite??>
				<script>
					$(function(){
					    $('#custel').editable({
					        url: '${(rc.getContextPath())!}/do/plan/save.html',
					        title: '项目经理',
					        rows: 2
					    });
					});
				</script>
				</#if>
			</td>
		</tr>
		<tr>
			<td style="width:100px">SMT资料包</td>
			<td style="width:400px" colspan = "2" word-break:break-all;><a href="#" id="smtDocPackage" data-type="textarea" data-pk="smtDocPackage" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入SMT资料包">${(plan.planItems['smtDocPackage'].itemValue)!}</a>
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
		</tr>
		<tr>
			<td style="width:100px">生产软件</td>
			<td style="width:400px" colspan = "2" word-break:break-all;><a href="#" id="softwareVer" data-type="textarea" data-pk="softwareVer" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入生产软件">${(plan.planItems['softwareVer'].itemValue)!}</a>
				<#if canWrite??>
				<script>
					$(function(){
					    $('#softwareVer').editable({
					    	url: '${(rc.getContextPath())!}/do/plan/save.html',
					        title: '生产软件',
					        rows: 5
					    });
					});
				</script>
				</#if>
			</td>
		</tr>
		<tr>
			<td style="width:100px">测试要求</td>
			<td style="width:400px" colspan = "2"><a href="#" id="test_request" data-type="textarea" data-pk="test_request" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入测试要求">${(plan.planItems['test_request'].itemValue)!}</a>
				<#if canWrite??>
				<script>
					$(function(){
					    $('#test_request').editable({
					    	url: '${(rc.getContextPath())!}/do/plan/save.html',
					        title: '测试要求',
					        rows: 5
					    });
					});
				</script>
				</#if>
			</td>
			<td style="width:100px">测试比率<br>烧录要求</td>
			<td style="width:100px"><a href="#" id="testrate_request" data-type="textarea" data-pk="testrate_request" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入测试比率烧录要求">${(plan.planItems['testrate_request'].itemValue)!}</a>
				<#if canWrite??>
				<script>
					$(function(){
					    $('#testrate_request').editable({
					    	url: '${(rc.getContextPath())!}/do/plan/save.html',
					        title: '测试比率烧录要求',
					        rows: 5
					    });
					});
				</script>
				</#if>
			</td>
		</tr>
		<tr>
			<td style="width:100px">插件要求</td>
			<td style="width:400px" colspan = "2"><a href="#" id="chajian_request" data-type="textarea" data-pk="chajian_request" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入插件要求">${(plan.planItems['chajian_request'].itemValue)!}</a>
				<#if canWrite??>
				<script>
					$(function(){
					    $('#chajian_request').editable({
					    	url: '${(rc.getContextPath())!}/do/plan/save.html',
					        title: '插件要求',
					        rows: 5
					    });
					});
				</script>
				</#if>
			</td>
			<td style="width:100px">波峰焊夹具<br>到位时间</td>
			<td style="width:100px"><a href="#" id="bofeng_time" data-type="date" data-pk="bofeng_time" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入波峰焊夹具到位时间">${(plan.planItems['bofeng_time'].itemValue)!}</a>
				<#if canWrite??>
				<script>
					$(function(){
					    $('#bofeng_time').editable({
					    	url: '${(rc.getContextPath())!}/do/plan/save.html',
					        title: '波峰焊夹具到位时间',
					        rows: 5
					    });
					});
				</script>
				</#if>
			</td>
		</tr>
		<tr>
			<td style="width:100px">焊接要求</td>
			<td style="width:400px" colspan = "2"><a href="#" id="hanjie_request" data-type="textarea" data-pk="hanjie_request" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入焊接要求">${(plan.planItems['hanjie_request'].itemValue)!}</a>
				<#if canWrite??>
				<script>
					$(function(){
					    $('#hanjie_request').editable({
					    	url: '${(rc.getContextPath())!}/do/plan/save.html',
					        title: '焊接要求',
					        rows: 5
					    });
					});
				</script>
				</#if>
			</td>
			<td style="width:100px">托盘夹具<br>到位时间</td>
			<td style="width:100px"><a href="#" id="jiaju_time" data-type="date" data-pk="jiaju_time" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入托盘夹具到位时间">${(plan.planItems['jiaju_time'].itemValue)!}</a>
				<#if canWrite??>
				<script>
					$(function(){
					    $('#jiaju_time').editable({
					    	url: '${(rc.getContextPath())!}/do/plan/save.html',
					        title: '托盘夹具到位时间',
					        rows: 5
					    });
					});
				</script>
				</#if>
			</td>
		</tr>
		<tr>
			<td style="width:100px">生产性质<br>（必选）</td>
			<td style="width:700px" colspan = "5">
			<#if plan.planItems["manufacture-shichan"]?has_content>
				<label><input ${canWrite!'disabled'} id="manufacture-shichan" class="ajaxCheckbox-manufacture" type="checkbox" ${plan.planItems['manufacture-shichan'].itemValue}><span> 试产</span></label>
			<#else>
				<label><input ${canWrite!'disabled'} id="manufacture-shichan" class="ajaxCheckbox-manufacture" type="checkbox"><span> 试产</span></label>
			</#if>
			
			<#if plan.planItems["manufacture-lianchan"]?has_content>
				<label><input ${canWrite!'disabled'} id="manufacture-lianchan" class="ajaxCheckbox-manufacture" type="checkbox"  ${plan.planItems['manufacture-lianchan'].itemValue}><span> 量产</span></label>
			<#else>
				<label><input ${canWrite!'disabled'} id="manufacture-lianchan" class="ajaxCheckbox-manufacture" type="checkbox"><span> 量产</span></label>
			</#if>
			
			<#if plan.planItems["manufacture-updata"]?has_content>
				<label><input ${canWrite!'disabled'} id="manufacture-updata" class="ajaxCheckbox-manufacture" type="checkbox" ${plan.planItems['manufacture-updata'].itemValue}><span> 软件升级</span></label>
			<#else>
				<label><input ${canWrite!'disabled'} id="manufacture-updata" class="ajaxCheckbox-manufacture" type="checkbox"><span> 软件升级</span></label>
			</#if>
			
			<#if plan.planItems["manufacture-fangong"]?has_content>
				<label><input ${canWrite!'disabled'} id="manufacture-fangong" class="ajaxCheckbox-manufacture" type="checkbox" ${plan.planItems['manufacture-fangong'].itemValue}><span> 返工</span></label>
			<#else>
				<label><input ${canWrite!'disabled'} id="manufacture-fangong" class="ajaxCheckbox-manufacture" type="checkbox"><span> 返工</span></label>
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
			<td style="width:100px" rowspan = "2">
			<#if plan.planItems["manufacture1-change"]?has_content>
				<label><input ${canWrite!'disabled'} id="manufacture1-change" class="ajaxCheckbox-manufacture1" type="checkbox" ${plan.planItems['manufacture1-change'].itemValue}><span> 变更</span></label>
			<#else>
				<label><input ${canWrite!'disabled'} id="manufacture1-change" class="ajaxCheckbox-manufacture1" type="checkbox"><span> 变更</span></label>
			</#if>
				<script>
				$('.ajaxCheckbox-manufacture1').change(function() {
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
			<th style="width:100px">原计划编号</th>
			<td style="width:200px" word-break:break-all;>
				<a href="#" class="editable" id="plan_code" data-type="textarea" data-pk="plan_code" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入原计划编号 ">${(plan.planItems['plan_code'].itemValue)!}</a>
			</td>
			<th style="width:200px" rowspan = "2">销售</th>
			<td colspan= "2" rowspan = "2" style="width:200px" align="left">
				<label><input ${canWrite!'disabled'} id="sale-domestic" class="ajaxCheckbox" type="checkbox" ${(plan.planItems["sale-domestic"].itemValue)!''}><span> 内销</span></label>
				<label><input ${canWrite!'disabled'} id="sale-export" class="ajaxCheckbox" type="checkbox" ${(plan.planItems['sale-export'].itemValue)!''}><span> 外销</span></label>
				<#if canWrite??>
					<script>
					$('.ajaxCheckbox').change(function() {
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
				</#if>
			</td>	
		</tr>
		<tr>
			<th style="width:100px">变更内容</th>
			<td style="width:200px">
				<a href="#" class="editable" id="change_message" data-type="textarea" data-pk="change_message" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入变更内容">
					<#if plan.planItems["change_message"]?has_content>${plan.planItems['change_message'].itemValue}</#if></a>
			</td>
		</tr>
		<tr>
           <td style="width:100px">委托加工方</td>
           <td style="width:100px">订单批量</td>
           <td style="width:200px">分批投产数量</td>
           <td style="width:200px">预计生产日期</td>
           <td style="width:200px" colspan = "2">预计交货日期</td>
        </tr>
		<tr>
			<td style="width:100px">
			<a href="#" class="editable" id="jiagong_customer" data-type="textarea" data-pk="jiagong_customer" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入委托加工方">
					<#if plan.planItems["jiagong_customer"]?has_content>${plan.planItems['jiagong_customer'].itemValue}</#if></a>
			</td>
			<td style="width:100px">
				<a href="#" class="editable" id="dingdan_total" data-type="textarea" data-pk="dingdan_total" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入订单批量">
					<#if plan.planItems["dingdan_total"]?has_content>${plan.planItems['dingdan_total'].itemValue}</#if></a>
			</td>
			<td style="width:200px">
				<a href="#" class="editable" id="fenpi_total" data-type="textarea" data-pk="fenpi_total" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入分批投产数量">
					<#if plan.planItems["fenpi_total"]?has_content>${plan.planItems['fenpi_total'].itemValue}</#if></a>
			</td>
			<td style="width:200px">
				<a href="#" class="editable" id="manufactureDate" data-type="date" data-pk="manufactureDate" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入预计生产日期">
					<#if plan.planItems["manufactureDate"]?has_content>${plan.planItems['manufactureDate'].itemValue}</#if></a>
			</td>
			<td style="width:200px" colspan = "2">
				<a href="#" class="editable" id="completeDate" data-type="date" data-pk="completeDate" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入预计交货日期">
					<#if plan.planItems["completeDate"]?has_content>${plan.planItems['completeDate'].itemValue}</#if></a>
			</td>
		</tr>
		<tr>
			<td style="width:100px">出货方式<br>（或要求）</td>
			<td style="width:700px" colspan = "5" >
				<a href="#" class="editable" id="chuhuo_request" data-type="textarea" data-pk="chuhuo_request" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入出货方式（或要求）">
					<#if plan.planItems["chuhuo_request"]?has_content>${plan.planItems['chuhuo_request'].itemValue}</#if></a>
			</td>
		</tr>
		<tr>
			<td style="width:100px">备注</td>
			<td style="width:700px" colspan = "5" >
				<div ${canWrite!'disabled'} id="comments" data-type="wysihtml5" data-pk="comments">
					<#if plan.planItems["comments"]?has_content>${plan.planItems['comments'].itemValue}</#if>
				</div>
				<#if canWrite??>
				<script>
				$('#comments').editable({
			        url: '${(rc.getContextPath())!}/do/plan/save.html',
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
				</#if>
			</td>
		</tr>
		<tr>
			<th style="width:100px" rowspan = "7">确认</th>
			<th style="width:100px" rowspan = "2">标记</th>
			<th style="width:2000px">S/N编码要求</th>
			<td style="width:200px">
				<a href="#" class="editable" id="request_sn" data-type="textarea" data-pk="request_sn" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入S/N编码要求">
					<#if plan.planItems["request_sn"]?has_content>${plan.planItems['request_sn'].itemValue}</#if></a>
			</td>
			<th style="width:100px">生产部</th>
			<td style="width:100px">
				<a href="#" class="editable" id="product_part" data-type="textarea" data-pk="product_part" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入生产部">
					<#if plan.planItems["product_part"]?has_content>${plan.planItems['product_part'].itemValue}</#if></a>
			</td>
		</tr>
		<tr>
			<th style="width:200px">BI标签</th>
			<td style="width:200px">
				<a href="#" class="editable" id="bi_sn" data-type="textarea" data-pk="bi_sn" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入BI标签">
					<#if plan.planItems["bi_sn"]?has_content>${plan.planItems['bi_sn'].itemValue}</#if></a>
			</td>
			<th style="width:100px">质量部</th>
			<td style="width:100px">
				<a href="#" class="editable" id="zhiliang_part" data-type="textarea" data-pk="zhiliang_part" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入质量部">
					<#if plan.planItems["zhiliang_part"]?has_content>${plan.planItems['zhiliang_part'].itemValue}</#if></a>
			</td>
		</tr>
		<tr>
			<th style="width:300px" colspan = "2">销售订单编号</th>
			<td style="width:200px">
				<a href="#" class="editable" id="sale_code" data-type="textarea" data-pk="sale_code" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入销售订单编号">
					<#if plan.planItems["sale_code"]?has_content>${plan.planItems['sale_code'].itemValue}</#if></a>
			</td>
			<th style="width:100px" rowspan = "2">产品经理</th>
			<td style="width:100px" rowspan = "2">
				<a href="#" class="editable" id="manage_name" data-type="textarea" data-pk="manage_name" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入产品经理">
					<#if plan.planItems["manage_name"]?has_content>${plan.planItems['manage_name'].itemValue}</#if></a>
			</td>
		</tr>
		<tr>
			<th style="width:300px" colspan = "2">客户名称</th>
			<td style="width:200px">
				<a href="#" class="editable" id="client_name" data-type="textarea" data-pk="client_name" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入客户名称">
					<#if plan.planItems["client_name"]?has_content>${plan.planItems['client_name'].itemValue}</#if></a>
			</td>
		</tr>
		<tr>
			<th style="width:100px" rowspan = "3">委托加工方</th>
			<th style="width:200px">生产日期</th>
			<td style="width:200px">
				<a href="#" class="editable" id="product_Date" data-type="date" data-pk="product_Date" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入生产日期">
					<#if plan.planItems["product_Date"]?has_content>${plan.planItems['product_Date'].itemValue}</#if></a>
			</td>
			<th style="width:100px" rowspan = "3">签名</th>
			<td style="width:100px" rowspan = "3">
				<a href="#" class="editable" id="qianming" data-type="textarea" data-pk="qianming" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入签名">
					<#if plan.planItems["qianming"]?has_content>${plan.planItems['qianming'].itemValue}</#if></a>
			</td>
		</tr>
		<tr>
			<th style="width:200px">交货日期</th>
			<td style="width:200px">
				<a href="#" class="editable" id="commit_Date" data-type="date" data-pk="commit_Date" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入交货日期">
					<#if plan.planItems["commit_Date"]?has_content>${plan.planItems['commit_Date'].itemValue}</#if></a>
			</td>
		</tr>
		<tr>
			<th style="width:200px">资料签收</th>
			<td style="width:200px">
				<a href="#" class="editable" id="file_qianming" data-type="textarea" data-pk="file_qianming" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入资料签收">
					<#if plan.planItems["file_qianming"]?has_content>${plan.planItems['file_qianming'].itemValue}</#if></a>
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

<center>
	<table style="border:0;">
		<tr>
			<th style="width:80px">制表</th>
			<td style="width:160px">${plan.creator.userDispName}</td>
			<th style="width:80px">审核</th>
			<td style="width:160px">
				<#if plan.reviewStatus == 'REJECTED' || plan.reviewStatus == 'APPROVED'>
				<div class="stamp stamp-${plan.reviewStatus}">
					<span>${plan.reviewDate?string["yyyy-MM-dd"]}</span>
					<span>${plan.reviewer.userDispName}</span>
				</div>
				</#if>
			</td>
			<th style="width:80px">承认</th>
			<td style="width:160px">
				<#if plan.approveStatus == 'REJECTED' || plan.approveStatus == 'APPROVED'>
				<div class="stamp stamp-${plan.approveStatus}">
					<span>${plan.approveDate?string["yyyy-MM-dd"]}</span>
					<span>${plan.approver.userDispName}</span>
				</div>
				</#if>
			</td>
			<td></td>
		</tr>
	</table>
</center>