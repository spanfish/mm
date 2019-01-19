<h3 align="center">生产计划通知书</h3>
<table class="oms_table" style="margin-left: auto; margin-right: auto; border: 0px">
		<tr>
			<td style="width:100px">客户名称:</td>
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
</table>

<table class="oms_table" border="1" style="margin-left: auto;margin-right: auto; width:80%">
    <tbody>
		<tr>
			<td style="width:100px" rowspan = "18" word-break:break-all >生产资料<br>(无请填写/)</td>
			<td style="width:100px" colspan = "2">产品名称 </td>
			<td style="width:200px" colspan = "4">产品型号 </td>
			<td style="width:200px" colspan = "4">PCB 版本号 </td>
			<td style="width:200px" colspan = "2">产品P/N (PCBA料号)</td>
		</tr>
		<tr>
			<td style="width:100px" word-break:break-all; colspan = "2">
				<a href="#" class="editable" id="productName" data-placement="bottom" data-type="textarea" data-pk="productName" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入产品名称">${(plan.planItems['productName'].itemValue)!}</a>
			</td>
			<td style="width:200px" word-break:break-all; colspan = "4">
				<a href="#" class="editable" id="productModel" data-placement="bottom" data-type="textarea" data-pk="productModel" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入产品型号">${(plan.planItems['productModel'].itemValue)!}</a>
			</td>
			<td style="width:200px" word-break:break-all; colspan = "4">
				<a href="#" class="editable" id="pcbVer" data-placement="bottom" data-type="textarea" data-pk="pcbVer" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入PCB版本号 ">${(plan.planItems['pcbVer'].itemValue)!}</a>
			</td>
			<td style="width:200px" word-break:break-all; colspan = "2">
				<a href="#" class="editable" id="productPN" data-placement="bottom" data-type="textarea" data-pk="productPN" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入产品P/N ">${(plan.planItems['productPN'].itemValue)!}</a>
			</td>
		</tr>
		<tr>
			<td style="width:100px" colspan="2" >类别</td>
			<td style="width:600px" colspan="10">
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
			<td style="width:100px" colspan = "2" >贴片BOM</td>
			<td style="width:400px" style="word-break:break-all;" colspan = "8">
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
			<td style="width:200px" rowspan = "9" colspan = "2" word-break:break-all;>
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
			<td style="width:100px" colspan = "2">SMT资料包</td>
			<td style="width:400px" colspan = "8" word-break:break-all;><a href="#" id="smtDocPackage" data-type="textarea" data-pk="smtDocPackage" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入SMT资料包">${(plan.planItems['smtDocPackage'].itemValue)!}</a>
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
			<td style="width:100px" colspan = "2">软件版本号</td>
			<td style="width:400px" colspan = "8" word-break:break-all;><a href="#" id="softwareVer" data-type="textarea" data-pk="softwareVer" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入软件版本号">${(plan.planItems['softwareVer'].itemValue)!}</a>
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
			<td style="width:100px" colspan = "2">下载工具</td>
			<td style="width:400px" colspan = "8" word-break:break-all;><a href="#" id="download_tool" data-type="textarea" data-pk="download_tool" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入下载工具">${(plan.planItems['download_tool'].itemValue)!}</a>
				<#if canWrite??>
				<script>
					$(function(){
					    $('#download_tool').editable({
					    	url: '${(rc.getContextPath())!}/do/plan/save.html',
					        title: '下载工具',
					        rows: 5
					    });
					});
				</script>
				</#if>
			</td>
		</tr>
		<tr>
			<td style="width:100px" colspan = "2">写号工具</td>
			<td style="width:400px" colspan = "8" word-break:break-all;><a href="#" id="writer_sn_tool" data-type="textarea" data-pk="writer_sn_tool" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入写号工具">${(plan.planItems['writer_sn_tool'].itemValue)!}</a>
				<#if canWrite??>
				<script>
					$(function(){
					    $('#writer_sn_tool').editable({
					    	url: '${(rc.getContextPath())!}/do/plan/save.html',
					        title: '写号工具',
					        rows: 5
					    });
					});
				</script>
				</#if>
			</td>
		</tr>
		<tr>
			<td style="width:100px" colspan = "2">校准工具</td>
			<td style="width:400px" colspan = "8" word-break:break-all;><a href="#" id="jiaozhun_tool" data-type="textarea" data-pk="jiaozhun_tool" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入校准工具">${(plan.planItems['jiaozhun_tool'].itemValue)!}</a>
				<#if canWrite??>
				<script>
					$(function(){
					    $('#jiaozhun_tool').editable({
					    	url: '${(rc.getContextPath())!}/do/plan/save.html',
					        title: '校准工具',
					        rows: 5
					    });
					});
				</script>
				</#if>
			</td>
		</tr>
		<tr>
			<td style="width:100px" colspan = "2">校准文件</td>
			<td style="width:400px" colspan = "8" word-break:break-all;><a href="#" id="jiaozhun_file" data-type="textarea" data-pk="jiaozhun_file" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入校准文件">${(plan.planItems['jiaozhun_file'].itemValue)!}</a>
				<#if canWrite??>
				<script>
					$(function(){
					    $('#jiaozhun_file').editable({
					    	url: '${(rc.getContextPath())!}/do/plan/save.html',
					        title: '校准文件',
					        rows: 5
					    });
					});
				</script>
				</#if>
			</td>
		</tr>
		<tr>
			<td style="width:100px" colspan = "2">check工具</td>
			<td style="width:400px" colspan = "8" word-break:break-all;><a href="#" id="check_tool" data-type="textarea" data-pk="check_tool" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入check工具">${(plan.planItems['check_tool'].itemValue)!}</a>
				<#if canWrite??>
				<script>
					$(function(){
					    $('#check_tool').editable({
					    	url: '${(rc.getContextPath())!}/do/plan/save.html',
					        title: '校准文件',
					        rows: 5
					    });
					});
				</script>
				</#if>
			</td>
		</tr>
		<tr>
			<td style="width:100px" colspan = "2">测试流程要求</td>
			<td style="width:600px" colspan = "8"><a href="#" id="test_request" data-type="textarea" data-pk="test_request" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入测试流程要求">${(plan.planItems['test_request'].itemValue)!}</a>
				<#if canWrite??>
				<script>
					$(function(){
					    $('#test_request').editable({
					    	url: '${(rc.getContextPath())!}/do/plan/save.html',
					        title: '测试流程要求',
					        rows: 5
					    });
					});
				</script>
				</#if>
			</td>
		</tr>
		<tr>
			<th style="width:50px" rowspan = "6">测试频段</th>
			<td style="width:50px">GSM</td>
			<td style="width:600px" word-break:break-all; word-wrap:break-word;  colspan = "10">
				<a href="#" class="editable" id="gsm_number" data-type="textarea" data-pk="gsm_number" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入GSM频段">${(plan.planItems['gsm_number'].itemValue)!}</a>
			</td>
		</tr>
		<tr>
			<td>CDMA</td>
			<td word-break:break-all; word-wrap:break-word;  colspan = "10">
				<a href="#" class="editable" id="cdma_number" data-type="textarea" data-pk="cdma_number" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入CDMA频段">${(plan.planItems['cdma_number'].itemValue)!}</a>
			</td>
		</tr>
		<tr>
			<td style="width:50px">WCDMA</td>
			<td style="width:600px" word-break:break-all; word-wrap:break-word;  colspan = "10">
				<a href="#" class="editable" id="wcdma_number" data-type="textarea" data-pk="wcdma_number" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入WCDMA频段">${(plan.planItems['wcdma_number'].itemValue)!}</a>
			</td>
		</tr>
		<tr>
			<td style="width:50px">TDSCDMA</td>
			<td style="width:600px" word-break:break-all; word-wrap:break-word;  colspan = "10">
				<a href="#" class="editable" id="tdscdma_number" data-type="textarea" data-pk="tdscdma_number" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入TDSCDMA频段">${(plan.planItems['tdscdma_number'].itemValue)!}</a>
			</td>
		</tr>
		<tr>
			<td style="width:50px">TDD-LTE</td>
			<td style="width:600px" word-break:break-all; word-wrap:break-word;  colspan = "10">
				<a href="#" class="editable" id="tdd-lte_number" data-type="textarea" data-pk="tdd-lte_number" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入TDD-LTE频段">${(plan.planItems['tdd-lte_number'].itemValue)!}</a>
			</td>
		</tr>
		<tr>
			<td style="width:50px">FDD-LTE</td>
			<td style="width:600px" word-break:break-all; word-wrap:break-word;  colspan = "10">
				<a href="#" class="editable" id="fdd-lte_number" data-type="textarea" data-pk="fdd-lte_number" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入FDD-LTE频段">${(plan.planItems['fdd-lte_number'].itemValue)!}</a>
			</td>
		</tr>
		<tr>
			<td style="width:100px; word-break:break-all;">绿色产品<br/>生产要求<br>(必选)</td>
			<td style="width:700px" colspan = "12">工艺要求：
				<#if plan.planItems["fabrication-wuqian"]?has_content>
					<label><input ${canWrite!'disabled'} id="fabrication-wuqian" class="ajaxCheckbox-fabrication" type="checkbox" ${plan.planItems['fabrication-wuqian'].itemValue}><span> 无铅工艺</span></label>
				<#else>
					<label><input ${canWrite!'disabled'} id="fabrication-wuqian" class="ajaxCheckbox-fabrication" type="checkbox"><span> 无铅工艺</span></label>
				</#if>
				
				<#if plan.planItems["fabrication-youqian"]?has_content>
					<label><input ${canWrite!'disabled'} id="fabrication-youqian" class="ajaxCheckbox-fabrication" type="checkbox" ${plan.planItems['fabrication-youqian'].itemValue}><span> 有铅工艺</span></label>
				<#else>
					<label><input ${canWrite!'disabled'} id="fabrication-youqian" class="ajaxCheckbox-fabrication" type="checkbox"><span> 有铅工艺</span></label>
				</#if>
				
				<#if plan.planItems["fabrication-rohs"]?has_content>
					<label><input ${canWrite!'disabled'} id="fabrication-rohs" class="ajaxCheckbox-fabrication" type="checkbox" ${plan.planItems['fabrication-rohs'].itemValue}><span> ROHS工艺</span></label>
				<#else>
					<label><input ${canWrite!'disabled'} id="fabrication-rohs" class="ajaxCheckbox-fabrication" type="checkbox"><span> ROHS工艺</span></label>
				</#if>
				
				<#if plan.planItems["fabrication-dianjiao"]?has_content>
					<label><input ${canWrite!'disabled'} id="fabrication-dianjiao" class="ajaxCheckbox-fabrication" type="checkbox" ${plan.planItems['fabrication-dianjiao'].itemValue}><span> 点胶工艺(CPU,MEMORY)</span></label>
				<#else>
					<label><input ${canWrite!'disabled'} id="fabrication-dianjiao" class="ajaxCheckbox-fabrication" type="checkbox"><span> 点胶工艺(CPU,MEMORY)</span></label>
				</#if>
				
				<#if plan.planItems["fabrication-other"]?has_content>
					<label><input ${canWrite!'disabled'} id="fabrication-other" class="ajaxCheckbox-fabrication" type="checkbox" ${plan.planItems['fabrication-other'].itemValue}><span> 其他要求(氮气)</span></label>
				<#else>
					<label><input ${canWrite!'disabled'} id="fabrication-other" class="ajaxCheckbox-fabrication" type="checkbox"><span> 其他要求(氮气)</span></label>
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
			<td style="width:100px">生产性质<br>（必选）</td>
			<td style="width:700px" colspan = "12">
			<#if plan.planItems["manufacture-lianchan"]?has_content>
				<label><input ${canWrite!'disabled'} id="manufacture-lianchan" class="ajaxCheckbox-manufacture" type="checkbox"  ${plan.planItems['manufacture-lianchan'].itemValue}><span> 量产</span></label>
			<#else>
				<label><input ${canWrite!'disabled'} id="manufacture-lianchan" class="ajaxCheckbox-manufacture" type="checkbox"><span> 量产</span></label>
			</#if>
			
			<#if plan.planItems["manufacture-shichan"]?has_content>
				<label><input ${canWrite!'disabled'} id="manufacture-shichan" class="ajaxCheckbox-manufacture" type="checkbox" ${plan.planItems['manufacture-shichan'].itemValue}><span> 试产(小批量设计验证)</span></label>
			<#else>
				<label><input ${canWrite!'disabled'} id="manufacture-shichan" class="ajaxCheckbox-manufacture" type="checkbox"><span> 试产(小批量设计验证)</span></label>
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
			<td style="width:100px">委托加工方</td>
			<td style="width:100px" colspan = "2">订单批量</td>
			<td style="width:200px" colspan = "4">要求出货数量</td>
			<td style="width:200px" colspan = "4">预计生产日期</td>
			<td style="width:200px" colspan = "2">预计交货日期</td>
		</tr>
		<tr>
			<td style="width:100px" rowspan = "2">
			<a href="#" class="editable" id="jiagong_customer" data-type="textarea" data-pk="jiagong_customer" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入委托加工方">
					<#if plan.planItems["jiagong_customer"]?has_content>${plan.planItems['jiagong_customer'].itemValue}</#if></a>
			</td>
			<td style="width:100px" colspan = "2" rowspan = "2">
				<a href="#" class="editable" id="dingdan_total" data-type="textarea" data-pk="dingdan_total" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入订单批量">
					<#if plan.planItems["dingdan_total"]?has_content>${plan.planItems['dingdan_total'].itemValue}</#if></a>
			</td>
			<th style="width:100px" colspan = "2">客户需求</th>
			<th style="width:100px" colspan = "2">研发需求</th>
			<td style="width:200px" colspan = "4">
				<a href="#" class="editable" id="manufactureDate" data-type="date" data-pk="manufactureDate" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入预计生产日期">
					<#if plan.planItems["manufactureDate"]?has_content>${plan.planItems['manufactureDate'].itemValue}</#if></a>
			</td>
			<td style="width:200px" colspan = "2">
				<a href="#" class="editable" id="completeDate" data-type="date" data-pk="completeDate" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入预计交货日期">
					<#if plan.planItems["completeDate"]?has_content>${plan.planItems['completeDate'].itemValue}</#if></a>
			</td>
		</tr>
		<tr>
			<td style="width:100px" colspan = "2">
				<a href="#" class="editable" id="customer_total" data-type="textarea" data-pk="customer_total" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入客户需求">
					<#if plan.planItems["customer_total"]?has_content>${plan.planItems['customer_total'].itemValue}</#if></a>
			</td>
			<td style="width:100px" colspan = "2">
				<a href="#" class="editable" id="yanfa_total" data-type="textarea" data-pk="yanfa_total" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入研发需求">
					<#if plan.planItems["yanfa_total"]?has_content>${plan.planItems['yanfa_total'].itemValue}</#if></a>
			</td>
			<td style="width:200px" colspan = "4"></td>
			<td style="width:200px" colspan = "2"></td>
		</tr>
		<tr>
			<td style="width:100px" rowspan = "3">客户确认</td>
			<th style="width:50px" rowspan = "3">标记</th>
			<td style="width:100px">主板S/N</td>
			<td style="width:250px" colspan = "6">
				<a href="#" class="editable" id="zhuban_sn" data-type="textarea" data-pk="zhuban_sn" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入主板S/N">
					<#if plan.planItems["zhuban_sn"]?has_content>${plan.planItems['zhuban_sn'].itemValue}</#if></a>
			</td>
			<td style="width:100px" colspan = "2">MAC地址</td>
			<td style="width:200px" colspan = "2">
				<a href="#" class="editable" id="mac_address" data-type="textarea" data-pk="mac_address" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="MAC地址">
					<#if plan.planItems["mac_address"]?has_content>${plan.planItems['mac_address'].itemValue}</#if></a>
			</td>
		</tr>
		<tr>
			<td style="width:100px">IMEI</td>
			<td style="width:250px" colspan = "6">
				<a href="#" class="editable" id="imei" data-type="textarea" data-pk="imei" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入IMEI">
					<#if plan.planItems["imei"]?has_content>${plan.planItems['imei'].itemValue}</#if></a>
			</td>
			<td style="width:100px" colspan = "2">MEID</td>
			<td style="width:200px" colspan = "2">
				<a href="#" class="editable" id="meid" data-type="textarea" data-pk="meid" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入MEID">
					<#if plan.planItems["meid"]?has_content>${plan.planItems['meid'].itemValue}</#if></a>
			</td>
		</tr>
		<tr>
			<td style="width:650px" colspan = "11">
				<a href="#" class="editable" id="add_message" data-type="textarea" data-pk="add_message" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入message">
					<#if plan.planItems["add_message"]?has_content>${plan.planItems['add_message'].itemValue}</#if></a>
			</td>
		</tr>
		<tr>
			<td style="width:100px">备注</td>
			<td style="width:700px" colspan = "12" >
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
			<th style="width:100px" rowspan = "4">会签</th>
			<td style="width:100px" colspan = "2">项目部:</td>
			<td style="width:300px" colspan = "6">
				<a href="#" class="editable" id="project_part" data-type="textarea" data-pk="project_part" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入项目部信息">
					<#if plan.planItems["project_part"]?has_content>${plan.planItems['project_part'].itemValue}</#if></a>
			</td>
			<td style="width:100px" colspan = "2">硬件基带,射频:</td>
			<td style="width:200px" colspan = "2">
				<a href="#" class="editable" id="rf_name" data-type="textarea" data-pk="rf_name" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入硬件基带,射频信息">
					<#if plan.planItems["rf_name"]?has_content>${plan.planItems['rf_name'].itemValue}</#if></a>
			</td>
		</tr>
		<tr>
			<td style="width:100px"colspan = "2">软件部:</td>
			<td style="width:300px" colspan = "6">
				<a href="#" class="editable" id="software_part" data-type="textarea" data-pk="software_part" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入软件部信息">
					<#if plan.planItems["software_part"]?has_content>${plan.planItems['software_part'].itemValue}</#if></a>
			</td>
			<td style="width:100px" colspan = "2">软测部:</td>
			<td style="width:200px" colspan = "2">
				<a href="#" class="editable" id="softwaretest_part" data-type="textarea" data-pk="softwaretest_part" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入软测部信息">
					<#if plan.planItems["softwaretest_part"]?has_content>${plan.planItems['softwaretest_part'].itemValue}</#if></a>
			</td>
		</tr>
		<tr>
			<td style="width:100px" colspan = "2">运营部:</td>
			<td style="width:300px" colspan = "6">
				<a href="#" class="editable" id="run_part" data-type="textarea" data-pk="run_part" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入运营部信息">
					<#if plan.planItems["run_part"]?has_content>${plan.planItems['run_part'].itemValue}</#if></a>
			</td>
			<td style="width:100px" colspan = "2">结构部:</td>
			<td style="width:200px" colspan = "2">
				<a href="#" class="editable" id="jiegou_part" data-type="textarea" data-pk="jiegou_part" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入结构部信息">
					<#if plan.planItems["jiegou_part"]?has_content>${plan.planItems['jiegou_part'].itemValue}</#if></a>
			</td>
		</tr>
		<tr>
			<td style="width:100px" colspan = "2">销售部:</td>
			<td style="width:300px" colspan = "6">
				<a href="#" class="editable" id="sale_part" data-type="textarea" data-pk="sale_part" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入销售部信息">
					<#if plan.planItems["sale_part"]?has_content>${plan.planItems['sale_part'].itemValue}</#if></a>
			</td>
			<td style="width:100px" colspan = "2">研发总监:</td>
			<td style="width:200px" colspan = "2">
				<a href="#" class="editable" id="yanfa_part" data-type="textarea" data-pk="yanfa_part" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入研发总监信息">
					<#if plan.planItems["yanfa_part"]?has_content>${plan.planItems['yanfa_part'].itemValue}</#if></a>
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
