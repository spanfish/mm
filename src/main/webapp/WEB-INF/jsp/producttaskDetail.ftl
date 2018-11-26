<h3 align="center">生产任务-加工说明</h3>
<table class="oms_table" style="margin-left: auto; margin-right: auto; border: 0px">
	<tr>
		<td style="width:100px";>加工单位:</td>
		<td style="width:200px" align="left">
			<div style="width:200px; text-align:left; word-wrap:break-word">
			<a href="#" id="customer" data-type="textarea" data-pk="customer" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入加工单位">
				${(plan.customer)!""}</a>
			</div>
			<#if canWrite??>
				<script>
				$('#customer').editable({
					placement: 'bottom'
				});
				</script>
			</#if>
		</td>
		<td>文件编号:</td>
		<td colspan = "2">
			<a href="#" class="editable" id="file_No" data-type="textarea" data-placement="bottom" data-pk="file_No" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入文件编号">${(plan.planItems['file_No'].itemValue)!}</a>
		</td>
	</tr>
</table>
<br>
<table class="oms_table" border="1" style="margin-left: auto;margin-right: auto; width:80%">
    <tbody>
    	<tr>
			<td>生产性质（必选）</td>
			<td colspan = "4">
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
			<td style="width:140px; word-break:break-all;" rowspan = "13" Align = left width=10%px>生产资料</td>
			<td width=15%px>工单号</td>
			<td width=25%px>产品型号</td>
			<td width=25%px>PCB 版本号</td>
			<td width=25%px>订单数量</td>
		</tr>
		<tr>
			<td style="width:100px; word-break:break-all;">
				<a href="#" class="editable" id="list_number" data-type="textarea" data-pk="list_number" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入工单号">${(plan.planItems['list_number'].itemValue)!}</a>
			</td>
			<td style="width:100px; word-break:break-all;">
				<a href="#" class="editable" id="productModel" data-type="textarea" data-pk="productModel" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入产品型号">${(plan.planItems['productModel'].itemValue)!}</a>
			</td>
			<td style="width:60px; word-break:break-all;">
				<a href="#" class="editable" id="pcbVer" data-type="text" data-pk="pcbVer" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入PCB版本号 ">${(plan.planItems['pcbVer'].itemValue)!}</a>
			</td>
			<td style="width:160px; word-break:break-all;">
				<a href="#" class="editable" id="product_num" data-type="textarea" data-pk="product_num" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入订单数量">${(plan.planItems['product_num'].itemValue)!}</a>
			</td>
		</tr>
		<tr>
			<td>类别</td>
			<td colspan="3">
				<label><input ${canWrite!'disabled'} id="cat-zhengji" class="ajaxCheckbox-cat" type="checkbox" name="cat-zhengji" ${(plan.planItems['cat-zhengji'].itemValue)!}><span> 整机</span></label>
				<label><input ${canWrite!'disabled'} id="cat-pcba" class="ajaxCheckbox-cat" type="checkbox" name="cat-pcba" ${(plan.planItems['cat-pcba'].itemValue)!}><span> PCBA</span></label>
				<label><input ${canWrite!'disabled'} id="cat-jitou" class="ajaxCheckbox-cat" type="checkbox" name="cat-jitou" ${(plan.planItems['cat-jitou'].itemValue)!}><span> 机头</span></label>
				<label><input ${canWrite!'disabled'} id="cat-other" class="ajaxCheckbox-cat" type="checkbox" name="cat-other" ${(plan.planItems['cat-other'].itemValue)!}><span> 其他</span></label>
				<label><input ${canWrite!'disabled'} id="cat-mokuai" class="ajaxCheckbox-cat" type="checkbox" name="cat-mokuai" ${(plan.planItems['cat-mokuai'].itemValue)!}><span> 模块</span></label>
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
		</tr>
		<tr>
			<td>贴片BOM</td>
			<td style="word-break:break-all;" colspan = "3">
				<a href="#" id="bom" data-type="textarea" data-pk="bom" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入贴片BOM">${(plan.planItems['bom'].itemValue)!}</a>
				<#if canWrite??>
				<script>
					$(function(){
					    $('#bom').editable({
					        url: '${(rc.getContextPath())!}/do/plan/save.html',
					        title: '贴片BOM',
					        rows: 2
					    });
					});
				</script>
				</#if>
			</td>
		</tr>
		<tr>
			<td>组装包装BOM</td>
			<td style="word-break:break-all;" colspan = "3">
				<a href="#" id="zuzhuang_bom" data-type="textarea" data-pk="zuzhuang_bom" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入组装包装bom">${(plan.planItems['zuzhuang_bom'].itemValue)!}</a>
				<#if canWrite??>
				<script>
					$(function(){
					    $('#zuzhuang_bom').editable({
					        url: '${(rc.getContextPath())!}/do/plan/save.html',
					        title: '组装包装BOM',
					        rows: 2
					    });
					});
				</script>
				</#if>
			</td>
		</tr>
		<tr>
			<td>生产程序</td>
			<td colspan = "3"><a href="#" id="product_program" data-type="textarea" data-pk="product_program" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入生产程序">${(plan.planItems['product_program'].itemValue)!}</a>
				<#if canWrite??>
				<script>
					$(function(){
					    $('#product_program').editable({
					    	url: '${(rc.getContextPath())!}/do/plan/save.html',
					        title: '生产程序',
					        rows: 5
					    });
					});
				</script>
				</#if>
			</td>
		</tr>
		<tr>
			<td>软件版本号</td>
			<td colspan = "3"><a href="#" id="softwareVer" data-type="textarea" data-pk="softwareVer" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入软件版本号">${(plan.planItems['softwareVer'].itemValue)!}</a>
				<#if canWrite??>
				<script>
					$(function(){
					    $('#softwareVer').editable({
					    	url: '${(rc.getContextPath())!}/do/plan/save.html',
					        title: '软件版本号',
					        rows: 5
					    });
					});
				</script>
				</#if>
			</td>
		</tr>
		<tr>
			<td>MAC地址范围</td>
			<td colspan = "3"><a href="#" id="mac_address" data-type="textarea" data-pk="mac_address" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入MAC地址范围">${(plan.planItems['mac_address'].itemValue)!}</a>
				<#if canWrite??>
				<script>
					$(function(){
					    $('#mac_address').editable({
					    	url: '${(rc.getContextPath())!}/do/plan/save.html',
					        title: 'MAC地址范围',
					        rows: 5
					    });
					});
				</script>
				</#if>
			</td>
		</tr>
		<tr>
			<td>BOMPID烧写</td>
			<td colspan = "3"><a href="#" id="bompid_debug" data-type="textarea" data-pk="bompid_debug" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入BOMPID烧写">${(plan.planItems['bompid_debug'].itemValue)!}</a>
				<#if canWrite??>
				<script>
					$(function(){
					    $('#bompid_debug').editable({
					    	url: '${(rc.getContextPath())!}/do/plan/save.html',
					        title: 'BOMPID烧写',
					        rows: 5
					    });
					});
				</script>
				</#if>
			</td>
		</tr>
		<tr>
			<td>HWID</td>
			<td colspan = "3"><a href="#" id="hwid_message" data-type="textarea" data-pk="hwid_message" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入HWID">${(plan.planItems['hwid_message'].itemValue)!}</a>
				<#if canWrite??>
				<script>
					$(function(){
					    $('#hwid_message').editable({
					    	url: '${(rc.getContextPath())!}/do/plan/save.html',
					        title: 'HWID',
					        rows: 5
					    });
					});
				</script>
				</#if>
			</td>
		</tr>
		<tr>
			<td>需求工装，文件</td>
			<td colspan = "3"><a href="#" id="gongzhuang_file" data-type="textarea" data-pk="gongzhuang_file" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入需求工装，文件">${(plan.planItems['gongzhuang_file'].itemValue)!}</a>
				<#if canWrite??>
				<script>
					$(function(){
					    $('#gongzhuang_file').editable({
					    	url: '${(rc.getContextPath())!}/do/plan/save.html',
					        title: '需求工装，文件',
					        rows: 5
					    });
					});
				</script>
				</#if>
			</td>
		</tr>
		<tr>
			<td>需求工具</td>
			<td colspan = "3"><a href="#" id="test_tool" data-type="textarea" data-pk="test_tool" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入需求工具">${(plan.planItems['test_tool'].itemValue)!}</a>
				<#if canWrite??>
				<script>
					$(function(){
					    $('#test_tool').editable({
					    	url: '${(rc.getContextPath())!}/do/plan/save.html',
					        title: '需求工具',
					        rows: 5
					    });
					});
				</script>
				</#if>
			</td>
		</tr>
		<tr>
			<td style="width:140px; word-break:break-all;" rowspan = "2">绿色产品<br/>生产要求(必选)</td>
			<td colspan = "4">工艺要求：
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
			<td colspan = "4">有害物质标准要求:
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
			<td>特殊加工要求说明:</td>
			<td colspan = "4" >
				<div id="comments_2" data-type="wysihtml5" data-pk="comments_2">
					<#if plan.planItems["comments_2"]?has_content>${plan.planItems['comments_2'].itemValue}</#if>
				</div>

				<script>
				$('#comments_2').editable({
			        url: '${(rc.getContextPath())!}/do/plan/save.html',
			        title: '特殊加工要求说明',
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