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
	<#assign workflowClass ="active">
	<#include "../navi.ftl">
	<br/>
	<div style="width: 400px;">
		<h3>设定工作流</h3>
	    <form action="${rc.getContextPath()}/do/workflow/workflow.html" method="Post" enctype="multipart/form-data">
		  
		  <input type="file" name="processDef">
		  <br><br>
		  <input type="submit" value="发布">
		</form> 
	</div>
	
	<div style="width: 400px;">
		<h3>测试工作流</h3>
	    <form action="${rc.getContextPath()}/do/workflow/start.html" method="Post">
		  
		  <input type="text" name="processDefinitionKey">
		  <br><br>
		  <input type="submit" value="启动">
		</form> 
		
		<form action="${rc.getContextPath()}/do/workflow/search.html" method="Post">
		  
		  <input type="text" name="assignee">
		  <br><br>
		  <input type="submit" value="查找">
		</form>
		
		<#if tasks??>
				<table>
					<tr>
						<th colspan="2">用户ID</th>
					</tr>
					
					<#list tasks as t>
						<tr>
							<td>
								
							</td>
							<td>${t.name}</td>
						</tr>
					</#list>
				</table>
			</#if>
	</div>
	
</body>
</html>