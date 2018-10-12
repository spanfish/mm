<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Edit User</title>
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
			<h1>Edit User</h1>
			<form:form method="POST" action="${pageContext.request.contextPath }/do/user/create/create.htm"
						modelAttribute="user" servletRelativeAction="aa">
						<table style="width: 300px;">
							<tr>
								<th>ID</th>
								<th>Email</th>
								<th>Enabled</th>
								<th></th>
							</tr>
							<tr>
								<td><form:label path="username">
                      ID</form:label></td>
								<td><form:input path="username"/></td>
							</tr>
							<tr>
								<td><form:label path="password">
                      Password</form:label></td>
								<td><form:input path="password" /></td>
							</tr>
							<tr>
								<td><form:label path="email">
                      Email</form:label></td>
								<td><form:input path="email" /></td>
							</tr>
							<tr>
								<td><form:label path="enabled">
                      Enabled</form:label></td>
								<td><form:input path="enabled" /></td>
							</tr>
							<tr>
								<td><input type="submit" value="Submit" /></td>
							</tr>
						</table>
					</form:form>
		</article>
	</section>

	<footer>
		<p>Footer</p>
	</footer>
</body>
</html>