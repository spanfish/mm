<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
	<head>
		<meta http-equiv="cache-control" content="max-age=0" />
        <meta http-equiv="cache-control" content="no-cache" />
        <meta http-equiv="expires" content="Tue, 01 Jan 1980 1:00:00 GMT" />
        <meta http-equiv="pragma" content="no-cache" />
        
		<title>生产计划</title>

		<script src="<%=request.getContextPath()%>/resources/jquery/jquery-2.0.3.min.js"></script>
		
		<link href="<%=request.getContextPath()%>/resources/main.css" rel="stylesheet">
		<link href="<%=request.getContextPath()%>/resources/w3.css" rel="stylesheet">
		<!-- bootstrap -->
		<link href="<%=request.getContextPath()%>/resources/bootstrap300/css/bootstrap.css" rel="stylesheet">
		<script src="<%=request.getContextPath()%>/resources/bootstrap300/js/bootstrap.js"></script>
		
		<!-- X-editable -->
		<link href="<%=request.getContextPath()%>/resources/bootstrap3-editable/css/bootstrap-editable.css" rel="stylesheet">
		<script src="<%=request.getContextPath()%>/resources/bootstrap3-editable/js/bootstrap-editable.min.js"></script>
		
		<!-- wysihtml5 -->
		
		<link href="<%=request.getContextPath()%>/resources/x-editable/inputs-ext/wysihtml5/bootstrap-wysihtml5-0.0.3/bootstrap-wysihtml5-0.0.3.css" rel="stylesheet">  
        <script src="<%=request.getContextPath()%>/resources/x-editable/inputs-ext/wysihtml5/bootstrap-wysihtml5-0.0.3/wysihtml5-0.3.0.min.js"></script>  
        <script src="<%=request.getContextPath()%>/resources/x-editable/inputs-ext/wysihtml5/bootstrap-wysihtml5-0.0.3/bootstrap-wysihtml5-0.0.3.min.js"></script>
        <script src="<%=request.getContextPath()%>/resources/x-editable/inputs-ext/wysihtml5/wysihtml5-0.0.3.js"></script>

		<style>
			.oms_table {
				table-layout: fixed;				
			}
			.oms_table td {
				white-space: nowrap;
				overflow: hidden;
				text-overflow: ellipsis;
			}			
		</style>
	</head>
	<body style=" width: 100%;">
		<jsp:include page="navi.jsp">
			<jsp:param name="page" value="home" />
		</jsp:include>

		<div id="error">
		<c:if test="${not empty error}">
			<div class="w3-panel w3-red">
			    <h3>出错了</h3>
			    <p><c:out value="${error}"/></p>
			</div>
			<c:if test="${empty plan}">
				<a href="<%=request.getContextPath()%>/do/plan/list.html">返回</a>
			</c:if>
		</c:if>
		</div>
		<c:if test="${plan != null}">
			<jsp:include page="./gubeiDetail.jsp">
				<jsp:param value="" name="view"/>
			</jsp:include>
				<center>
				<br/>
				<c:if test="${plan.status == 'CREATING' }">
        		<form name="form" method="POST" action="<%=request.getContextPath()%>/do/plan/submitReview.html">
        			<input type="hidden" name="planId" value="${plan.planId}">
        			<input type="submit" value="提交审核"/>
        		</form>
        		</c:if>
        		
        		<c:if test="${plan.status == 'REVIEWING' }">
        		<form name="form" method="POST" action="<%=request.getContextPath()%>/do/plan/review.html">
        			<input type="hidden" name="planId" value="${plan.planId}">
        			<input type="submit" name="action" value="发回修改"/>
        			<input type="submit" name="action" value="通过审核"/>
        		</form>
        		</c:if>
        		
        		<c:if test="${plan.status == 'APPROVING' }">
        		<form name="form" method="POST" action="<%=request.getContextPath()%>/do/plan/approve.html">
        			<input type="hidden" name="planId" value="${plan.planId}">
        			<input type="submit" name="action" value="发回修改"/>
        			<input type="submit" name="action" value="承认"/>
        		</form>
        		</c:if>
	     	</center>
		</c:if>
	<jsp:include page="footer.jsp"></jsp:include>
	<jsp:include page="ajax.jsp"></jsp:include>
</body>
</html>
