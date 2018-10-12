<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<ul>
  <li><a class="<%="home".equals(request.getParameter("page")) ? "active" : "" %>" href="<%=request.getContextPath()%>/do/plan/list.htm">生产计划</a></li>
  <li><a href="#news">News</a></li>
  <li><a class="<%="setting".equals(request.getParameter("page")) ? "active" : "" %>" href="<%=request.getContextPath()%>/do/user/users.htm">用户设置</a></li>
  <li style="float:right"><a href="<%=request.getContextPath()%>/logout">退出</a></li>
</ul>
<br/>
