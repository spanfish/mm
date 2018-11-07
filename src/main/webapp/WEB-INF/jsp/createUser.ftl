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
	<link href="${rc.getContextPath()}/resources/w3.css" rel="stylesheet">
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

	<#if error??>
		<div class="w3-panel w3-red">
		    <h3>出错了</h3>
		    <p>${error}</p>
		</div>
	</#if>
	
	<form method="POST"
		action="${rc.getContextPath()}/do/user/create/create.html">
		<div class="container">
			<label for="username"><b>用户ID，用于登陆系统，创建后不可修改</b></label> 
			<input type="text" placeholder="请输入用户ID" name="username" required="required"/>
			
		    <label for="username"><b>用户名</b></label> 
			<input type="text" placeholder="请输入用户名"  name="userDispName" required="required"/> 
			
			<label for="email"><b>Email</b></label> 
			<input type="text" placeholder="请输入邮件"  name="email" /> 
			
			<label for="psw"><b>密码</b></label> 
			<input type="password" placeholder="请输入密码"  name="password" required="required"/> 
			
			<label for="psw-repeat"><b>密码确认</b></label> 
			<input type="password" placeholder="请输入密码确认"  name="password2" required="required"/>
			<br/>
			<label for="role"><b>权限</b></label>
			<select name="userRole">
				<option value="ROLE_USER">一般</option>
				<option value="ROLE_ADMIN">管理员</option>
			</select>
			<hr>
			
			<input type="submit" class="registerbtn" value="创建用户"></input>
		</div>
	</form>
</body>
</html>