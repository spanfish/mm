<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="cache-control" content="max-age=0" />
    <meta http-equiv="cache-control" content="no-cache" />
    <meta http-equiv="expires" content="Tue, 01 Jan 1980 1:00:00 GMT" />
    <meta http-equiv="pragma" content="no-cache" />
        
	<title>审核管理</title>
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
	<#assign approveClass ="active">
	<#include "../navi.ftl">
	<br/>
	
	<div style="width: 400px">
		<h3>已有组</h3>
		<form id="groupForm" action="${rc.getContextPath()}/do/process/showGroup.html" method="Post">
			<select id="group" name="groupId">
				<option value=""></option>
		    	<#if groups??>
					<#list groups as g>
						<#if groupId?? && groupId == g.id>
							<option value="${g.id}" selected>${g.id}</option>
						<#else>
							<option value="${g.id}">${g.id}</option>
						</#if>
					</#list>
				</#if>
			</select>
		</form>
		<script>
		$(function() {
  			$('#group').change(function() {
    			$('#groupForm').submit();
  				});
			});
		</script>
		

		<#if groupId??>
			<h4>组内用户</h4>
			<#if users??>
				<#list users as u>
					${u.id}
				</#list>
			<#else>
			还没添加用户
			</#if>
			<form id="addUserForm" action="${rc.getContextPath()}/do/process/addUser.html" method="Post">
		    	<input type="hidden" name="groupId" value="${groupId}"/>
			    <select id="userId" name="userId">
			    	<#if sysUsers??>
						<#list sysUsers as su>
							<option value="${su.username}">${su.userDispName}</option>
						</#list>
					</#if>
				</select>
		  		<input type="submit" value="添加用户">
			</form> 
		</#if>
		
		<br/><br/>
		<h3>新建组</h3>
	    <form action="${rc.getContextPath()}/do/process/saveGroup.html" method="Post">
		  Group(必须唯一):<br>
		  <input type="text" name="groupId">
		  <br><br>
		  <input type="submit" value="保存">
		</form> 
	</div>
</body>
</html>