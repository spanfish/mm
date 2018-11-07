<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="cache-control" content="max-age=0" />
    <meta http-equiv="cache-control" content="no-cache" />
    <meta http-equiv="expires" content="Tue, 01 Jan 1980 1:00:00 GMT" />
    <meta http-equiv="pragma" content="no-cache" />
        
	<title>模板管理</title>
	<script src="${rc.getContextPath()}/resources/jquery/jquery-2.0.3.min.js"></script>
	<link href="${rc.getContextPath()}/resources/main.css" rel="stylesheet">
	<!-- bootstrap -->
	<link href="${rc.getContextPath()}/resources/bootstrap300/css/bootstrap.css" rel="stylesheet">
	<script src="${rc.getContextPath()}/resources/bootstrap300/js/bootstrap.js"></script>
		
	<style>
		#plans {
		    font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
		    border-collapse: collapse;
		    width: 100%;
		}
		
		#plans td, #users th {
		    border: 1px solid #ddd;
		    padding: 8px;
		}
		
		#plans tr:nth-child(even){background-color: #f2f2f2;}
		
		#plans tr:hover {background-color: #ddd;}
		
		#plans th {
		    padding-top: 12px;
		    padding-bottom: 12px;
		    text-align: left;
		    background-color: #4CAF50;
		    color: white;
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
	</style>
</head>
<body>
	<#assign templateClass ="active">
	<#include "navi.ftl">
	
	<table style="" id="plans">
		<thead>
			<tr>
				<th style="">序号</th>
				<th style="">模板名称</th>
				<th style="">模板文件名</th>
				<th style="">通知书号码格式</th>
				<th style="">制作权限</th>
				<th style="">审核权限</th>
				<th style="">承认权限</th>
				<th style="">可用</th>
			</tr>
		</thead>
			<#if templates??>
			<#list templates as t>
				<tr>
					<td style="width:40px">
						${t_index + 1}
					</td>
					
					<td style="width:300px">
						<a href="${rc.getContextPath()}/do/template/input.html?templateId=${t.id}">${t.name}</a>
					</td>
					
					<td style="width:100px">
						${t.viewName }
					</td>
					<td style="width:200px">
						${t.notifiyNoFormat}
					</td>
					<td style="width:100px">
						<#list t.creators as u>
							${u.userDispName}
						</#list>
					</td>
					
					<td style="width:100px">
						<#list t.reviewers as u>
							${u.userDispName}
						</#list>
					</td>
					
					<td style="width:100px">
						<#list t.approvers as u>
							${u.userDispName}
						</#list>
					</td>
					<td>
						<#if t.enabled == 1>
							可用
						<#else>
							不可用
						</#if>
					</td>
				</tr>
			</#list>
			</#if>
		</table>
	
	<#if !templates??>
		还没有模板
	</#if>
	<br/>
	<form method="GET" action="${rc.getContextPath()}/do/template/input.html">
		<input type="submit" value="创建模板"/>
	</form>

</body>
</html>