<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/main.css">
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
</style>	
</head>
<body>
	<jsp:include page="navi.jsp">
		<jsp:param name="page" value="home" />
	</jsp:include>

	
	<table style="" id="plans">
		<thead>
			<tr>
				<th style="">序号</th>
				<th style="">日期</th>
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
					<td><c:out value="${p.notifyNo}"></c:out></td>
					<td><c:out value="${p.reviewer}"></c:out></td>
					<td><c:out value="${p.approver}"></c:out></td>
				</tr>
			</c:forEach>
		</table>
	
	<c:if test="${empty plans}">
		还没有生产计划
	</c:if>
	<br/>
	<a href="<%=request.getContextPath()%>/do/plan/input.html">创建生产计划</a>
	
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>