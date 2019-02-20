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
		table {
		    font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
		    border-collapse: collapse;
		    width: 100%;
		}
		
		table td, table th {
		    border: 1px solid #ddd;
		    padding: 8px;
		}
		
		table tr:nth-child(even){background-color: #f2f2f2;}
		
		table tr:hover {background-color: #ddd;}
		
		table th {
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
			<table>
				<tr>
					<th colspan="2">组ID</th>
				</tr>
				
				<#if groups??>
					<#list groups as g>
						<tr>
							<td>
								<#if groupId?? && groupId = g.id>
									<input type="radio" class="group" name="groupId" value="${g.id}" checked/>
								<#else>
									<input type="radio" class="group" name="groupId" value="${g.id}"/>
								</#if>
								
								
								</td>
							<td>${g.id}</td>
						</tr>
					</#list>
				</#if>
			</table>
		</form>
		<script>
		$(function() {
  			$('.group').click(function() {
    			$('#groupForm').submit();
  				});
			});
		</script>
		

		<#if groupId??>
			<h4>组"${groupId}"内用户</h4>
			<#if users??>
				<table>
					<tr>
						<th colspan="2">用户ID</th>
					</tr>
					
					<#list users as u>
						<tr>
							<td>
								<input type="checkbox" name="删除" value="${u.id}"/>
							</td>
							<td>${u.id}</td>
						</tr>
					</#list>
				</table>
				<input type="submit" value="从组里删除用户">
			<#else>
			还没添加用户
			</#if>
			<br/><br/>
			<form id="addUserForm" action="${rc.getContextPath()}/do/process/addUser.html" method="Post">
				<div style="display:table">
					<div style="display: table-cell;">
						<input type="hidden" name="groupId" value="${groupId}"/>
					    <select id="userId" name="userId">
					    	<#if sysUsers??>
								<#list sysUsers as su>
									<option value="${su.username}">${su.userDispName}</option>
								</#list>
							</#if>
						</select>
					</div>
					<div style="display: table-cell;">
	  					<input type="submit" value="添加用户">
	  				</div>
	  			</div>
			</form> 
		</#if>
		
		<br/><br/>
		<h3>新建组</h3>
	    <form action="${rc.getContextPath()}/do/process/saveGroup.html" method="Post">
		  组ID(必须唯一且和工作流中设置一致):<br>
		  <input type="text" name="groupId">
		  <br><br>
		  <input type="submit" value="创建">
		</form> 
	</div>
</body>
</html>