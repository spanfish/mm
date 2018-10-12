<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Main</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
* {
	box-sizing: border-box;
}

body {
	font-family: Arial, Helvetica, sans-serif;
}

/* Style the header */
header {
	background-color: #666;
	padding: 10px;
	text-align: left;
	font-size: 14px;
	color: white;
	margin-top: 0;
	margin-left: 0
}

header h1 {
	margin-top: 0;
	margin-left: 15px
}

/* Create two columns/boxes that floats next to each other */
nav {
	float: left;
	width: 10%;
	height: 300px; /* only for demonstration, should be removed */
	background: #ccc;
	padding: 20px;
}

/* Style the list inside the menu */
nav ul {
	list-style-type: none;
	padding: 0;
}

article {
	float: left;
	padding: 20px;
	width: 90%;
	background-color: #f1f1f1;
	height: 300px; /* only for demonstration, should be removed */
}

/* Clear floats after the columns */
section:after {
	content: "";
	display: table;
	clear: both;
}

/* Style the footer */
footer {
	background-color: #777;
	padding: 10px;
	text-align: center;
	color: white;
}

/* Responsive layout - makes the two columns/boxes stack on top of each other instead of next to each other, on small screens */
@media ( max-width : 600px) {
	nav, article {
		width: 100%;
		height: auto;
	}
}
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>

	<section>
		<jsp:include page="navi.jsp"></jsp:include>
		<article>
			<h1>User</h1>
			<p>
				<c:if test="${not empty users}">
					<table style="width: 300px;">
						<tr>
							<th>No</th>
							<th>ID</th>
							<th>Email</th>
							<th>Enabled</th>
							<th></th>
						</tr>
					<c:forEach var="u" items="${users}" varStatus="status">
						<tr>
							<td style="width: 10px;"><c:out value="${status.index +1}"/></td>
							<td style="width: 100px;"><c:out value="${u.username}"></c:out></td>
							<td style="width: 200px;"><c:out value="${u.email}"></c:out></td>
							<td style="width: 30px;"><c:out value="${u.enabled ? 'Y' : 'N'}"></c:out></td>
							<td style="width: 40px;"><a href="<%=request.getContextPath()%>/do/user/edit/${u.username}.htm">Edit</a></td>
						</tr>
					</c:forEach>
					</table>
				</c:if>
			</p>
		</article>
	</section>

	<footer>
		<p>Footer</p>
	</footer>
</body>
</html>