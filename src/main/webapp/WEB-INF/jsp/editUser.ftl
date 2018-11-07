<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="cache-control" content="max-age=0" />
    <meta http-equiv="cache-control" content="no-cache" />
    <meta http-equiv="expires" content="Tue, 01 Jan 1980 1:00:00 GMT" />
    <meta http-equiv="pragma" content="no-cache" />
        
	<title>用戶编辑</title>
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
	
	<#if user??>
	<form method="POST" action="${rc.getContextPath()}/do/user/update/">
		<div class="container">
			<label for="username"><b>用户ID，用于登陆系统，创建后不可修改</b></label> 
			<input type="text" placeholder="请输入用户ID" name="username" readonly="true" value="${user.username}"/>
			
		    <label for="username"><b>用户名</b></label> 
			<input type="text" placeholder="请输入用户名"  name="userDispName" required="required" value="${user.userDispName}"/> 
			
			<label for="email"><b>Email</b></label> 
			<input type="text" placeholder="请输入邮件"  name="email"  value="${user.email!''}"/> 
			
			<label for="psw"><b>密码</b></label> 
			<input type="password" placeholder="请输入密码"  name="password"  value=""/> 
			
			<label for="psw-repeat"><b>密码确认</b></label> 
			<input type="password" placeholder="请输入密码确认"  name="password2"  value=""/>
			<br/>
			<label for="role"><b>权限</b></label>
			<select name="userRole">
				<#if !user.userRole??>
					<option value="ROLE_USER">一般</option>
					<option value="ROLE_ADMIN">管理员</option>
				<#elseif user.userRole == "ROLE_USER">
					<option value="ROLE_USER" selected>一般</option>
					<option value="ROLE_ADMIN">管理员</option>
				<#elseif  user.userRole == "ROLE_ADMIN">
					<option value="ROLE_USER">一般</option>
					<option value="ROLE_ADMIN" selected>管理员</option>
				<#else>
					<option value="ROLE_USER">一般</option>
					<option value="ROLE_ADMIN">管理员</option>
				</#if>
			</select>
			
			<label for="enabled"><b>启用帐号</b></label>
			<div>
				<#if user.enabled == "1">
					<label><input type="radio" name="enabled" value="1" checked/><span> 启用</span></label>
            		<label><input type="radio" name="enabled" value="0"/><span> 停用</span></label>
				<#else>
					<label><input type="radio" name="enabled" value="1" /><span> 启用</span></label>
            		<label><input type="radio" name="enabled" value="0" checked/><span> 停用</span></label>
				</#if>
			</div> 
			<hr>
			
			<input type="submit" class="registerbtn" value="保存"></input>
		</div>
	</form>
	</#if>
</body>
</html>