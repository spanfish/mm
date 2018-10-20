<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
	
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="cache-control" content="max-age=0" />
    <meta http-equiv="cache-control" content="no-cache" />
    <meta http-equiv="expires" content="Tue, 01 Jan 1980 1:00:00 GMT" />
    <meta http-equiv="pragma" content="no-cache" />
        
	<title>模板管理</title>
	<script src="<%=request.getContextPath()%>/resources/jquery/jquery-2.0.3.min.js"></script>
	<link href="<%=request.getContextPath()%>/resources/main.css" rel="stylesheet">
	<link href="<%=request.getContextPath()%>/resources/w3.css" rel="stylesheet">
	
	<!-- bootstrap -->
	<link href="<%=request.getContextPath()%>/resources/bootstrap300/css/bootstrap.css" rel="stylesheet">
	<script src="<%=request.getContextPath()%>/resources/bootstrap300/js/bootstrap.js"></script>
		
	<!-- X-editable -->
	<link href="<%=request.getContextPath()%>/resources/bootstrap3-editable/css/bootstrap-editable.css" rel="stylesheet">
	<script src="<%=request.getContextPath()%>/resources/bootstrap3-editable/js/bootstrap-editable.min.js"></script>
	
	<link href="<%=request.getContextPath()%>/resources/x-editable/select2/select2.css" rel="stylesheet">
	<script src="<%=request.getContextPath()%>/resources/x-editable/select2/select2.js"></script>
		
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
	<jsp:include page="navi.jsp">
		<jsp:param name="page" value="template" />
	</jsp:include>

	<c:if test="${template == null}">
		<div class="w3-panel w3-red">
		    <h3>出错了</h3>
		    <p><c:out value="${error}"/></p>
		</div>
	</c:if>
	
	<form:form method="POST" action="${pageContext.request.contextPath }/do/template/add.htm" modelAttribute="template" >
		<table id="user" class="table table-bordered table-striped" style="clear: both">
			<tbody>
				<tr>         
	                <td width="15%">模板名称</td>
	                <td width="45%"><form:input path="name" required="required"/> </td>
	                <td width="40%">显示用，会默认作为客户名显示</td>
	            </tr>
	            <tr>         
	                <td>模板文件名</td>
	                <td><form:input path="viewName" required="required"/></td>
	                <td>
	                	模板的设计文件，如template.jsp，请将此文件放到服务器的/WEB-INF/jsp/目录
	                </td>
	            </tr> 
	            <tr>         
	                <td>制作权限</td>
	                <td>
						<a href="#" id="creator" data-type="select2" data-pk="1" data-value="" data-url="/post" data-title="制作者"></a>
						<script>
							$(function(){
								$('#creator').editable({
									placeholder: '制作者',
							        source: [
							              {id: 'gb', text: 'Great Britain'},
							              {id: 'us', text: 'United States'},
							              {id: 'ru', text: 'Russia'}
							           ],
							        select2: {
							           multiple: true
							        }
							    });
							});
						</script>
					</td>
	                <td>定义谁可以利用该模板，缺省为已登录系统用户</td>
	            </tr> 
	            <tr>         
	                <td>审核权限</td>
	                <td><a href="#" id="firstname" data-type="text" data-pk="1" data-placement="right" data-placeholder="Required" data-title="Enter your firstname"></a></td>
	                <td>定义谁可以审核利用该模板提交的单子，缺省为已登录系统用户</td>
	            </tr> 
	            <tr>         
	                <td>承认权限</td>
	                <td><a href="#" id="firstname" data-type="text" data-pk="1" data-placement="right" data-placeholder="Required" data-title="Enter your firstname"></a></td>
	                <td>定义谁可以承认利用该模板提交的单子，缺省为已登录系统用户</td>
	            </tr> 
	            <tr>         
	                <td>可用</td>
	                <td>
	                	<form:radiobuttons path="enabled" items="${enabledList}" itemLabel="name" itemValue="value" delimiter=" " />
					</td>
	                <td></td>
	            </tr>  
			</tbody>
		</table>
		
		<input type="submit" value="创建"/>
	</form:form>
	<br/>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>