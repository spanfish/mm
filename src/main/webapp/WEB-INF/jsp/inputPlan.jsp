<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<link href="<%=request.getContextPath()%>/resources/bootstrap/bootstrap.min.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/bootstrap3-editable/css/bootstrap-editable.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/main.css">

<script src="<%=request.getContextPath()%>/resources/jquery/jquery-2.0.3.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/bootstrap/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/bootstrap3-editable/js/bootstrap-editable.min.js"></script>

<style>
* {
	box-sizing: border-box;
}

input[type=text], select, textarea {
	width: 100%;
	padding: 12px;
	border: 1px solid #ccc;
	border-radius: 4px;
	resize: vertical;
}

label {
	padding: 12px 12px 12px 0;
	display: inline-block;
}

input[type=submit] {
	background-color: #4CAF50;
	color: white;
	padding: 12px 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

input[type=submit]:hover {
	background-color: #45a049;
}

.container {
	border-radius: 5px;
	background-color: #f2f2f2;
	padding: 20px;
}

.col-25 {
	float: left;
	width: 180px;
	margin-top: 6px;
}

.col-75 {
	float: left;
	margin-top: 6px;
}

/* Clear floats after the columns */
.row:after {
	content: "";
	display: table;
	clear: both;
}

/* Responsive layout - when the screen is less than 600px wide, make the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 600px) {
	.col-25, .col-75, input[type=submit] {
		width: 100%;
		margin-top: 0;
	}
}
</style>

<script>
	$.fn.editable.defaults.mode = 'popup';

	$(document).ready(function() {
		$('.editable').editable();
	});
</script>
</head>
<body style=" width: 100%;">
	<jsp:include page="navi.jsp">
		<jsp:param name="page" value="home" />
	</jsp:include>

	<br/>
	<br/>
	<form name="form" method="POST" action="<%=request.getContextPath()%>/do/plan/create.html">
	<table border="1" style="margin-left: auto;margin-right: auto; width:80%">
		<tr>
			<td style="width:100px">客户名称:</td>
			<td><a href="#" class="editable" id="customerName" data-type="text" data-pk="customerName" data-url="<%=request.getContextPath()%>/do/plan/saveHead.html" data-title="输入客户名称"></a></td>
			<td style="width:100px">销售：</td>
			<td><a href="#" id="saleType" data-type="checklist" data-pk="saleType" data-url="<%=request.getContextPath()%>/do/plan/saveList.html" data-title="选择销售"></a> 
				<script>
					$(function() {
						$('#saleType').editable({
							value : 1,
							source : [ {
								value : 1,
								text : '内销'
							}, {
								value : 2,
								text : '外销'
							}]
						});
					});
				</script>
			</td>
		</tr>
		<tr>
			<td>文件编号:</td>
			<td></td>
			<td>日期：</td>
			<td></td>
		</tr>
	</table>
	<br/>
	<table border="1" style="margin-left: auto;margin-right: auto; width:80%">
		<thead>
			<tr>
				<th colspan="4">生产资料（无请填写/）</th>
			</tr>
		</thead>
		<tfoot align="center">
	      <tr>
	        <td colspan="4"><input type="submit" value="提交审核"/></td>
	      </tr>
	    </tfoot>
	    <tbody>
		<tr>
			<td style="width:140px">产品名称 </td>
			<td style="width:200px">产品型号 </td>
			<td style="width:160px">PCB 版本号 </td>
			<td style="width:160px">产品P/N </td>
		</tr>
		<tr>
			<td><a href="#" class="editable" id="productName" data-type="text" data-pk="1" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入产品名称"></a></td>
			<td><a href="#" class="editable" id="productModel" data-type="text" data-pk="1" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入产品型号"></a></td>
			<td><a href="#" class="editable" id="pcbVer" data-type="text" data-pk="1" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入PCB版本号 "></a></td>
			<td><a href="#" class="editable" id="productPN" data-type="text" data-pk="1" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入产品P/N"></a></td>
			
		</tr>
		<tr>
			<td>类别</td>
			<td colspan="3"><a href="#" id="category" data-type="checklist" data-pk="1" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入类别"></a>
				<script>
					$(function() {
						$('#category').editable({
							value : 1,
							source : [ {
								value : 1,
								text : 'SMT'
							}, {
								value : 2,
								text : '插件'
							}, {
								value : 3,
								text : '组装'
							}, {
								value : 4,
								text : '其他'
							}]
						});
					});
				</script>
			</td>
			
		</tr>
		<tr>
			<td>贴片BOM</td>
			<td colspan="3"><a href="#" id="bom" data-type="textarea" data-pk="1" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入产品P/N"></a>
			<script>
				$(function(){
				    $('#bom').editable({
				        url: '/post',
				        title: '贴片BOM',
				        rows: 2
				    });
				});
				</script>
			</td>
			
		</tr>
		<tr>
			<td>SMT资料包</td>
			<td colspan="3"><a href="#" id="smtDocPackage" data-type="textarea" data-pk="1" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入产品P/N"></a>
			<script>
				$(function(){
				    $('#smtDocPackage').editable({
				        url: '/post',
				        title: 'SMT资料包',
				        rows: 2
				    });
				});
				</script>
			</td>
		</tr>
		<tr>
			<td>软件版本号</td>
			<td colspan="3"><a href="#" id="softwareVer" data-type="textarea" data-pk="1" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入产品P/N"></a>
			<script>
				$(function(){
				    $('#softwareVer').editable({
				        url: '/post',
				        title: '软件版本号',
				        rows: 2
				    });
				});
				</script>
			</td>
		</tr>
		<tr>
			<td>下载软件名</td>
			<td colspan="3"><a href="#" id="downloadSoft" data-type="textarea" data-pk="1" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入产品P/N"></a>
			<script>
				$(function(){
				    $('#downloadSoft').editable({
				        url: '/post',
				        title: '下载软件名',
				        rows: 2
				    });
				});
				</script>
			</td>
		</tr>
		<tr>
			<td>烧录软件校验和</td>
			<td colspan="3"><a href="#" id="softChecksum" data-type="textarea" data-pk="1" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入产品P/N"></a>
			<script>
				$(function(){
				    $('#softChecksum').editable({
				        url: '/post',
				        title: '烧录软件校验和',
				        rows: 2
				    });
				});
				</script>
			</td>
		</tr>
		<tr>
			<td>测试流程要求</td>
			<td colspan="3"><a href="#" id="testFlow" data-type="textarea" data-pk="1" data-url="<%=request.getContextPath()%>/do/plan/save.html" data-title="输入产品P/N"></a>
			<script>
				$(function(){
				    $('#testFlow').editable({
				        url: '/post',
				        title: '测试流程要求',
				        rows: 2
				    });
				});
				</script>
			</td>
		</tr>
		<tr>
			<td>测试流程要求</td>
			<td colspan="3">
			</td>
		</tr>
		<tr>
			<td>测试流程要求</td>
			<td colspan="3">
			</td>
		</tr>
		</tbody>
	</table>

		
	</form>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>