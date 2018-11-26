<#assign  security=JspTaglibs["http://www.springframework.org/security/tags"] /> 
<html>
	<head>
		<meta http-equiv="cache-control" content="max-age=0" />
        <meta http-equiv="cache-control" content="no-cache" />
        <meta http-equiv="expires" content="Tue, 01 Jan 1980 1:00:00 GMT" />
        <meta http-equiv="pragma" content="no-cache" />
        
		<title>生产计划</title>

		<script src="${rc.getContextPath()}/resources/jquery/jquery-2.0.3.min.js"></script>
		
		<link href="${rc.getContextPath()}/resources/main.css" rel="stylesheet">
		<link href="${rc.getContextPath()}/resources/w3.css" rel="stylesheet">
		<!-- bootstrap -->
		<link href="${rc.getContextPath()}/resources/bootstrap300/css/bootstrap.css" rel="stylesheet">
		<script src="${rc.getContextPath()}/resources/bootstrap300/js/bootstrap.js"></script>
		
		<!-- X-editable -->
		<link href="${rc.getContextPath()}/resources/bootstrap3-editable/css/bootstrap-editable.css" rel="stylesheet">
		<script src="${rc.getContextPath()}/resources/bootstrap3-editable/js/bootstrap-editable.min.js"></script>
		
		<!-- wysihtml5 -->
		
		<link href="${rc.getContextPath()}/resources/x-editable/inputs-ext/wysihtml5/bootstrap-wysihtml5-0.0.3/bootstrap-wysihtml5-0.0.3.css" rel="stylesheet">  
        <script src="${rc.getContextPath()}/resources/x-editable/inputs-ext/wysihtml5/bootstrap-wysihtml5-0.0.3/wysihtml5-0.3.0.min.js"></script>  
        <script src="${rc.getContextPath()}/resources/x-editable/inputs-ext/wysihtml5/bootstrap-wysihtml5-0.0.3/bootstrap-wysihtml5-0.0.3.min.js"></script>
        <script src="${rc.getContextPath()}/resources/x-editable/inputs-ext/wysihtml5/wysihtml5-0.0.3.js"></script>

		<style>
			.oms_table th{
				font-weight:normal}
			label{
				font-weight:normal;}
			table{
				font-size:10px;}
			.oms_table {
				table-layout: fixed;				
			}
			.oms_table td {
				word-wrap: break-word;
				word-break: break-all;
				white-space: nowrap;
				overflow: hidden;
				text-overflow: ellipsis;
			}			
		</style>
	</head>
	<body style=" width: 100%;">
		<#assign planListClass ="active">
		<#include "navi.ftl">
		<div id="error">
			<#if error??>
				<div class="w3-panel w3-red">
				    <h3>出错了</h3>
				    <p>${error}</p>
				</div>			
			</#if>
			<#if !plan??>
				<a href="${rc.getContextPath()}/do/plan/list.html">返回</a>
			</#if>
		</div>
		
		<#if (plan.creator.username)?? && plan.creator.username == __user.principal.username>		
			<#assign canWrite = "true">
		</#if>
		
		<#include "producttaskDetail.ftl">
		<#include "buttons.ftl">
		
     	<#include "ajax.ftl">
	</body>
</html>