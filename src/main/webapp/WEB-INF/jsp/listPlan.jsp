<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring"
	uri="http://www.springframework.org/tags"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/main.css">
<link href="<%=request.getContextPath()%>/resources/bootstrap/bootstrap.min.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/bootstrap3-editable/css/bootstrap-editable.css" rel="stylesheet">

<script src="<%=request.getContextPath()%>/resources/jquery/jquery-2.0.3.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/bootstrap/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/bootstrap3-editable/js/bootstrap-editable.min.js"></script>

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
<script>
	$.fn.editable.defaults.mode = 'popup';

	$(document).ready(function() {
		$('.editable').editable();
	});
</script>
</head>
<body>
	<jsp:include page="navi.jsp">
		<jsp:param name="page" value="home" />
	</jsp:include>

	
	<table style="" id="plans">
		<thead>
			<tr>
				<th style="">序号</th>
				<th style="">创建/更新日期</th>
				<th style="">客戶</th>
				<th style="">生产计划通知书号</th>
				<th style="">审核</th>
				<th style="">承认</th>
			</tr>
		</thead>
			<c:forEach var="p" items="${plans}" varStatus="status">
				<tr>
					<td><c:out value="${status.index + 1}"></c:out></td>
					<td><c:out value="${p.createDate}"></c:out></td>
					<td><c:out value="${p.customer}"></c:out></td>
					<td>
						<spring:url value="${p.notifyNo}" var="notifyNo" htmlEscape="true"/>
						<spring:url value="${p.planId}" var="planId" htmlEscape="true"/>
						<a href="<%=request.getContextPath()%>/do/plan/input.html?notifyNo=${notifyNo}&planId=${planId}"><c:out value="${p.notifyNo}"></c:out></a>
					</td>
					<td>
						
						<c:if test="${p.status == 'REVIEWING'}">
							审核中
						</c:if>
						<c:if test="${p.status == 'CREATING'}">
							未提交审核
						</c:if>
						<c:if test="${p.status == 'APPROVING'}">
							最终承认中
						</c:if>
						
					</td>
					<td><c:out value="${p.approver}"></c:out></td>
				</tr>
			</c:forEach>
		</table>
	
	<c:if test="${empty plans}">
		还没有生产计划
	</c:if>
	<br/>
	<form method="POST" action="<%=request.getContextPath()%>/do/plan/input.html">
		<label for="templateId">选择计划模板</label>
		<select id="templateId" name="templateId">
			<c:forEach items="${templates}" var="t">
				<option value="${t.id}"><c:out value="${t.name}"/></option>
			</c:forEach>
		</select>
		<input type="submit" value="创建生产计划"/>
	</form>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>