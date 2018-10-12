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

	<table style="width: 700px;" id="users">
			<tr>
				<th style="width: 200px;">序号</th>
				<th style="width: 200px;">日期</th>
				<th style="width: 100px;">客戶</th>
				<th style="width: 100px;">生产计划通知书号</th>
				<th style="width: 100px;">版本號号</th>
				<th style="width: 100px;">生产型号</th>
				<th style="width: 100px;">生产BOM编号</th>
				<th style="width: 100px;">软件版本号</th>
				<th style="width: 100px;">订单数量</th>
				<th style="width: 100px;">生产类型</th>
				<th style="width: 100px;">备注</th>
				<th style="width: 100px;">审核</th>
				<th style="width: 100px;">承认</th>
			</tr>
			<c:forEach var="u" items="${users}" varStatus="status">
				<tr>
					<td><c:out value="${u.username}"></c:out></td>
					<td><c:out value="${u.email}"></c:out></td>
					<td><c:out value="${u.enabled ? '有效' : '无效'}"></c:out></td>
					<td><a href="<%=request.getContextPath()%>/do/user/edit/${u.username}.htm">编辑</a></td>
				</tr>
			</c:forEach>
		</table>
	
	<c:if test="${empty users}">
		还没有用户
	</c:if>
	<br/>
	<a href="<%=request.getContextPath()%>/do/user/create/default.htm">创建用户</a>
	
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>