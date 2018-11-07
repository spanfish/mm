<h3 align="center">生产工单</h3>
<table class="oms_table" style="margin-left: auto; margin-right: auto; border: 0px">
	<tr>
		<td style="width:100px">客户名称:</td>
		<td style="width:200px" align="left">
			<div style="width:200px; text-align:left;  word-break: break-all;">
			<a href="#" id="customer" data-type="text" data-pk="customer" data-url="${rc.getContextPath()}/do/plan/save.html" data-title="输入客户名称">
				${plan.customer}
			</a>
			</div>
			<script>
			$('#customer').editable({
				placement: 'bottom'
			});
			</script>
		</td>
		<td style="width:100px">销售性质：</td>
		<td style="width:200px" align="left">
			<#if plan.planItems["sale-domestic"]?has_content>
				<label><input id="sale-domestic" class="ajaxCheckbox" type="checkbox" ${plan.planItems["sale-domestic"].itemValue}><span> 内销</span></label>
			<#else>
				<label><input id="sale-domestic" class="ajaxCheckbox" type="checkbox"><span> 内销</span></label>
			</#if>
			
			<#if plan.planItems["sale-export"]?has_content>
				<label><input id="sale-export" class="ajaxCheckbox" type="checkbox" ${plan.planItems['sale-export'].itemValue}><span> 外销</span></label>
			<#else>
				<label><input id="sale-export" class="ajaxCheckbox" type="checkbox" ><span> 外销</span></label>
			</#if>
			

			<script>
			$('.ajaxCheckbox').change(function() {
		        $.ajax({
		        	  method: "POST",
		        	  url: "${rc.getContextPath()}/do/plan/save.html",
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
		<td>订单编号:</td>
		<td>
			<a href="#" class="editable" id="orderNo" data-type="text" data-pk="orderNo" data-url="${rc.getContextPath()}/do/plan/save.html" data-title="输入订单编号">
				<#if plan.planItems["orderNo"]?has_content>
					${plan.planItems['orderNo'].itemValue}
				</#if>
			</a>
		</td>
		<td>工    厂：</td>
		<td>
			<a href="#" class="editable" id="factory" data-type="text" data-pk="factory" data-url="${rc.getContextPath()}/do/plan/save.html" data-title="输入工厂">
				<#if plan.planItems["factory"]?has_content>
					${plan.planItems['factory'].itemValue}
				</#if>
			</a>
		</td>
	</tr>
	<tr>
		<td>工单编号:</td>
		<td>
			<a href="#" class="editable" id="gongdanNo" data-type="text" data-pk="gongdanNo" data-url="${rc.getContextPath()}/do/plan/save.html" data-title="输入工单编号">
				<#if plan.planItems["gongdanNo"]?has_content>
					${plan.planItems['gongdanNo'].itemValue}
				</#if>
			</a>
		</td>
		<td>日    期：</td>
		<td>
			<a href="#" id="orderDate" data-type="date" data-pk="orderDate" data-url="${rc.getContextPath()}/do/plan/save.html" data-title="输入日期">
				<#if plan.planItems["orderDate"]?has_content>
					${plan.planItems['orderDate'].itemValue}
				</#if>
			</a>
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
			<td style="width:100px; word-break:break-all;">
				<a href="#" class="editable" id="productName" data-type="text" data-pk="productName" data-url="${rc.getContextPath()}/do/plan/save.html" data-title="输入产品名称">
					<#if plan.planItems["productName"]?has_content>
						${plan.planItems['productName'].itemValue}
					</#if>
				</a>
			</td>
			<td style="width:100px; word-break:break-all;">
				<a href="#" class="editable" id="productModel" data-type="text" data-pk="productModel" data-url="${rc.getContextPath()}/do/plan/save.html" data-title="输入产品型号">
					<#if plan.planItems["productModel"]?has_content>
						${plan.planItems['productModel'].itemValue}
					</#if>
				</a>
			</td>
			<td style="width:120px; word-break:break-all;">
				<a href="#" class="editable" id="product_description" data-type="textarea" data-pk="product_description" data-url="${rc.getContextPath()}/do/plan/save.html" data-title="输入产品描述">
					<#if plan.planItems["product_description"]?has_content>
						${plan.planItems['product_description'].itemValue}
					</#if>
					
				</a>
			</td>
			<td style="width:60px; word-break:break-all;">
				<a href="#" class="editable" id="pcbVer" data-type="text" data-pk="pcbVer" data-url="${rc.getContextPath()}/do/plan/save.html" data-title="输入PCB版本号 ">
					<#if plan.planItems["pcbVer"]?has_content>
						${plan.planItems['pcbVer'].itemValue}
					</#if>
					
				</a>
			</td>
			<td style="width:100px; word-break:break-all;">
				<a href="#" class="editable" id="customer_code" data-type="text" data-pk="customer_code" data-url="${rc.getContextPath()}/do/plan/save.html" data-title="输入客户编码 ">
					<#if plan.planItems["customer_code"]?has_content>
						${plan.planItems['customer_code'].itemValue}
					</#if>
					
				</a>
			</td>
			<td style="width:100px; word-break:break-all;">
				<a href="#" class="editable" id="gubei_code" data-type="text" data-pk="gubei_code" data-url="${rc.getContextPath()}/do/plan/save.html" data-title="输入古北编码 ">
					<#if plan.planItems["gubei_code"]?has_content>
						${plan.planItems['gubei_code'].itemValue}
					</#if>
					
				</a>
			</td>
			<td style="width:160px; word-break:break-all;">
				<a href="#" class="editable" id="comment" data-type="textarea" data-pk="comment" data-url="${rc.getContextPath()}/do/plan/save.html" data-title="输入备注">
					<#if plan.planItems["comment"]?has_content>
						${plan.planItems['comment'].itemValue}
					</#if>
					
				</a>
			</td>
		</tr>
		<tr>
			<td>类别</td>
			<td colspan="6">
				<#if plan.planItems["cat-zhengji"]?has_content>
					<label><input id="cat-zhengji" class="ajaxCheckbox-cat" type="checkbox" name="cat-zhengji" ${plan.planItems['cat-zhengji'].itemValue}><span> 整机</span></label>
				<#else>
					<label><input id="cat-zhengji" class="ajaxCheckbox-cat" type="checkbox" name="cat-zhengji"><span> 整机</span></label>
				</#if>
					
				<#if plan.planItems["cat-pcba"]?has_content>
					<label><input id="cat-pcba" class="ajaxCheckbox-cat" type="checkbox" name="cat-pcba" ${plan.planItems['cat-pcba'].itemValue}><span> PCBA</span></label>
				<#else>
					<label><input id="cat-pcba" class="ajaxCheckbox-cat" type="checkbox" name="cat-pcba"><span> PCBA</span></label>
				</#if>
				
				<#if plan.planItems["cat-mokuai"]?has_content>
					<label><input id="cat-mokuai" class="ajaxCheckbox-cat" type="checkbox" name="cat-mokuai" ${plan.planItems['cat-mokuai'].itemValue}><span> 模块</span></label>
				<#else>
					<label><input id="cat-mokuai" class="ajaxCheckbox-cat" type="checkbox" name="cat-mokuai"><span> 模块</span></label>
				</#if>
				
				<#if plan.planItems["cat-other"]?has_content>
					<label><input id="cat-other" class="ajaxCheckbox-cat" type="checkbox" name="cat-other" ${plan.planItems['cat-other'].itemValue}><span> 其他</span></label>
				<#else>
					<label><input id="cat-other" class="ajaxCheckbox-cat" type="checkbox" name="cat-other"><span> 其他</span></label>
				</#if>
				
				<script>
					$('.ajaxCheckbox-cat').change(function() {
				        $.ajax({
				        	  method: "POST",
				        	  url: "${rc.getContextPath()}/do/plan/save.html",
				        	  data: { name: this.name, pk: this.name, value: this.checked ? 'checked' : ''}
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
			<td>贴片BOM</td>
			<td style="word-break:break-all;" colspan = "4">
				<a href="#" id="bom" data-type="textarea" data-pk="bom" data-url="${rc.getContextPath()}/do/plan/save.html" data-title="输入产品P/N">
					<#if plan.planItems["bom"]?has_content>
					${plan.planItems['bom'].itemValue}
					</#if>
				</a>
				<script>
					$(function(){
					    $('#bom').editable({
					        url: '${rc.getContextPath()}/do/plan/save.html',
					        title: '贴片BOM',
					        rows: 2
					    });
					});
				</script>
			</td>
			<td style="width:60px; word-break:break-all;" rowspan = "5">项目经理</td>
			<td rowspan = "5">
				<a href="#" id="custel" data-type="textarea" data-pk="custel" data-url="${rc.getContextPath()}/do/plan/save.html" data-title="输入项目经理信息">
					<#if plan.planItems["custel"]?has_content>
						${plan.planItems['custel'].itemValue}
					</#if>
				</a>
				<script>
					$(function(){
					    $('#custel').editable({
					        url: '${rc.getContextPath()}/do/plan/save.html',
					        title: '项目经理信息',
					        rows: 2
					    });
					});
				</script>
			</td>
		</tr>
		<tr>
			<td>组装BOM</td>
			<td style="word-break:break-all;" colspan = "4">
				<a href="#" id="zuzhuang_bom" data-type="textarea" data-pk="zuzhuang_bom" data-url="${rc.getContextPath()}/do/plan/save.html" data-title="输入组装bom">
				<#if plan.planItems["zuzhuang_bom"]?has_content>
				</#if>
				</a>
				<script>
					$(function(){
					    $('#zuzhuang_bom').editable({
					        url: '${rc.getContextPath()}/do/plan/save.html',
					        title: '组装BOM',
					        rows: 2
					    });
					});
				</script>

			</td>
		</tr>
		<tr>
			<td>包装BOM</td>
			<td colspan = "4">
				<a href="#" id="baozhuang_bom" data-type="textarea" data-pk="baozhuang_bom" data-url="${rc.getContextPath()}/do/plan/save.html" data-title="输入包装bom">
					<#if plan.planItems["zuzhuang_bom"]?has_content>${plan.planItems['baozhuang_bom'].itemValue}</#if></a>

				<script>
					$(function(){
					    $('#baozhuang_bom').editable({
					        url: '${rc.getContextPath()}/do/plan/save.html',
					        title: '包装BOM',
					        rows: 2
					    });
					});
				</script>

			</td>
		</tr>
		<tr>
			<td>SMT资料包</td>
			<td colspan = "4"><a href="#" id="smtDocPackage" data-type="textarea" data-pk="smtDocPackage" data-url="${rc.getContextPath()}/do/plan/save.html" data-title="输入产品P/N">
				<#if plan.planItems["smtDocPackage"]?has_content>${plan.planItems['smtDocPackage'].itemValue}"</#if></a>

				<script>
					$(function(){
					    $('#smtDocPackage').editable({
					    	url: '${rc.getContextPath()}/do/plan/save.html',
					        title: 'SMT资料包',
					        rows: 5
					    });
					});
				</script>

			</td>
		</tr>
		<tr>
			<td>银网文件</td>
			<td colspan = "4">
				<a href="#" id="yinwang_file" data-type="textarea" data-pk="yinwang_file" data-url="${rc.getContextPath()}/do/plan/save.html" data-title="输入银网文件">
				<#if plan.planItems["yinwang_file"]?has_content>${plan.planItems['yinwang_file'].itemValue}</#if></a>

				<script>
					$(function(){
					    $('#yinwang_file').editable({
					        url: '${rc.getContextPath()}/do/plan/save.html',
					        title: '银网文件',
					        rows: 2
					    });
					});
				</script>

			</td>
		</tr>
		<tr>
			<td>芯片预烧录文件</td>
			<td colspan = "4">
				<a href="#" id="chipdebug_file" data-type="textarea" data-pk="chipdebug_file" data-url="${rc.getContextPath()}/do/plan/save.html" data-title="输入芯片预烧录文件">
					<#if plan.planItems["chipdebug_file"]?has_content>${plan.planItems['chipdebug_file'].itemValue}</#if></a>

				<script>
				$(function(){
				    $('#chipdebug_file').editable({
				        url: '${rc.getContextPath()}/do/plan/save.html',
				        title: '芯片预烧录文件',
				        rows: 2
				    });
				});
				</script>

			</td>
			<td rowspan = "4">测试部</td>
			<td rowspan = "4">
				<a href="#" id="test_part" data-type="textarea" data-pk="test_part" data-url="${rc.getContextPath()}/do/plan/save.html" data-title="输入测试部信息">
				<#if plan.planItems["test_part"]?has_content>${plan.planItems['test_part'].itemValue}</#if></a>
		
				<script>
				$(function(){
				    $('#test_part').editable({
				        url: '${rc.getContextPath()}/do/plan/save.html',
				        title: '测试部信息',
				        rows: 2
				    });
				});
				</script>
	
			</td>
		</tr>
		<tr>
			<td>固件烧录信息</td>
			<td colspan = "4">
				<a href="#" id="gujiandebug_message" data-type="textarea" data-pk="gujiandebug_message" data-url="${rc.getContextPath()}/do/plan/save.html" data-title="输入固件烧录信息">
				<#if plan.planItems["gujiandebug_message"]?has_content>${plan.planItems['gujiandebug_message'].itemValue}</#if></a>

				<script>
				$(function(){
				    $('#gujiandebug_message').editable({
				        url: '${rc.getContextPath()}/do/plan/save.html',
				        title: '固件烧录信息',
				        rows: 2
				    });
				});
				</script>

			</td>
		</tr>
		<tr>
			<td>MAC列表获取</td>
			<td colspan = "4">
				<a href="#" id="maclist_message" data-type="textarea" data-pk="maclist_message" data-url="${rc.getContextPath()}/do/plan/save.html" data-title="输入MAC列表获取">
				<#if plan.planItems["maclist_message"]?has_content>${plan.planItems['maclist_message'].itemValue}</#if></a>

				<script>
				$(function(){
				    $('#maclist_message').editable({
				        url: '${rc.getContextPath()}/do/plan/save.html',
				        title: 'MAC列表获取',
				        rows: 2
				    });
				});
				</script>

			</td>
		</tr>
		<tr>
			<td>烧录,测试工具</td>
			<td colspan = "4">
				<a href="#" id="burn_test_tool" data-type="textarea" data-pk="burn_test_tool" data-url="${rc.getContextPath()}/do/plan/save.html" data-title="输入烧录，测试工具">
				<#if plan.planItems["burn_test_tool"]?has_content>${plan.planItems['burn_test_tool'].itemValue}</#if></a>
	
				<script>
				$(function(){
				    $('#burn_test_tool').editable({
				        url: '${rc.getContextPath()}/do/plan/save.html',
				        title: '烧录，测试工具',
				        rows: 2
				    });
				});
				</script>

			</td>
		</tr>
		<tr>
			<td style="width:140px; word-break:break-all;" rowspan = "2">绿色产品<br/>生产要求(必选)</td>
			<td colspan = "7">绿色产品：
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
			        	  url: "${rc.getContextPath()}/do/plan/save.html",
			        	  data: { name: this.id, pk: this.id, value: this.checked ? 'checked' : ''}
			        	})
			        	  .done(function( msg ) {
			        	  })
			        	  .error(function( msg ) {
			        		  alert('保存失败');
			        	  });
			    });
				</script>
>
			</td>
		</tr>
		<tr>
			<td colspan = "7">有害物质标准要求:
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
			        	  url: "${rc.getContextPath()}/do/plan/save.html",
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
			
			<#if plan.planItems["manufacture-softupdate"]?has_content>
				<label><input id="manufacture-softupdate" class="ajaxCheckbox-manufacture" type="checkbox" ${plan.planItems['manufacture-softupdate'].itemValue}><span> 软件升级</span></label>
			<#else>
				<label><input id="manufacture-softupdate" class="ajaxCheckbox-manufacture" type="checkbox"><span> 软件升级</span></label>
			</#if>

				<script>
				$('.ajaxCheckbox-manufacture').change(function() {
			        $.ajax({
			        	  method: "POST",
			        	  url: "${rc.getContextPath()}/do/plan/save.html",
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
               <td>订单批量</td>
               <td>分批投产数量</td>
               <td>预计生产日期</td>
               <td>预计交货日期</td>
			<td colspan = "3">备注</td>
           </tr>
		<tr>
			<td>
			<a href="#" class="editable" id="producer" data-type="text" data-pk="producter" data-url="${rc.getContextPath()}/do/plan/save.html" data-title="输入委托加工方">
				<#if plan.planItems["producer"]?has_content>${plan.planItems['producer'].itemValue}</#if>
			</a>
			</td>
			<td>
				<a href="#" class="editable" id="dingdan_total" data-type="text" data-pk="dingdan_total" data-url="${rc.getContextPath()}/do/plan/save.html" data-title="输入订单批量">
					<#if plan.planItems["dingdan_total"]?has_content>${plan.planItems['dingdan_total'].itemValue}</#if>
				</a>
			</td>
			<td>
				<a href="#" class="editable" id="fenpi_total" data-type="text" data-pk="fenpi_total" data-url="${rc.getContextPath()}/do/plan/save.html" data-title="输入分批投产数量">
					<#if plan.planItems["fenpi_total"]?has_content>${plan.planItems['fenpi_total'].itemValue}</#if>
				</a>
			</td>
			<td>
				<a href="#" class="editable" id="manufactureDate" data-type="date" data-pk="manufactureDate" data-url="${rc.getContextPath()}/do/plan/save.html" data-title="输入预计生产日期">
					<#if plan.planItems["manufactureDate"]?has_content>${plan.planItems['manufactureDate'].itemValue}</#if>
				</a>
			</td>
			<td>
				<a href="#" class="editable" id="completeDate" data-type="date" data-pk="completeDate" data-url="${rc.getContextPath()}/do/plan/save.html" data-title="输入预计交货日期">
					<#if plan.planItems["completeDate"]?has_content>${plan.planItems['completeDate'].itemValue}</#if>

				</a>
			</td>
			<td colspan = "3">
				<a href="#" class="editable" id="comment_1" data-type="textarea" data-pk="comment_1" data-url="${rc.getContextPath()}/do/plan/save.html" data-title="输入备注">
					<#if plan.planItems["comment_1"]?has_content>${plan.planItems['comment_1'].itemValue}</#if>
				</a>
			</td>
		</tr>
		<tr>
			<td>备注</td>
			<td colspan = "7" >
				<div id="comments_2" data-type="wysihtml5" data-pk="comments_2">
					<#if plan.planItems["comments_2"]?has_content>${plan.planItems['comments_2'].itemValue}</#if>
				</div>

				<script>
				$('#comments_2').editable({
			        url: '${rc.getContextPath()}/do/plan/save.html',
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
		<tr>
			<td rowspan = "4">客户确认</td>
			<td rowspan = "2">标记</td>
			<td>主板S/N</td>
			<td colspan = "3">
				<a href="#" class="editable" id="zhuban_sn" data-type="text" data-pk="zhuban_sn" data-url="${rc.getContextPath()}/do/plan/save.html" data-title="输入主板S/N">
					<#if plan.planItems["zhuban_sn"]?has_content>${plan.planItems['zhuban_sn'].itemValue}</#if>

				</a>
			</td>
			<td>生产部</td>
			<td>
				<a href="#" class="editable" id="product_part" data-type="text" data-pk="product_part" data-url="${rc.getContextPath()}/do/plan/save.html" data-title="输入生产部信息">
					<#if plan.planItems["product_part"]?has_content>${plan.planItems['product_part'].itemValue}</#if>
					

				</a>
			</td>
		</tr>
		<tr>
			<td>IMEI</td>
			<td colspan = "3">
				<a href="#" class="editable" id="imei" data-type="text" data-pk="imei" data-url="${rc.getContextPath()}/do/plan/save.html" data-title="输入IMEI">
					<#if plan.planItems["imei"]?has_content>${plan.planItems['imei'].itemValue}</#if>

				</a>
			</td>
			<td>质量部</td>
			<td>
				<a href="#" class="editable" id="quality_part" data-type="text" data-pk="quality_part" data-url="${rc.getContextPath()}/do/plan/save.html" data-title="输入测试部信息">
					<#if plan.planItems["quality_part"]?has_content>${plan.planItems['quality_part'].itemValue}</#if>

				</a>
			</td>
		</tr>
		<tr>
			<td>物料齐套时间</td>
			<td>
				<a href="#" class="editable" id="wuliao_completeDate" data-type="date" data-pk="wuliao_completeDate" data-url="${rc.getContextPath()}/do/plan/save.html" data-title="输入物料齐套时间">
					<#if plan.planItems["wuliao_completeDate"]?has_content>${plan.planItems['wuliao_completeDate'].itemValue}</#if>

				</a>
			</td>
			<td colspan = "3"></td>
			<td>物流部</td>
			<td>
				<a href="#" class="editable" id="logistics_part" data-type="text" data-pk="logistics_part" data-url="${rc.getContextPath()}/do/plan/save.html" data-title="输入物流部信息">
					<#if plan.planItems["logistics_part"]?has_content>${plan.planItems['logistics_part'].itemValue}</#if>

				</a>
			</td>
		</tr>
		<tr>
			<td>客户型号</td>
			<td>
				<a href="#" class="editable" id="customerModel" data-type="text" data-pk="customerModel" data-url="${rc.getContextPath()}/do/plan/save.html" data-title="输入客户型号">
					<#if plan.planItems["customerModel"]?has_content>${plan.planItems['customerModel'].itemValue}</#if>
					
				</a>
			</td>
			<td colspan = "3"></td>
			<td>产品经理</td>
			<td>
				<a href="#" class="editable" id="productmanager_part" data-type="text" data-pk="productmanager_part" data-url="${rc.getContextPath()}/do/plan/save.html" data-title="输入产品经理信息">
					<#if plan.planItems["productmanager_part"]?has_content>${plan.planItems['productmanager_part'].itemValue}</#if>
					
				</a>
			</td>
		</tr>
		<tr>
			<td colspan = "2" rowspan = "3">委托加工确认</td>
			<td>生产日期</td>
			<td colspan = "3">
				<a href="#" class="editable" id="product_Date" data-type="date" data-pk="product_Date" data-url="${rc.getContextPath()}/do/plan/save.html" data-title="输入生产日期">
					<#if plan.planItems["product_Date"]?has_content>${plan.planItems['product_Date'].itemValue}</#if>
					
				</a>
			</td>
			<td rowspan = "3">签名</td>
			<td rowspan = "3">
				<a href="#" class="editable" id="signature" data-type="text" data-pk="signature" data-url="${rc.getContextPath()}/do/plan/save.html" data-title="输入签名">
					<#if plan.planItems["signature"]?has_content>${plan.planItems['signature'].itemValue}</#if>
					
					
				</a>
			</td>
		</tr>
		<tr>
			<td>交货日期</td>
			<td colspan = "3">
				<a href="#" class="editable" id="jiaohuo_Date" data-type="date" data-pk="jiaohuo_Date" data-url="${rc.getContextPath()}/do/plan/save.html" data-title="输入交货日期">
					<#if plan.planItems["jiaohuo_Date"]?has_content>${plan.planItems['jiaohuo_Date'].itemValue}</#if>
				</a>
			</td>
		</tr>
		<tr>
			<td>资料签收</td>
			<td colspan = "3">
				<a href="#" class="editable" id="ziliao_qinashou" data-type="text" data-pk="ziliao_qinashou" data-url="${rc.getContextPath()}/do/plan/save.html" data-title="输入资料签收">
					<#if plan.planItems["ziliao_qinashou"]?has_content>${plan.planItems['ziliao_qinashou'].itemValue}</#if>
				</a>
			</td>
		</tr>
	</tbody>
</table>




<script>
	$('#orderDate').editable({
		placement: 'bottom'
	});
	
	$.fn.editable.defaults.mode = 'popup';

	$(document).ready(function() {
		$('.editable').editable();
	});
</script>