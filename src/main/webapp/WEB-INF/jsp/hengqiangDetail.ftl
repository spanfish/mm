<h3 align="center">生产计划通知书</h3>	
<table class="oms_table" style="margin-left: auto; margin-right: auto; border: 0px">
	<tr>
		<td style="width:80px">客户名称:</td>
		<td style="width:200px" align="left"><a href="#" id="customer" data-type="text" data-pk="customer" data-url="${rc.getContextPath()}/do/plan/save.html" data-title="输入客户名称">${plan.customer!""}</a>
		<#if canWrite??>
		<script>
			$('#customer').editable({
				placement: 'bottom'
			});
		</script>
		</#if>
		</td>
		<td style="width:100px">销    售：</td>
		<td style="width:200px" align="left">
			<label><input ${canWrite!'disabled'} id="sale-domestic" class="ajaxCheckbox" type="checkbox" ${(plan.planItems["sale-domestic"].itemValue)!''}><span> 内销</span></label>
			<label><input ${canWrite!'disabled'} id="sale-export" class="ajaxCheckbox" type="checkbox" ${(plan.planItems['sale-export'].itemValue)!''}><span> 外销</span></label>	
		</td>
	</tr>
	<tr>
		<td>文件编号:</td>
		<td>${plan.notifyNo!""}</td>
		<td>日    期：</td>
		<td>${plan.createDate?string("yyyy-MM-dd")}</td>
	</tr>
	</table>
	<table border="1" style="margin-left: auto;margin-right: auto; width:80%">
	<tbody>
		<tr>
			<td style="width:140px;" rowspan = "11">生产资料</td>
			<td style="width:160px">产品名称 </td>
			<td style="width:160px">产品型号 </td>
			<td style="width:160px">PCB 版本号 </td>
			<td style="width:160px">产品P/N </td>
		</tr>
		<tr>
			<td>
				<a href="#" class="editable" id="productName" data-type="text" data-pk="productName" data-url="${rc.getContextPath()}/do/plan/save.html" data-title="输入产品名称">${(plan.planItems['productName'].itemValue)!""}</a>
			</td>
			<td>
				<a href="#" class="editable" id="productModel" data-type="text" data-pk="productModel" data-url="${rc.getContextPath()}/do/plan/save.html" data-title="输入产品型号">${(plan.planItems['productModel'].itemValue)!""}</a>
			</td>
			<td>
				<a href="#" class="editable" id="pcbVer" data-type="text" data-pk="pcbVer" data-url="${rc.getContextPath()}/do/plan/save.html" data-title="输入PCB版本号 ">${(plan.planItems['pcbVer'].itemValue)!""}</a>
			</td>
			<td>
				<a href="#" class="editable" id="productPN" data-type="text" data-pk="productPN" data-url="${rc.getContextPath()}/do/plan/save.html" data-title="输入产品P/N">${(plan.planItems['productPN'].itemValue)!""}</a>
			</td>
		</tr>
		<tr>
			<td>类别</td>
			<td colspan="3">
				<label><input ${canWrite!'disabled'} id="category-smt" class="ajaxCheckbox" type="checkbox" ${(plan.planItems["category-smt"].itemValue)!''}><span> SMT</span></label>
				<label><input ${canWrite!'disabled'} id="category-plugin" class="ajaxCheckbox" type="checkbox" ${(plan.planItems['category-plugin'].itemValue)!''}><span> 插件</span></label>
				<label><input ${canWrite!'disabled'} id="category-assemble" class="ajaxCheckbox" type="checkbox" ${(plan.planItems['category-assemble'].itemValue)!''}><span> 组装</span></label>
				<label><input ${canWrite!'disabled'} id="category-other" class="ajaxCheckbox" type="checkbox" ${(plan.planItems['category-other'].itemValue)!''}><span> 其他</span></label>
			</td>
			
		</tr>
		<tr>
			<td>贴片BOM</td>
			<td colspan="2"><a href="#" id="bom" data-type="textarea" data-pk="bom" data-url="${rc.getContextPath()}/do/plan/save.html" data-title="输入产品P/N">${(plan.planItems['bom'].itemValue)!""}</a>
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
			<td rowspan ="8">
				<a href="#" id="custel" data-type="textarea" data-pk="custel" data-url="${rc.getContextPath()}/do/plan/save.html" data-title="输入客户信息">${(plan.planItems['custel'].itemValue)!""}</a>
				<script>
					$(function(){
				    	$('#custel').editable({
				        	url: '${rc.getContextPath()}/do/plan/save.html',
				        	title: '客户信息',
				        	rows: 2
				    	});
					});
				</script>
			</td>
		</tr>
		<tr>
			<td>SMT资料包</td>
			<td colspan="2"><a href="#" id="smtDocPackage" data-type="textarea" data-pk="smtDocPackage" data-url="${rc.getContextPath()}/do/plan/save.html" data-title="输入产品P/N">${(plan.planItems['smtDocPackage'].itemValue)!""}</a>
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
			<td>软件版本</td>
			<td colspan="2"><a href="#" id="softwareVer" data-type="textarea" data-pk="softwareVer" data-url="${rc.getContextPath()}/do/plan/save.html" data-title="输入软件版本">${(plan.planItems['softwareVer'].itemValue)!""}</a>
			<script>
				$(function(){
				    $('#softwareVer').editable({
				    	url: '${rc.getContextPath()}/do/plan/save.html',
				        title: '软件版本',
				        rows: 5
				    });
				});
				</script>
			</td>
		</tr>
		<tr>
			<td>校验和</td>
			<td colspan="2"><a href="#" id="softChecksum" data-type="textarea" data-pk="softChecksum" data-url="${rc.getContextPath()}/do/plan/save.html" data-title="输入校验和">${(plan.planItems['softChecksum'].itemValue)!""}</a>
			<script>
				$(function(){
				    $('#softChecksum').editable({
				    	url: '${rc.getContextPath()}/do/plan/save.html',
				        title: '校验和',
				        rows: 5
				    });
				});
				</script>
			</td>
		</tr>
		<tr>
			<td>烧录器件编码</td>
			<td colspan="2"><a href="#" id="qijianCode" data-type="textarea" data-pk="qijianCode" data-url="${rc.getContextPath()}/do/plan/save.html" data-title="输入烧录器件编码">${(plan.planItems['qijianCode'].itemValue)!""}</a>
			<script>
				$(function(){
				    $('#qijianCode').editable({
				    	url: '${rc.getContextPath()}/do/plan/save.html',
				        title: '烧录器件编码',
				        rows: 5
				    });
				});
				</script>
			</td>
		</tr>
		<tr>
			<td>条码标签规格</td>
			<td colspan="2"><a href="#" id="biaoqianstyle" data-type="textarea" data-pk="biaoqianstyle" data-url="${rc.getContextPath()}/do/plan/save.html" data-title="输入条码标签规格">${(plan.planItems['biaoqianstyle'].itemValue)!""}</a>
			<script>
				$(function(){
				    $('#biaoqianstyle').editable({
				    	url: '${rc.getContextPath()}/do/plan/save.html',
				        title: '条码标签规格',
				        rows: 5
				    });
				});
				</script>
			</td>
		</tr>
		<tr>
			<td>插件要求</td>
			<td colspan="2"><a href="#" id="chajian_request" data-type="textarea" data-pk="chajian_request" data-url="${rc.getContextPath()}/do/plan/save.html" data-title="输入插件要求">${(plan.planItems['chajian_request'].itemValue)!""}</a>
			<script>
				$(function(){
				    $('#chajian_request').editable({
				    	url: '${rc.getContextPath()}/do/plan/save.html',
				        title: '插件要求',
				        rows: 5
				    });
				});
				</script>
			</td>
		</tr>
		<tr>
			<td>测试要求</td>
			<td colspan="2"><a href="#" id="test_request" data-type="textarea" data-pk="test_request" data-url="${rc.getContextPath()}/do/plan/save.html" data-title="输入测试要求">${(plan.planItems['test_request'].itemValue)!""}</a>
			<script>
				$(function(){
				    $('#test_request').editable({
				    	url: '${rc.getContextPath()}/do/plan/save.html',
				        title: '测试要求',
				        rows: 5
				    });
				});
				</script>
			</td>
		</tr>
		<tr>
			<td>绿色产品<br/>生产要求<br/>（必选）</td>
			<td colspan = "4">工艺要求：
				<label><input id="fabrication-wuqian" class="ajaxCheckbox" type="checkbox" ${(plan.planItems['fabrication-wuqian'].itemValue)!""}><span> 无铅工艺</span></label>
				<label><input id="fabrication-youqian" class="ajaxCheckbox" type="checkbox" ${(plan.planItems['fabrication-youqian'].itemValue)!""}><span> 有铅工艺</span></label>
				<label><input id="fabrication-rohs" class="ajaxCheckbox" type="checkbox" ${(plan.planItems['fabrication-rohs'].itemValue)!""}><span> ROHS工艺</span></label>
				<label><input id="fabrication-wulu" class="ajaxCheckbox" type="checkbox" ${(plan.planItems['fabrication-wulu'].itemValue)!""}><span> 无卤工艺</span></label>
				<label><input id="fabrication-other" class="ajaxCheckbox" type="checkbox" ${(plan.planItems['fabrication-other'].itemValue)!""}><span> 其他要求</span></label>
			</td>
		</tr>
		
		<tr>
			<td>生产性质（必选）</td>
			<td colspan = "4">
				<label><input id="manufacture-1" class="ajaxCheckbox" type="checkbox" ${(plan.planItems['manufacture-1'].itemValue)!""}><span> 量产</span></label>
				<label><input id="manufacture-2" class="ajaxCheckbox" type="checkbox" ${(plan.planItems['manufacture-2'].itemValue)!""}><span> 试产</span></label>
				<label><input id="manufacture-3" class="ajaxCheckbox" type="checkbox" ${(plan.planItems['manufacture-3'].itemValue)!""}><span> 返工</span></label>
			</td>
		</tr>
		<tr>
			<td>委托加工方</td>
			<td>订单批量</td>
			<td>分批投产数量</td>
			<td>预计生产日期</td>
			<td>预计交货日期</td>
		</tr>
		<tr>
			<td>
				<a href="#" class="editable" id="product" data-type="text" data-pk="productModel" data-url="${rc.getContextPath()}/do/plan/save.html" data-title="输入产品型号">${(plan.planItems['productModel'].itemValue)!""}</a>
			</td>
			<td>
				<a href="#" class="editable" id="pcbVer" data-type="text" data-pk="pcbVer" data-url="${rc.getContextPath()}/do/plan/save.html" data-title="输入PCB版本号 ">${(plan.planItems['pcbVer'].itemValue)!""}</a>
			</td>
			<td>
				<a href="#" class="editable" id="productPN" data-type="text" data-pk="productPN" data-url="${rc.getContextPath()}/do/plan/save.html" data-title="输入产品P/N">${(plan.planItems['productPN'].itemValue)!""}</a>
			</td>
			<td>
				<a href="#" class="editable" id="manufactureDate" data-type="date" data-pk="manufactureDate" data-url="${rc.getContextPath()}/do/plan/save.html" data-title="输入预计生产日期">${(plan.planItems['manufactureDate'].itemValue)!""}</a>
			</td>
			<td>
				<a href="#" class="editable" id="completeDate" data-type="date" data-pk="completeDate" data-url="${rc.getContextPath()}/do/plan/save.html" data-title="输入预计交货日期">${(plan.planItems['completeDate'].itemValue)!""}</a>
			</td>
		</tr>
		<tr>
				<td>备注</td>
				<td colspan = "4" >
					<div id="comments" data-type="wysihtml5" data-pk="comments">${(plan.planItems['comments'].itemValue)!""}</div>
					<script>
					$('#comments').editable({
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
				<td rowspan = "3">客户确认（标记）</td>
				<td>主板S/N</td>
				<td>
					<a href="#" class="editable" id="zhuban_sn" data-type="text" data-pk="zhuban_sn" data-url="${rc.getContextPath()}/do/plan/save.html" data-title="输入主板S/N">${(plan.planItems['zhuban_sn'].itemValue)!""}</a>
				</td>
				<td>MAC地址</td>
				<td>
					<a href="#" class="editable" id="mac_address" data-type="text" data-pk="mac_address" data-url="${rc.getContextPath()}/do/plan/save.html" data-title="输入MAC地址">${(plan.planItems['mac_address'].itemValue)!""}	</a>
				</td>
		</tr>
		<tr>
				<td>IMEI</td>
				<td>
					<a href="#" class="editable" id="imei" data-type="text" data-pk="imei" data-url="${rc.getContextPath()}/do/plan/save.html" data-title="输入IMEI">${(plan.planItems['imei'].itemValue)!""}</a>
				</td>
				<td>MEID</td>
				<td>
					<a href="#" class="editable" id="meid" data-type="text" data-pk="meid" data-url="${rc.getContextPath()}/do/plan/save.html" data-title="输入MEID">${(plan.planItems['meid'].itemValue)!""}</a>
				</td>
		</tr>
		<tr>
				<td>蓝牙地址</td>
				<td>
					<a href="#" class="editable" id="bluetooth_address" data-type="text" data-pk="bluetooth_address" data-url="${rc.getContextPath()}/do/plan/save.html" data-title="输入蓝牙地址">${(plan.planItems['bluetooth_address'].itemValue)!""}</a>
				</td>
				<td></td>
				<td></td>
		</tr>
		<tr>
				<td>备注</td>
				<td colspan = "4" >
					<div id="comments" data-type="wysihtml5" data-pk="comments">${(plan.planItems['comments'].itemValue)!""}</div>
					<script>
					$('#comments').editable({
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
</table>

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