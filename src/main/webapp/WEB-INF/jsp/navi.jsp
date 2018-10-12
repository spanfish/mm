<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<nav>
	<ul>
		<security:authorize access="hasAnyRole('ROLE_USER', 'ROLE_ADMIN')">
			<li>My task</li>
			<li>--List</li>
			<li>--Create</li>
			<li>&nbsp;</li>
		</security:authorize>
		<li>&nbsp;</li>
		<security:authorize access="hasRole('ROLE_ADMIN')">
			<li>User</li>
			<li>--<a href="<%=request.getContextPath()%>/do/user/users.htm">List</a></li>
			<li>--<a href="<%=request.getContextPath()%>/do/user/create/default.htm">Create</a></li>
		</security:authorize>
	</ul>
</nav>