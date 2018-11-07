<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="cache-control" content="max-age=0" />
    <meta http-equiv="cache-control" content="no-cache" />
    <meta http-equiv="expires" content="Tue, 01 Jan 1980 1:00:00 GMT" />
    <meta http-equiv="pragma" content="no-cache" />
        
	<title>用戶管理</title>
	<script src="${rc.getContextPath()}/resources/jquery/jquery-2.0.3.min.js"></script>
	<link href="${rc.getContextPath()}/resources/main.css" rel="stylesheet">
	<!-- bootstrap -->
	<link href="${rc.getContextPath()}/resources/bootstrap300/css/bootstrap.css" rel="stylesheet">
	<script src="${rc.getContextPath()}/resources/bootstrap300/js/bootstrap.js"></script>
		
	<style>
		#users {
		    font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
		    border-collapse: collapse;
		    width: 100%;
		}
		
		#users td, #users th {
		    border: 1px solid #ddd;
		    padding: 8px;
		}
		
		#users tr:nth-child(even){background-color: #f2f2f2;}
		
		#users tr:hover {background-color: #ddd;}
		
		#users th {
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
		
		input[type=button] {
			background-color: #4CAF50;
			color: white;
			padding: 12px 20px;
			border: none;
			border-radius: 4px;
			cursor: pointer;
		}
		
		input[type=button]:hover {
			background-color: #45a049;
		}
	</style>
</head>
<body>
	<#assign settingClass ="active">
	<#include "navi.ftl">

	<#if users??>
		<table style="width: 700px;" id="users">
			<tr>
				<th style="width: 200px;">用户名</th>
				<th style="width: 200px;">邮件</th>
				<th style="width: 100px;">是否有效</th>
				<th style="width: 100px;">权限</th>
				<th style="width: 100px;"></th>
			</tr>
			<#list users as u>
				<tr>
					<td>${u.username!''}</td>
					<td>${u.email!''}</td>
					<td>
						<#if u.enabled == '1'>
							有效
						<#else>
							无效
						</#if>
					</td>
					<td>
						<#list u.roles as r>
							<#if r == 'ROLE_USER'>
								一般
							<#else>
								管理员
							</#if>
						</#list>
					</td>
					<td><a href="${rc.getContextPath()}/do/user/edit/?username=${u.username}"/>编辑</a></td>
				</tr>
			</#list>
		</table>
	<#else>
		还没有用户
	</#if>
	<br/>
	<form method="GET" action="${rc.getContextPath()}/do/user/create/">
		<input type="submit" name="Create" value="创建用户">
	</form>
</body>
</html>