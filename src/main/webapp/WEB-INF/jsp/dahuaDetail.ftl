<h3 align="center">生产计划通知书</h3>
<table class="oms_table" style="margin-left: auto; margin-right: auto; border: 0px">
		<tr>
			<td style="width:100px";>客户名称:</td>
			<td style="width:200px" align="left">
				<div style="width:200px; text-align:left; word-wrap:break-word">
				<a href="#" id="customer" data-type="textarea" data-pk="customer" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入客户名称">
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
			<td style="width:100px">销售性质：</td>
			<td style="width:200px" align="left">
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
			<td>文件编号:</td>
			<td>
				<a href="#" class="editable" id="file_No" data-type="text" data-pk="file_No" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入文件编号">${(plan.planItems['file_No'].itemValue)!}
				</a>
			</td>
			<td>日    期：</td>
			<td>
				<a href="#" id="orderDate" data-type="date" data-pk="orderDate" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入日期">${(plan.planItems['orderDate'].itemValue)!}
				</a>
			</td>
		</tr>
</table>
<br>
<table class="oms_table" border="1" style="margin-left: auto;margin-right: auto; width:80%">
    <tbody>
		<tr>
			<td rowspan = "14" width=15%px>生产资料</td>
			<td colspan = "2" width=15%px>产品名称 </td>
			<td colspan = "3" width=25%px>产品型号 </td>
			<td width=25%px>PCB 版本号 </td>
			<td width=25%px>产品P/N </td>
		</tr>
		<tr>
			<td colspan = "2" style="width:100px; word-break:break-all;">
				<a href="#" class="editable" id="productName" data-type="textarea" data-pk="productName" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入产品名称">${(plan.planItems['productName'].itemValue)!}</a>
			</td>
			<td colspan = "3" style="width:100px; word-break:break-all;">
				<a href="#" class="editable" id="productModel" data-type="textarea" data-pk="productModel" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入产品型号">${(plan.planItems['productModel'].itemValue)!}</a>
			</td>
			<td style="width:60px; word-break:break-all;">
				<a href="#" class="editable" id="pcbVer" data-type="textarea" data-pk="pcbVer" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入PCB版本号 ">${(plan.planItems['pcbVer'].itemValue)!}</a>
			</td>
			<td style="width:60px; word-break:break-all;">
				<a href="#" class="editable" id="productPN" data-type="textarea" data-pk="productPN" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入产品P/N ">${(plan.planItems['productPN'].itemValue)!}</a>
			</td>
		</tr>
		<tr>
			<td colspan = "2">类别</td>
			<td colspan="5">
				<label><input ${canWrite!'disabled'} id="cat-smt" class="ajaxCheckbox-cat" type="checkbox" name="cat-smt" ${(plan.planItems['cat-smt'].itemValue)!}><span> SMT</span></label>
				<label><input ${canWrite!'disabled'} id="cat-chajian" class="ajaxCheckbox-cat" type="checkbox" name="cat-chajian" ${(plan.planItems['cat-chajian'].itemValue)!}><span> 插件</span></label>
				<label><input ${canWrite!'disabled'} id="cat-zuzhuang" class="ajaxCheckbox-cat" type="checkbox" name="cat-zuzhuang" ${(plan.planItems['cat-zuzhuang'].itemValue)!}><span> 组装</span></label>
				<label><input ${canWrite!'disabled'} id="cat-other" class="ajaxCheckbox-cat" type="checkbox" name="cat-other" ${(plan.planItems['cat-other'].itemValue)!}><span> 其他</span></label>
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
			<td colspan = "2">贴片BOM</td>
			<td style="word-break:break-all;" colspan = "4">
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
			<td rowspan = "11">
				<a href="#" id="custel" data-type="textarea" data-pk="custel" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入客户信息">${(plan.planItems['custel'].itemValue)!}</a>
				<#if canWrite??>
				<script>
					$(function(){
					    $('#custel').editable({
					        url: '${(rc.getContextPath())!}/do/plan/save.html',
					        title: '客户信息',
					        rows: 2
					    });
					});
				</script>
				</#if>
			</td>
		</tr>
		<tr>
			<td colspan = "2">SMT资料包</td>
			<td colspan = "4"><a href="#" id="smtDocPackage" data-type="textarea" data-pk="smtDocPackage" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入SMT资料包">${(plan.planItems['smtDocPackage'].itemValue)!}</a>
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
			<td colspan = "2">软件版本</td>
			<td colspan = "4"><a href="#" id="softwareVer" data-type="textarea" data-pk="softwareVer" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入软件版本">${(plan.planItems['softwareVer'].itemValue)!}</a>
				<#if canWrite??>
				<script>
					$(function(){
					    $('#softwareVer').editable({
					    	url: '${(rc.getContextPath())!}/do/plan/save.html',
					        title: '软件版本',
					        rows: 5
					    });
					});
				</script>
				</#if>
			</td>
		</tr>
		<tr>
			<td colspan = "2">校验和</td>
			<td colspan = "4"><a href="#" id="softChecksum" data-type="textarea" data-pk="softChecksum" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入校验和">${(plan.planItems['softChecksum'].itemValue)!}</a>
				<#if canWrite??>
				<script>
					$(function(){
					    $('#softChecksum').editable({
					    	url: '${(rc.getContextPath())!}/do/plan/save.html',
					        title: '校验和',
					        rows: 5
					    });
					});
				</script>
				</#if>
			</td>
		</tr>
		<tr>
			<td colspan = "2">BOOT参数</td>
			<td colspan = "4"><a href="#" id="boot_message" data-type="textarea" data-pk="boot_message" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入BOOT参数">${(plan.planItems['boot_message'].itemValue)!}</a>
				<#if canWrite??>
				<script>
					$(function(){
					    $('#boot_message').editable({
					    	url: '${(rc.getContextPath())!}/do/plan/save.html',
					        title: 'BOOT参数',
					        rows: 5
					    });
					});
				</script>
				</#if>
			</td>
		</tr>
		<tr>
			<td colspan = "2">加密平台</td>
			<td colspan = "4"><a href="#" id="jiami_type" data-type="textarea" data-pk="jiami_type" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入加密平台">${(plan.planItems['jiami_type'].itemValue)!}</a>
				<#if canWrite??>
				<script>
					$(function(){
					    $('#jiami_type').editable({
					    	url: '${(rc.getContextPath())!}/do/plan/save.html',
					        title: '加密平台',
					        rows: 5
					    });
					});
				</script>
				</#if>
			</td>
		</tr>
		<tr>
			<td colspan = "2">物料长代码</td>
			<td colspan = "4"><a href="#" id="wuliao_code" data-type="textarea" data-pk="wuliao_code" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入物料长代码">${(plan.planItems['wuliao_code'].itemValue)!}</a>
				<#if canWrite??>
				<script>
					$(function(){
					    $('#wuliao_code').editable({
					    	url: '${(rc.getContextPath())!}/do/plan/save.html',
					        title: '物料长代码',
					        rows: 5
					    });
					});
				</script>
				</#if>
			</td>
		</tr>
		<tr>
			<td colspan = "2">烧录器件编码</td>
			<td colspan = "4"><a href="#" id="qijianCode" data-type="textarea" data-pk="qijianCode" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入烧录器件编码">${(plan.planItems['qijianCode'].itemValue)!}</a>
				<#if canWrite??>
				<script>
					$(function(){
					    $('#qijianCode').editable({
					    	url: '${(rc.getContextPath())!}/do/plan/save.html',
					        title: '烧录器件编码',
					        rows: 5
					    });
					});
				</script>
				</#if>
			</td>
		</tr>
		<tr>
			<td colspan = "2">条码标签规格</td>
			<td colspan = "4"><a href="#" id="biaoqianstyle" data-type="textarea" data-pk="biaoqianstyle" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入条码标签规格">${(plan.planItems['biaoqianstyle'].itemValue)!}</a>
				<#if canWrite??>
				<script>
					$(function(){
					    $('#biaoqianstyle').editable({
					    	url: '${(rc.getContextPath())!}/do/plan/save.html',
					        title: '条码标签规格',
					        rows: 5
					    });
					});
				</script>
				</#if>
			</td>
		</tr>
		<tr>
			<td colspan = "2">插件要求</td>
			<td colspan = "4"><a href="#" id="chajian_request" data-type="textarea" data-pk="chajian_request" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入插件要求">${(plan.planItems['chajian_request'].itemValue)!}</a>
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
		</tr>
		<tr>
			<td colspan = "2">测试要求</td>
			<td colspan = "4"><a href="#" id="test_request" data-type="textarea" data-pk="test_request" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入测试要求">${(plan.planItems['test_request'].itemValue)!}</a>
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
		</tr>
		<tr>
			<td style="width:140px; word-break:break-all;">绿色产品<br/>生产要求(必选)</td>
			<td colspan = "7">工艺要求：
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
				
				<#if plan.planItems["fabrication-rohs"]?has_content>
					<label><input id="fabrication-rohs" class="ajaxCheckbox-fabrication" type="checkbox" ${plan.planItems['fabrication-rohs'].itemValue}><span> ROHS工艺</span></label>
				<#else>
					<label><input id="fabrication-rohs" class="ajaxCheckbox-fabrication" type="checkbox"><span> ROHS工艺</span></label>
				</#if>
				
				<#if plan.planItems["fabrication-wulu"]?has_content>
					<label><input id="fabrication-wulu" class="ajaxCheckbox-fabrication" type="checkbox" ${plan.planItems['fabrication-wulu'].itemValue}><span> 无卤工艺</span></label>
				<#else>
					<label><input id="fabrication-wulu" class="ajaxCheckbox-fabrication" type="checkbox"><span> 无卤工艺</span></label>
				</#if>
				
				<#if plan.planItems["fabrication-other"]?has_content>
					<label><input id="fabrication-other" class="ajaxCheckbox-fabrication" type="checkbox" ${plan.planItems['fabrication-other'].itemValue}><span> 其他要求</span></label>
				<#else>
					<label><input id="fabrication-other" class="ajaxCheckbox-fabrication" type="checkbox"><span> 其他要求</span></label>
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
			<td>生产性质（必选）</td>
			<td colspan = "7">
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
			
			<#if plan.planItems["manufacture-fangong"]?has_content>
				<label><input id="manufacture-fangong" class="ajaxCheckbox-manufacture" type="checkbox" ${plan.planItems['manufacture-fangong'].itemValue}><span> 返工</span></label>
			<#else>
				<label><input id="manufacture-fangong" class="ajaxCheckbox-manufacture" type="checkbox"><span> 返工</span></label>
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
               <td>委托加工方</td>
               <td colspan = "2">订单批量</td>
               <td colspan = "3">分批投产数量</td>
               <td>预计生产日期</td>
               <td>预计交货日期</td>
        </tr>
		<tr>
			<td>
			<a href="#" class="editable" id="producer" data-type="textarea" data-pk="producter" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入委托加工方">
				<#if plan.planItems["producer"]?has_content>${plan.planItems['producer'].itemValue}</#if></a>
			</td>
			<td colspan = "2">
				<a href="#" class="editable" id="dingdan_total" data-type="textarea" data-pk="dingdan_total" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入订单批量">
					<#if plan.planItems["dingdan_total"]?has_content>${plan.planItems['dingdan_total'].itemValue}</#if></a>
			</td>
			<td colspan = "3">
				<a href="#" class="editable" id="fenpi_total" data-type="textarea" data-pk="fenpi_total" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入分批投产数量">
					<#if plan.planItems["fenpi_total"]?has_content>${plan.planItems['fenpi_total'].itemValue}</#if></a>
			</td>
			<td>
				<a href="#" class="editable" id="manufactureDate" data-type="date" data-pk="manufactureDate" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入预计生产日期">
					<#if plan.planItems["manufactureDate"]?has_content>${plan.planItems['manufactureDate'].itemValue}</#if></a>
			</td>
			<td>
				<a href="#" class="editable" id="completeDate" data-type="date" data-pk="completeDate" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入预计交货日期">
					<#if plan.planItems["completeDate"]?has_content>${plan.planItems['completeDate'].itemValue}</#if></a>
			</td>
		</tr>
		<tr>
			<td>备注</td>
			<td colspan = "7" >
				<div id="comments" data-type="wysihtml5" data-pk="comments">
					<#if plan.planItems["comments"]?has_content>${plan.planItems['comments'].itemValue}</#if>
				</div>

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