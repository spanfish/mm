<#assign form=JspTaglibs["http://www.springframework.org/tags/form"] /> 
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
	<link href="${rc.getContextPath()}/resources/w3.css" rel="stylesheet">
	
	<!-- bootstrap -->
	<link href="${rc.getContextPath()}/resources/bootstrap300/css/bootstrap.css" rel="stylesheet">
	<script src="${rc.getContextPath()}/resources/bootstrap300/js/bootstrap.js"></script>
		
	<!-- X-editable -->
	<link href="${rc.getContextPath()}/resources/bootstrap3-editable/css/bootstrap-editable.css" rel="stylesheet">
	<script src="${rc.getContextPath()}/resources/bootstrap3-editable/js/bootstrap-editable.min.js"></script>
	
	<link href="${rc.getContextPath()}/resources/x-editable/select2/select2.css" rel="stylesheet">
	<script src="${rc.getContextPath()}/resources/x-editable/select2/select2.js"></script>
		
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

	<#if error??>
		<div class="w3-panel w3-red">
		    <h3>出错了</h3>
		    <p>${error}</p>
		</div>
	</#if>
	
	<form method="POST" action="${rc.getContextPath()}/do/template/add.html" >
		<table id="user" class="table table-bordered table-striped" style="clear: both">
			<tbody>
				<tr>         
	                <td width="15%">模板名称</td>
	                <td width="45%"><input type="text" name="name" required="required" value="${template.name!''}"/> </td>
	                <td width="40%">显示用，会默认作为客户名显示</td>
	            </tr>
	            <tr>         
	                <td>模板文件名</td>
	                <td><input type="text" name="viewName" required="required" value="${template.viewName!''}"/></td>
	                <td>
	                	模板的设计文件，如template.jsp，请将此文件放到服务器的/WEB-INF/jsp/目录
	                </td>
	            </tr> 
	             <tr>         
	                <td>文件号码格式</td>
	                <td><input type="text" name="notifiyNoFormat" required="required"  value="${template.notifiyNoFormat!''}"/></td>
	                <td>
	                	如HX%yy%%mm%%dd%-%02d将会生成HX20181021-001<br>
	                	%yy%:年<br>
	                	%mm%:月<br>
	                	%dd%:日<br>
	                	%02d:序号, 2表示位数，0表示不足2位前面补零<br>
	                </td>
	            </tr> 
	            <tr>         
	                <td>制作权限</td>
	                <td>
						<a href="#" id="creatorNames" data-type="select2" data-pk="creatorNames" data-value="${template.creatorNames!''}" data-url="${rc.getContextPath()}/do/template/addUser.html" data-title="制作者"></a>
						<script>
							$(function(){
								$('#creatorNames').editable({
									source: [
							        	<#list users as u>
							        		{id: '${u.username}', text: '${u.userDispName}'},
							        	</#list>
							           ],
							        select2: {
							           placeholder: '选择制作者',
							           multiple: true,
							           width:'100%'
							        }
							    });
							});
						</script>
					</td>
	                <td>定义谁可以利用该模板</td>
	            </tr> 
	            <tr>         
	                <td>审核权限</td>
	                <td>
	                	<a href="#" id="reviewerNames" data-type="select2" data-pk="reviewerNames" data-value="${template.reviewerNames!''}" data-url="${rc.getContextPath()}/do/template/addUser.html" data-title="审核者"></a>
						<script>
							$(function(){
								$('#reviewerNames').editable({
							        source: [
							        	<#list users as u>
							        		{id: '${u.username}', text: '${u.userDispName}'},
							        	</#list>
							           ],
							        select2: {
							           placeholder: '选择审核者',
							           multiple: true,
							           width:'100%'
							        }
							    });
							});
						</script>
	                </td>
	                <td>定义谁可以审核利用该模板提交的单子</td>
	            </tr> 
	            <tr>         
	                <td>承认权限</td>
	                <td>
						<a href="#" id="approverNames" data-type="select2" data-pk="approverNames" data-value="${template.approverNames!''}" data-url="${rc.getContextPath()}/do/template/addUser.html" data-title="承认者"></a>
						<script>
							$(function(){
								$('#approverNames').editable({
									source: [
							        	<#list users as u>
							        		{id: '${u.username}', text: '${u.userDispName}'},
							        	</#list>
							           ],
							        select2: {
							           placeholder: '选择承认者',
							           multiple: true,
							           width:'100%'
							        }
							    });
							});
						</script>
					</td>
	                <td>定义谁可以承认利用该模板提交的单子</td>
	            </tr> 
	            <tr>         
	                <td>可用</td>
	                <td>
	                	<#if template.enabled == 1>
	                		<label><input type="radio" name="enabled" value="1" checked/><span> 可用</span></label>
	                		<label><input type="radio" name="enabled" value="0"/><span> 不可用</span></label>
	                	<#else>
	                		<label><input type="radio" name="enabled" value="1" /><span> 可用</span></label>
	                		<label><input type="radio" name="enabled" value="0" checked/><span> 不可用</span></label>
	                	</#if>
	                	
					</td>
	                <td></td>
	            </tr>  
			</tbody>
		</table>
		<#if RequestParameters.templateId??>
			<input type="submit" value="更新"/>
		<#else>
			<input type="submit" value="创建"/>
		</#if>
		
	</form>
	<br/>
</body>
</html>