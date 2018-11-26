<h3 align="center">上海盛本智能科技有限公司</h3>
<br>
<table class="oms_table" border="1" style="margin-left: auto;margin-right: auto; width:80%">
    <tbody>
    	<tr>
			<th colspan = "8" rowspan = "3">
				<a href="#" class="editable" id="product_book" data-type="textarea" data-placement="bottom" data-pk="product_book" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入生产通知书">${(plan.planItems['product_book'].itemValue)!}</a>
			</th>
			<td colspan = "2">表单编号:
				<a href="#" class="editable" id="list_number" data-type="textarea" data-placement="bottom" data-pk="list_number" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入表单编号">${(plan.planItems['list_number'].itemValue)!}</a>
			</td>
		</tr>
		<tr>
			<td colspan = "2">版本号:
				<a href="#" class="editable" id="version_number" data-type="textarea" data-placement="bottom" data-pk="version_number" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入版本号">${(plan.planItems['version_number'].itemValue)!}</a>
			</td>
		</tr>
		<tr>
			<td colspan = "2">编号:
				<a href="#" class="editable" id="edit_number" data-type="textarea" data-placement="bottom" data-pk="edit_number" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入编号">${(plan.planItems['edit_number'].itemValue)!}</a>
			</td>
		</tr>
		<tr>
			<th rowspan = "2" width=10%px>订单信息</th>
			<th width=10%px>客户</th>
			<td colspan = "4" width=40%px>
				<a href="#" class="editable" id="cus_name" data-type="textarea" data-placement="bottom" data-pk="cus_name" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入客户">${(plan.planItems['cus_name'].itemValue)!}</a>
			</td>
			<th width=10%px>产品型号</th>
			<td colspan = "3" width=30%px>
				<a href="#" class="editable" id="productModel" data-placement="bottom" data-type="textarea" data-pk="productModel" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入产品型号">${(plan.planItems['productModel'].itemValue)!}</a>
			</td>
		</tr>
		<tr>
			<td>生产性质（必选）</td>
			<td colspan = "4">
			<#if plan.planItems["manufacture-shichan"]?has_content>
				<label><input id="manufacture-shichan" class="ajaxCheckbox-manufacture" type="checkbox" ${plan.planItems['manufacture-shichan'].itemValue}><span> 试产</span></label>
			<#else>
				<label><input id="manufacture-shichan" class="ajaxCheckbox-manufacture" type="checkbox"><span> 试产</span></label>
			</#if>
			
			<#if plan.planItems["manufacture-xiaopi"]?has_content>
				<label><input id="manufacture-xiaopi" class="ajaxCheckbox-manufacture" type="checkbox" ${plan.planItems['manufacture-xiaopi'].itemValue}><span> 小批</span></label>
			<#else>
				<label><input id="manufacture-xiaopi" class="ajaxCheckbox-manufacture" type="checkbox"><span> 小批</span></label>
			</#if>
			
			<#if plan.planItems["manufacture-lianchan"]?has_content>
				<label><input id="manufacture-lianchan" class="ajaxCheckbox-manufacture" type="checkbox"  ${plan.planItems['manufacture-lianchan'].itemValue}><span> 量产</span></label>
			<#else>
				<label><input id="manufacture-lianchan" class="ajaxCheckbox-manufacture" type="checkbox"><span> 量产</span></label>
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
			<th>订单数量</th>
			<td colspan = "3">
				<a href="#" class="editable" id="dingdan_total" data-type="textarea" data-pk="dingdan_total" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入订单数量">${(plan.planItems['dingdan_total'].itemValue)!}</a>
			</td>
		</tr>
		<tr>
			<th rowspan = "3">工单信息</th>
			<th>产品信息</th>
			<th>生产单号</th>
			<td colspan = "2">
				<a href="#" class="editable" id="product_list_number" data-type="textarea" data-pk="product_list_number" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入生产单号">${(plan.planItems['product_list_number'].itemValue)!}</a>
			</td>
			<th>成品料号</th>
			<td colspan = "2">
				<a href="#" class="editable" id="chengpin_number" data-type="textarea" data-pk="chengpin_number" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入成品料号">${(plan.planItems['chengpin_number'].itemValue)!}</a>
			</td>
			<th>整机颜色</th>
			<td>
				<a href="#" class="editable" id="machine_colour" data-type="textarea" data-pk="machine_colour" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入整机颜色">${(plan.planItems['machine_colour'].itemValue)!}</a>
			</td>
		</tr>
		<tr>
			<th>生产类别</th>
			<td colspan = "8">
			<#if plan.planItems["manufacture-pcba"]?has_content>
				<label><input id="manufacture-pcba" class="ajaxCheckbox-manufacture" type="checkbox" ${plan.planItems['manufacture-pcba'].itemValue}><span> 核心板PCBA</span></label>
			<#else>
				<label><input id="manufacture-pcba" class="ajaxCheckbox-manufacture" type="checkbox"><span> 核心板PCBA</span></label>
			</#if>
			
			<#if plan.planItems["manufacture-zupcba"]?has_content>
				<label><input id="manufacture-zupcba" class="ajaxCheckbox-manufacture" type="checkbox" ${plan.planItems['manufacture-zupcba'].itemValue}><span> 主板PCBA</span></label>
			<#else>
				<label><input id="manufacture-zupcba" class="ajaxCheckbox-manufacture" type="checkbox"><span> 主板PCBA</span></label>
			</#if>
			
			<#if plan.planItems["manufacture-fu"]?has_content>
				<label><input id="manufacture-fu" class="ajaxCheckbox-manufacture" type="checkbox" ${plan.planItems['manufacture-fu'].itemValue}><span> 副板</span></label>
			<#else>
				<label><input id="manufacture-fu" class="ajaxCheckbox-manufacture" type="checkbox"><span> 副板</span></label>
			</#if>
			
			<#if plan.planItems["manufacture-jitou"]?has_content>
				<label><input id="manufacture-jitou" class="ajaxCheckbox-manufacture" type="checkbox" ${plan.planItems['manufacture-jitou'].itemValue}><span> 机头</span></label>
			<#else>
				<label><input id="manufacture-jitou" class="ajaxCheckbox-manufacture" type="checkbox"><span> 机头</span></label>
			</#if>
			
			<#if plan.planItems["manufacture-dizuo"]?has_content>
				<label><input id="manufacture-dizuo" class="ajaxCheckbox-manufacture" type="checkbox" ${plan.planItems['manufacture-dizuo'].itemValue}><span> 底座</span></label>
			<#else>
				<label><input id="manufacture-dizuo" class="ajaxCheckbox-manufacture" type="checkbox"><span> 底座</span></label>
			</#if>
			
			<#if plan.planItems["manufacture-baozhuang"]?has_content>
				<label><input id="manufacture-baozhuang" class="ajaxCheckbox-manufacture" type="checkbox" ${plan.planItems['manufacture-baozhuang'].itemValue}><span> 包装</span></label>
			<#else>
				<label><input id="manufacture-baozhuang" class="ajaxCheckbox-manufacture" type="checkbox"><span> 包装</span></label>
			</#if>
			
			<#if plan.planItems["manufacture-fangong"]?has_content>
				<label><input id="manufacture-fangong" class="ajaxCheckbox-manufacture" type="checkbox" ${plan.planItems['manufacture-fangong'].itemValue}><span> 返工</span></label>
			<#else>
				<label><input id="manufacture-fangong" class="ajaxCheckbox-manufacture" type="checkbox"><span> 返工</span></label>
			</#if>
			
			<#if plan.planItems["manufacture-updata"]?has_content>
				<label><input id="manufacture-updata" class="ajaxCheckbox-manufacture" type="checkbox" ${plan.planItems['manufacture-updata'].itemValue}><span> 升级出货</span></label>
			<#else>
				<label><input id="manufacture-updata" class="ajaxCheckbox-manufacture" type="checkbox"><span> 升级出货</span></label>
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
			<th>是否走系统</th>
			<td colspan = "3">
			<#if plan.planItems["manufacture-ya"]?has_content>
				<label><input id="manufacture-ya" class="ajaxCheckbox-manufacture" type="checkbox" ${plan.planItems['manufacture-ya'].itemValue}><span> 是</span></label>
			<#else>
				<label><input id="manufacture-ya" class="ajaxCheckbox-manufacture" type="checkbox"><span> 是</span></label>
			</#if>
			
			<#if plan.planItems["manufacture-na"]?has_content>
				<label><input id="manufacture-na" class="ajaxCheckbox-manufacture" type="checkbox" ${plan.planItems['manufacture-na'].itemValue}><span> 否</span></label>
			<#else>
				<label><input id="manufacture-na" class="ajaxCheckbox-manufacture" type="checkbox"><span> 否</span></label>
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
			<th>即时出货</th>
			<td colspan = "4">
			<#if plan.planItems["manufacture-yb"]?has_content>
				<label><input id="manufacture-yb" class="ajaxCheckbox-manufacture" type="checkbox" ${plan.planItems['manufacture-yb'].itemValue}><span> 是</span></label>
			<#else>
				<label><input id="manufacture-yb" class="ajaxCheckbox-manufacture" type="checkbox"><span> 是</span></label>
			</#if>
			
			<#if plan.planItems["manufacture-nb"]?has_content>
				<label><input id="manufacture-nb" class="ajaxCheckbox-manufacture" type="checkbox" ${plan.planItems['manufacture-nb'].itemValue}><span> 否</span></label>
			<#else>
				<label><input id="manufacture-nb" class="ajaxCheckbox-manufacture" type="checkbox"><span> 否</span></label>
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
			<th rowspan = "15">生产资料信息</th>
			<th>核心板bom</th>
			<td colspan = "8">
				<a href="#" id="hexin_bom" data-type="textarea" data-pk="hexin_bom" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入核心板bom">${(plan.planItems['hexin_bom'].itemValue)!}</a>
				<#if canWrite??>
				<script>
					$(function(){
					    $('#hexin_bom').editable({
					        url: '${(rc.getContextPath())!}/do/plan/save.html',
					        title: '核心板bom',
					        rows: 2
					    });
					});
				</script>
				</#if>
			</td>
		</tr>
		<tr>
			<th>主板BOM</th>
			<td colspan = "8">
				<a href="#" id="zhuban_bom" data-type="textarea" data-pk="zhuban_bom" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入主板BOM">${(plan.planItems['zhuban_bom'].itemValue)!}</a>
				<#if canWrite??>
				<script>
					$(function(){
					    $('#zhuban_bom').editable({
					        url: '${(rc.getContextPath())!}/do/plan/save.html',
					        title: '主板BOM',
					        rows: 2
					    });
					});
				</script>
				</#if>
			</td>
		</tr>
		<tr>
			<th>副板BOM</th>
			<td colspan = "8">
				<a href="#" id="fuban_bom" data-type="textarea" data-pk="fuban_bom" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入副板BOM">${(plan.planItems['fuban_bom'].itemValue)!}</a>
				<#if canWrite??>
				<script>
					$(function(){
					    $('#fuban_bom').editable({
					        url: '${(rc.getContextPath())!}/do/plan/save.html',
					        title: '副板BOM',
					        rows: 2
					    });
					});
				</script>
				</#if>
			</td>
		</tr>
		<tr>
			<td>SMT资料包</td>
			<td colspan = "8" word-break:break-all;><a href="#" id="smtDocPackage" data-type="textarea" data-pk="smtDocPackage" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入SMT资料包">${(plan.planItems['smtDocPackage'].itemValue)!}</a>
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
			<td>配置BOM</td>
			<td colspan = "8">
				<a href="#" id="config_bom" data-type="textarea" data-pk="config_bom" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入配置bom">${(plan.planItems['config_bom'].itemValue)!}	</a>
				<#if canWrite??>
				<script>
					$(function(){
					    $('#config_bom').editable({
					        url: '${(rc.getContextPath())!}/do/plan/save.html',
					        title: '配置BOM',
					        rows: 2
					    });
					});
				</script>
				</#if>
			</td>
		</tr>
		<tr>
			<td>组装BOM</td>
			<td style="word-break:break-all;" colspan = "8">
				<a href="#" id="zuzhuang_bom" data-type="textarea" data-pk="zuzhuang_bom" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入组装bom">${(plan.planItems['zuzhuang_bom'].itemValue)!}</a>
				<#if canWrite??>
				<script>
					$(function(){
					    $('#zuzhuang_bom').editable({
					        url: '${(rc.getContextPath())!}/do/plan/save.html',
					        title: '组装BOM',
					        rows: 2
					    });
					});
				</script>
				</#if>
			</td>
		</tr>
		<tr>
			<td>包装BOM</td>
			<td colspan = "8">
				<a href="#" id="baozhuang_bom" data-type="textarea" data-pk="baozhuang_bom" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入包装bom">${(plan.planItems['baozhuang_bom'].itemValue)!}	</a>
				<#if canWrite??>
				<script>
					$(function(){
					    $('#baozhuang_bom').editable({
					        url: '${(rc.getContextPath())!}/do/plan/save.html',
					        title: '包装BOM',
					        rows: 2
					    });
					});
				</script>
				</#if>
			</td>
		</tr>
		<tr>
			<td>工艺文件</td>
			<td colspan = "8">
				<a href="#" id="art_file" data-type="textarea" data-pk="art_file" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入工艺文件">${(plan.planItems['art_file'].itemValue)!}	</a>
				<#if canWrite??>
				<script>
					$(function(){
					    $('#art_file').editable({
					        url: '${(rc.getContextPath())!}/do/plan/save.html',
					        title: '工艺文件',
					        rows: 2
					    });
					});
				</script>
				</#if>
			</td>
		</tr>
		<tr>
			<td>组包装SOP</td>
			<td colspan = "8">
				<a href="#" id="zubaozhuang_sop" data-type="textarea" data-pk="zubaozhuang_sop" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入组包装SOP">${(plan.planItems['zubaozhuang_sop'].itemValue)!}	</a>
				<#if canWrite??>
				<script>
					$(function(){
					    $('#zubaozhuang_sop').editable({
					        url: '${(rc.getContextPath())!}/do/plan/save.html',
					        title: '组包装SOP',
					        rows: 2
					    });
					});
				</script>
				</#if>
			</td>
		</tr>
		<tr>
			<td>标签打印包</td>
			<td colspan = "8">
				<a href="#" id="biaoqianprts_package" data-type="textarea" data-pk="biaoqianprts_package" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入标签打印包">${(plan.planItems['biaoqianprts_package'].itemValue)!}	</a>
				<#if canWrite??>
				<script>
					$(function(){
					    $('#biaoqianprts_package').editable({
					        url: '${(rc.getContextPath())!}/do/plan/save.html',
					        title: '标签打印包',
					        rows: 2
					    });
					});
				</script>
				</#if>
			</td>
		</tr>
		<tr>
			<th rowspan = "5">软件版本</th>
			<th>平台版本</th>
			<td colspan = "7">
				<a href="#" class="editable" id="pingtai_Ver" data-type="textarea" data-pk="pingtai_Ver" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入平台版本">${(plan.planItems['pingtai_Ver'].itemValue)!}</a>
			</td>
		</tr>
		<tr>
			<th>AP版本</th>
			<td colspan = "7">
				<a href="#" class="editable" id="ap_Ver" data-type="textarea" data-pk="ap_Ver" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入AP版本">${(plan.planItems['ap_Ver'].itemValue)!}</a>
			</td>
		</tr>
		<tr>
			<th>模块版本</th>
			<td colspan = "7">
				<a href="#" class="editable" id="module_Ver" data-type="textarea" data-pk="module_Ver" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入模块版本">${(plan.planItems['module_Ver'].itemValue)!}</a>
			</td>
		</tr>
		<tr>
			<th>读取版本号</th>
			<td colspan = "7">
				<a href="#" class="editable" id="rw_Ver" data-type="textarea" data-pk="rw_Ver" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入读取版本号">${(plan.planItems['rw_Ver'].itemValue)!}</a>
			</td>
		</tr>
		<tr>
			<th>QCN/PRI</th>
			<td colspan = "7">
				<a href="#" class="editable" id="qcn_pri_Ver" data-type="textarea" data-pk="qcn_pri_Ver" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入QCN/PRI">${(plan.planItems['qcn_pri_Ver'].itemValue)!}</a>
			</td>
		</tr>
		<tr>
			<th>注意事项(返工流程)</th>
			<td colspan = "9" >
				<a href="#" class="editable" id="fangong_comment" data-type="textarea" data-pk="fangong_comment" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入注意事项(返工流程)">${(plan.planItems['fangong_comment'].itemValue)!}</a>
			</td>
		</tr>
		<tr>
			<th rowspan = "7">配置信息</th>
			<th rowspan = "5">频段</th>
			<td colspan = "8">
			<#if plan.planItems["manufacture-A1"]?has_content>
				<label><input id="manufacture-A1" class="ajaxCheckbox-manufacture" type="checkbox" ${plan.planItems['manufacture-A1'].itemValue}><span> GSM</span></label>
			<#else>
				<label><input id="manufacture-A1" class="ajaxCheckbox-manufacture" type="checkbox"><span> GSM</span></label>
			</#if>
			
			<#if plan.planItems["manufacture-A2"]?has_content>
				<label><input id="manufacture-A2" class="ajaxCheckbox-manufacture" type="checkbox" ${plan.planItems['manufacture-A2'].itemValue}><span> 850</span></label>
			<#else>
				<label><input id="manufacture-A2" class="ajaxCheckbox-manufacture" type="checkbox"><span> 850</span></label>
			</#if>
			
			<#if plan.planItems["manufacture-A3"]?has_content>
				<label><input id="manufacture-A3" class="ajaxCheckbox-manufacture" type="checkbox" ${plan.planItems['manufacture-A3'].itemValue}><span> 900</span></label>
			<#else>
				<label><input id="manufacture-A3" class="ajaxCheckbox-manufacture" type="checkbox"><span> 900</span></label>
			</#if>
			
			<#if plan.planItems["manufacture-A4"]?has_content>
				<label><input id="manufacture-A4" class="ajaxCheckbox-manufacture" type="checkbox" ${plan.planItems['manufacture-A4'].itemValue}><span> 1800</span></label>
			<#else>
				<label><input id="manufacture-A4" class="ajaxCheckbox-manufacture" type="checkbox"><span> 1800</span></label>
			</#if>
			
			<#if plan.planItems["manufacture-A5"]?has_content>
				<label><input id="manufacture-A5" class="ajaxCheckbox-manufacture" type="checkbox" ${plan.planItems['manufacture-A5'].itemValue}><span> 1900</span></label>
			<#else>
				<label><input id="manufacture-A5" class="ajaxCheckbox-manufacture" type="checkbox"><span> 1900</span></label>
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
			<td colspan="8">
				<#if plan.planItems["manufacture-B1"]?has_content>
					<label><input id="manufacture-B1" class="ajaxCheckbox-manufacture" type="checkbox" ${plan.planItems['manufacture-B1'].itemValue}><span> CDMA</span></label>
				<#else>
					<label><input id="manufacture-B1" class="ajaxCheckbox-manufacture" type="checkbox"><span> CDMA</span></label>
				</#if>
				
				<#if plan.planItems["manufacture-B2"]?has_content>
					<label><input id="manufacture-B2" class="ajaxCheckbox-manufacture" type="checkbox" ${plan.planItems['manufacture-B2'].itemValue}><span> 800</span></label>
				<#else>
					<label><input id="manufacture-B2" class="ajaxCheckbox-manufacture" type="checkbox"><span> 800</span></label>
				</#if>
				
				<#if plan.planItems["manufacture-B3"]?has_content>
					<label><input id="manufacture-B3" class="ajaxCheckbox-manufacture" type="checkbox" ${plan.planItems['manufacture-B3'].itemValue}><span> 1900</span></label>
				<#else>
					<label><input id="manufacture-B3" class="ajaxCheckbox-manufacture" type="checkbox"><span> 1900</span></label>
				</#if>
				
				<#if plan.planItems["manufacture-B4"]?has_content>
					<label><input id="manufacture-B4" class="ajaxCheckbox-manufacture" type="checkbox" ${plan.planItems['manufacture-B4'].itemValue}><span> AWS</span></label>
				<#else>
					<label><input id="manufacture-B4" class="ajaxCheckbox-manufacture" type="checkbox"><span> AWS</span></label>
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
			<td colspan="8">
				<#if plan.planItems["manufacture-C1"]?has_content>
					<label><input id="manufacture-C1" class="ajaxCheckbox-manufacture" type="checkbox" ${plan.planItems['manufacture-C1'].itemValue}><span> WCDMA</span></label>
				<#else>
					<label><input id="manufacture-C1" class="ajaxCheckbox-manufacture" type="checkbox"><span> WCDMA</span></label>
				</#if>
				
				<#if plan.planItems["manufacture-C2"]?has_content>
					<label><input id="manufacture-C2" class="ajaxCheckbox-manufacture" type="checkbox" ${plan.planItems['manufacture-C2'].itemValue}><span> 850</span></label>
				<#else>
					<label><input id="manufacture-C2" class="ajaxCheckbox-manufacture" type="checkbox"><span> 850</span></label>
				</#if>
				
				<#if plan.planItems["manufacture-C3"]?has_content>
					<label><input id="manufacture-C3" class="ajaxCheckbox-manufacture" type="checkbox" ${plan.planItems['manufacture-C3'].itemValue}><span> 900</span></label>
				<#else>
					<label><input id="manufacture-C3" class="ajaxCheckbox-manufacture" type="checkbox"><span> 900</span></label>
				</#if>
				
				<#if plan.planItems["manufacture-C4"]?has_content>
					<label><input id="manufacture-C4" class="ajaxCheckbox-manufacture" type="checkbox" ${plan.planItems['manufacture-C4'].itemValue}><span> 1900</span></label>
				<#else>
					<label><input id="manufacture-C4" class="ajaxCheckbox-manufacture" type="checkbox"><span> </span>1900</label>
				</#if>
				
				<#if plan.planItems["manufacture-C5"]?has_content>
					<label><input id="manufacture-C5" class="ajaxCheckbox-manufacture" type="checkbox" ${plan.planItems['manufacture-C5'].itemValue}><span> 2100</span></label>
				<#else>
					<label><input id="manufacture-C5" class="ajaxCheckbox-manufacture" type="checkbox"><span> 2100</span></label>
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
			<td colspan="8">
				<#if plan.planItems["manufacture-D1"]?has_content>
					<label><input id="manufacture-D1" class="ajaxCheckbox-manufacture" type="checkbox" ${plan.planItems['manufacture-D1'].itemValue}><span> TD-SCDMA</span></label>
				<#else>
					<label><input id="manufacture-D1" class="ajaxCheckbox-manufacture" type="checkbox"><span> TD-SCDMA</span></label>
				</#if>
				<#if plan.planItems["manufacture-D2"]?has_content>
					<label><input id="manufacture-D2" class="ajaxCheckbox-manufacture" type="checkbox" ${plan.planItems['manufacture-D2'].itemValue}><span> B34</span></label>
				<#else>
					<label><input id="manufacture-D2" class="ajaxCheckbox-manufacture" type="checkbox"><span> B34</span></label>
				</#if>
				<#if plan.planItems["manufacture-D3"]?has_content>
					<label><input id="manufacture-D3" class="ajaxCheckbox-manufacture" type="checkbox" ${plan.planItems['manufacture-D3'].itemValue}><span> B39</span></label>
				<#else>
					<label><input id="manufacture-D3" class="ajaxCheckbox-manufacture" type="checkbox"><span> B39</span></label>
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
			<td>
				<#if plan.planItems["manufacture-EE"]?has_content>
					<label><input id="manufacture-EE" class="ajaxCheckbox-manufacture" type="checkbox" ${plan.planItems['manufacture-EE'].itemValue}><span> LTE-FDD</span></label>
				<#else>
					<label><input id="manufacture-EE" class="ajaxCheckbox-manufacture" type="checkbox"><span> LTE-FDD</span></label>
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
			<td colspan = "7">
				<#if plan.planItems["manufacture-E1"]?has_content>
					<label><input id="manufacture-E1" class="ajaxCheckbox-manufacture" type="checkbox" ${plan.planItems['manufacture-E1'].itemValue}><span> B38</span></label>
				<#else>
					<label><input id="manufacture-E1" class="ajaxCheckbox-manufacture" type="checkbox"><span> B38</span></label>
				</#if>
				
				<#if plan.planItems["manufacture-E2"]?has_content>
					<label><input id="manufacture-E2" class="ajaxCheckbox-manufacture" type="checkbox" ${plan.planItems['manufacture-E2'].itemValue}><span> B39</span></label>
				<#else>
					<label><input id="manufacture-E2" class="ajaxCheckbox-manufacture" type="checkbox"><span> B39</span></label>
				</#if>
				
				<#if plan.planItems["manufacture-E3"]?has_content>
					<label><input id="manufacture-E3" class="ajaxCheckbox-manufacture" type="checkbox" ${plan.planItems['manufacture-E3'].itemValue}><span> B40</span></label>
				<#else>
					<label><input id="manufacture-E3" class="ajaxCheckbox-manufacture" type="checkbox"><span> B40</span></label>
				</#if>
				
				<#if plan.planItems["manufacture-E4"]?has_content>
					<label><input id="manufacture-E4" class="ajaxCheckbox-manufacture" type="checkbox" ${plan.planItems['manufacture-E4'].itemValue}><span> B41</span></label>
				<#else>
					<label><input id="manufacture-E4" class="ajaxCheckbox-manufacture" type="checkbox"><span> B41</span></label>
				</#if>
				<hr>
				<#if plan.planItems["manufacture-e1"]?has_content>
					<label><input id="manufacture-e1" class="ajaxCheckbox-manufacture" type="checkbox" ${plan.planItems['manufacture-e1'].itemValue}><span> B1</span></label>
				<#else>
					<label><input id="manufacture-e1" class="ajaxCheckbox-manufacture" type="checkbox"><span> B1</span></label>
				</#if>
				
				<#if plan.planItems["manufacture-e2"]?has_content>
					<label><input id="manufacture-e2" class="ajaxCheckbox-manufacture" type="checkbox" ${plan.planItems['manufacture-e2'].itemValue}><span> B2</span></label>
				<#else>
					<label><input id="manufacture-e2" class="ajaxCheckbox-manufacture" type="checkbox"><span> B2</span></label>
				</#if>
				
				<#if plan.planItems["manufacture-e3"]?has_content>
					<label><input id="manufacture-e3" class="ajaxCheckbox-manufacture" type="checkbox" ${plan.planItems['manufacture-e3'].itemValue}><span> B3</span></label>
				<#else>
					<label><input id="manufacture-e3" class="ajaxCheckbox-manufacture" type="checkbox"><span> B3</span></label>
				</#if>
				
				<#if plan.planItems["manufacture-e4"]?has_content>
					<label><input id="manufacture-e4" class="ajaxCheckbox-manufacture" type="checkbox" ${plan.planItems['manufacture-e4'].itemValue}><span> B5</span></label>
				<#else>
					<label><input id="manufacture-e4" class="ajaxCheckbox-manufacture" type="checkbox"><span> B5</span></label>
				</#if>
				
				<#if plan.planItems["manufacture-e5"]?has_content>
					<label><input id="manufacture-e5" class="ajaxCheckbox-manufacture" type="checkbox" ${plan.planItems['manufacture-e5'].itemValue}><span> B7</span></label>
				<#else>
					<label><input id="manufacture-e5" class="ajaxCheckbox-manufacture" type="checkbox"><span> B7</span></label>
				</#if>
				
				<#if plan.planItems["manufacture-e6"]?has_content>
					<label><input id="manufacture-e6" class="ajaxCheckbox-manufacture" type="checkbox" ${plan.planItems['manufacture-e6'].itemValue}><span> B8</span></label>
				<#else>
					<label><input id="manufacture-e6" class="ajaxCheckbox-manufacture" type="checkbox"><span> B8</span></label>
				</#if>
				
				<#if plan.planItems["manufacture-e7"]?has_content>
					<label><input id="manufacture-e7" class="ajaxCheckbox-manufacture" type="checkbox" ${plan.planItems['manufacture-e7'].itemValue}><span> B9</span></label>
				<#else>
					<label><input id="manufacture-e7" class="ajaxCheckbox-manufacture" type="checkbox"><span> B9</span></label>
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
			<th>主板配置码</th>
			<td colspan = "4">
				<a href="#" class="editable" id="zhuban_configcode" data-type="textarea" data-pk="zhuban_configcode" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入主板配置码">${(plan.planItems['zhuban_configcode'].itemValue)!}</a>
			</td>
			<th>成品配置</th>
			<td colspan = "3">
				<a href="#" class="editable" id="producted_config" data-type="textarea" data-pk="producted_config" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入成品配置">${(plan.planItems['producted_config'].itemValue)!}</a>
			</td>
		</tr>
		<tr>
			<th>灌装SN密匙</th>
			<td colspan="4">
			<#if plan.planItems["manufacture-ya1"]?has_content>
				<label><input id="manufacture-ya1" class="ajaxCheckbox-manufacture" type="checkbox" ${plan.planItems['manufacture-ya1'].itemValue}><span> 是</span></label>
			<#else>
				<label><input id="manufacture-ya1" class="ajaxCheckbox-manufacture" type="checkbox"><span> 是</span></label>
			</#if>
			
			<#if plan.planItems["manufacture-na1"]?has_content>
				<label><input id="manufacture-na1" class="ajaxCheckbox-manufacture" type="checkbox" ${plan.planItems['manufacture-na1'].itemValue}><span> 否</span></label>
			<#else>
				<label><input id="manufacture-na1" class="ajaxCheckbox-manufacture" type="checkbox"><span> 否</span></label>
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
			<th>灌装客户密匙</th>
			<td colspan = "3">
			<#if plan.planItems["manufacture-ya2"]?has_content>
				<label><input id="manufacture-ya2" class="ajaxCheckbox-manufacture" type="checkbox" ${plan.planItems['manufacture-ya2'].itemValue}><span> 是</span></label>
			<#else>
				<label><input id="manufacture-ya2" class="ajaxCheckbox-manufacture" type="checkbox"><span> 是</span></label>
			</#if>
			
			<#if plan.planItems["manufacture-na2"]?has_content>
				<label><input id="manufacture-na2" class="ajaxCheckbox-manufacture" type="checkbox" ${plan.planItems['manufacture-na2'].itemValue}><span> 否</span></label>
			<#else>
				<label><input id="manufacture-na2" class="ajaxCheckbox-manufacture" type="checkbox"><span> 否</span></label>
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
			<th rowspan = "3">号段信息</th>
			<td>BT号段</td>
			<td colspan = "3">
				<a href="#" class="editable" id="bt_num" data-type="textarea" data-pk="bt_num" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入BT号段">${(plan.planItems['bt_num'].itemValue)!}</a>
			</td>
			<td>WIFI号段</td>
			<td colspan = "4">
				<a href="#" class="editable" id="wifi_num" data-type="textarea" data-pk="wifi_num" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入WIFI号段">${(plan.planItems['wifi_num'].itemValue)!}</a>
			</td>
		</tr>
		<tr>
			<td>MEID号段</td>
			<td colspan = "3">
				<a href="#" class="editable" id="meid_num" data-type="textarea" data-pk="meid_num" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入MEID号段">${(plan.planItems['meid_num'].itemValue)!}</a>
			</td>
			<td>IMEI号段</td>
			<td colspan = "4">
				<a href="#" class="editable" id="imei_num" data-type="textarea" data-pk="imei_num" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入IMEI号段">${(plan.planItems['imei_num'].itemValue)!}</a>
			</td>
		</tr>
		<tr>
			<td>PSN/KSN</td>
			<td colspan = "3">
				<a href="#" class="editable" id="psn_ksn" data-type="textarea" data-pk="psn_ksn" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入PSN/KSN">${(plan.planItems['psn_ksn'].itemValue)!}</a>
			</td>
			<td>DSN/TUSN</td>
			<td colspan = "4">
				<a href="#" class="editable" id="dsn_tusn" data-type="textarea" data-pk="dsn_tusn" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入DSN/TUSN">${(plan.planItems['dsn_tusn'].itemValue)!}</a>
			</td>
		</tr>
		<tr>
			<th>工单确认</th>
			<td colspan = "3">PM:<a href="#" class="editable" id="pm" data-type="textarea" data-pk="pm" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入PM项">${(plan.planItems['pm'].itemValue)!}</a>
			</td>
			<td colspan = "3">SPM:<a href="#" class="editable" id="spm" data-type="textarea" data-pk="spm" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入SPM项">${(plan.planItems['spm'].itemValue)!}</a>
			</td>
			<td colspan = "3">PMC:<a href="#" class="editable" id="pmc" data-type="textarea" data-pk="pmc" data-url="${(rc.getContextPath())!}/do/plan/save.html" data-title="输入PMC项">${(plan.planItems['pmc'].itemValue)!}</a>
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
