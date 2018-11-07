<!DOCTYPE html>
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
	<!-- bootstrap -->
	<link href="${rc.getContextPath()}/resources/bootstrap300/css/bootstrap.css" rel="stylesheet">
	<script src="${rc.getContextPath()}/resources/bootstrap300/js/bootstrap.js"></script>
	
	<!-- X-editable -->
	<link href="${rc.getContextPath()}/resources/bootstrap3-editable/css/bootstrap-editable.css" rel="stylesheet">
	<script src="${rc.getContextPath()}/resources/bootstrap3-editable/js/bootstrap-editable.min.js"></script>
		
	<style>
		#plans #search {
			font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
			border-collapse: collapse;
			width: 100%;
		}
		
		#plans td, #users th {
			border: 1px solid #ddd;
			padding: 8px;
		}
		
		#plans tr:nth-child(even) {
			background-color: #f2f2f2;
		}
		
		
		#plans tr:hover {
			background-color: #ddd;
		}
		
		#plans th {
			padding-top: 12px;
			padding-bottom: 12px;
			text-align: left;
			background-color: #4CAF50;
			color: white;
		}
		
		input[type=submit], input[type=button] {
			background-color: #4CAF50;
			color: white;
			padding: 6px 12px;
			border: none;
			border-radius: 4px;
			cursor: pointer;
		}
		
		input[type=submit]:hover, input[type=button]:hover {
			background-color: #45a049;
		}
		
		.pagination {
			display: inline-block;
		}
		
		.pagination a {
			color: black;
			float: left;
			padding: 8px 16px;
			text-decoration: none;
		}
		
		.pagination a.active {
			background-color: #4CAF50;
			color: white;
		}
		.pagination a:hover:not(.active) {background-color: #ddd;}
		
		
		</style>
		<script>
			function filter() {
				$.ajax({
					  method: "POST",
					  url: "${rc.getContextPath()}/do/plan/filter.html",
					  data: $( "#f" ).serialize()
					})
					.done(function( response ) {
						$('#result').html(response);
					})
					.fail(function() {
					    alert( "出错啦" );
					});
			}
		</script>
	</head>
	<body>
		<#assign planListClass ="active">
		<#include "navi.ftl">
		<#include "listPlanFilter.ftl">
		<div id="result">
		<#include "listPlanTable.ftl">
		</div>
		<#include "createPlan.ftl">
	</body>
</html>