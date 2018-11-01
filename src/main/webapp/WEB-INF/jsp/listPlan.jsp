<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring"
	uri="http://www.springframework.org/tags"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
	<!-- bootstrap -->
	<link href="<%=request.getContextPath()%>/resources/bootstrap300/css/bootstrap.css" rel="stylesheet">
	<script src="<%=request.getContextPath()%>/resources/bootstrap300/js/bootstrap.js"></script>
	
	<!-- X-editable -->
	<link href="<%=request.getContextPath()%>/resources/bootstrap3-editable/css/bootstrap-editable.css" rel="stylesheet">
	<script src="<%=request.getContextPath()%>/resources/bootstrap3-editable/js/bootstrap-editable.min.js"></script>
		
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
</head>
<body>
	<jsp:include page="navi.jsp">
		<jsp:param name="page" value="home" />
	</jsp:include>

	<table id="search">
		<tr>
			<th style="width: 120px;text-align:right">创建/更新日期: 从</th>
			<td>
				<div>
					<a class="search" href="#" id="d1" data-type="date" data-pk="dateFrom" data-url="<%=request.getContextPath()%>/do/plan/search.html" data-title="选择日期">${dateFrom }</a>
					<script>
						$(function(){
						    $('#d1').editable({
						    	placement: 'bottom',
						        format: 'yyyy-mm-dd',   
						        viewformat: 'yyyy-mm-dd',    
						        datepicker: {
						                weekStart: 1
						           }
						        });
						});
					</script>
				</div>
			</td>
			<th style="width: 40px; text-align:right">到</th>			
			<td>
				<div>
					<a class="search" href="#" id="d2" data-type="date" data-pk="dateTo" data-url="<%=request.getContextPath()%>/do/plan/search.html" data-title="选择日期">${dateTo}</a>
					<script>
						$(function(){
						    $('#d2').editable({
						    	placement: 'bottom',
						        format: 'yyyy-mm-dd',    
						        viewformat: 'yyyy-mm-dd',    
						        datepicker: {
						                weekStart: 1
						           }
						        });
						});
					</script>
				</div>
			</td>
			<th style="width: 60px; text-align:right">客戶</th>
			<td style="width: 180px;">
				<a href="#" id="status" data-type="select" data-pk="customer" data-url="<%=request.getContextPath()%>/do/plan/search.html" data-title="选择客戶"></a>
				<script>
				$(function(){
				    $('#status').editable({
				    	placement: 'bottom',
				        value: '',    
				        source: [
				        	<c:forEach items="${visibleTemplates}" var="t">
				        	{value: '<c:out value="${t.id}"/>', text: '<c:out value="${t.name}"/>'},
							</c:forEach>
				           ]
				    });
				});
				</script>
			</td>
			
			<th style="width: 120px; text-align:right">生产计划通知书号</th>
			<td>
				<a href="#" id="notifyNo" data-type="text" data-pk="notifyNo" data-url="<%=request.getContextPath()%>/do/plan/search.html">${notifyNo }</a>
				<script>
				$(function(){
				    $('#notifyNo').editable({
				    	placement: 'bottom',
				        mode: 'inline'
				    });
				});
				</script>
			</td>
			<td>
				<form method="POST" action="<%=request.getContextPath()%>/do/plan/search.html">
					<input type="submit" value="检索"/>
				</form>
			</td>
		</tr>
	</table>
	<table style="width:900px" id="plans">
		<thead>
			<tr>
				<th style="">序号</th>
				<th style="width: 200px">
					<div>创建/更新日期</div>
				</th>
				<th style="">客戶</th>
				<th style="">生产计划通知书号</th>
				<th style="">制作</th>
				<th style="">审核</th>
				<th style="">承认</th>
			</tr>
		</thead>
			<c:set value="ROLE_ADMIN" var="role" scope="page"> </c:set>

			<c:if test="${not empty plans }">
			<c:forEach var="p" items="${plans}" varStatus="status">
				<tr>
					<td style="width:40px"><c:out value="${status.index + 1}"></c:out></td>
					<td style="width:100px"><fmt:formatDate value="${p.createDate}" pattern="yyyy-MM-dd" /></td>
					<td style="width:300px"><c:out value="${p.customer}"></c:out></td>
					<td style="width:100px">
						<spring:url value="${p.notifyNo}" var="notifyNo" htmlEscape="true"/>
						<spring:url value="${p.planId}" var="planId" htmlEscape="true"/>
						<a href="<%=request.getContextPath()%>/do/plan/input.html?notifyNo=${notifyNo}&planId=${planId}"><c:out value="${p.notifyNo}"></c:out></a>
					</td>
					<td style="width:100px"><c:out value="${p.creator.userDispName}"></c:out></td>
					<td style="width:100px">
						<c:if test="${plan.reviewStatus == 'REJECTED'  or plan.reviewStatus == 'APPROVED'}">
						<div class="stamp stamp-${plan.reviewStatus}">
							<span><fmt:formatDate value="${p.reviewDate}" pattern="yyyy-MM-dd" /></span>
							<span><c:out value="${p.reviewer.userDispName}"></c:out></span>
						</div>
						</c:if>
					</td>
					<td style="width:100px">
						<c:if test="${plan.approveStatus == 'REJECTED'  or plan.approveStatus == 'APPROVED'}">
						<div class="stamp stamp-${p.approveStatus}">
							<span><fmt:formatDate value="${p.approveDate}" pattern="yyyy-MM-dd" /></span>
							<span><c:out value="${p.approver.userDispName}"></c:out></span>
						</div>
						</c:if>
					</td>
				</tr>
			</c:forEach>
			</c:if>
		</table>
	
		<div class="pagination">
			
			<c:if test="${empty param.st}">
				<c:set value="1" var="st"></c:set>
			</c:if>
			<c:if test="${not empty param.st}">
				<c:set value="${param.st}" var="st"></c:set>
			</c:if>
			<c:set value="5" var="ps"></c:set>
			<c:set value="${st + ps - 1 }" var="es"></c:set>
			
			<c:if test="${pageCount < es}">
				<c:set value="${pageCount}" var="es"></c:set>
			</c:if>
			
			<c:if test="${st > ps}">
				<a href="<%=request.getContextPath()%>/do/plan/list.html?st=${st-ps}&page=${st - ps}">&laquo;</a>
			</c:if>
			
			<c:if test="${not empty param.page}">
				<c:set value="${param.page}" var="cp"></c:set>
			</c:if>
			<c:if test="${empty param.page}">
				<c:set value="1" var="cp"></c:set>
			</c:if>
			
		    <c:forEach begin="${st}" end="${es}" varStatus="loop">
		    	<c:if test="${cp == loop.index}">
		    		<a class="active" href="#">${loop.index}</a>
		    	</c:if>
		    	<c:if test="${cp != loop.index}">
		    		<a  href="<%=request.getContextPath()%>/do/plan/list.html?page=${loop.index}">${loop.index}</a>
		    	</c:if>
		   </c:forEach>
		   
		   <c:if test="${pageCount > es}">
				<a href="<%=request.getContextPath()%>/do/plan/list.html?st=${es + 1}&page=${es + 1}">&raquo;</a>
		   </c:if>
		  
		</div>
	<c:if test="${empty plans}">
		还没有生产计划
	</c:if>
	<br/>
	<c:if test="${not empty templates}">
		<form method="GET" action="<%=request.getContextPath()%>/do/plan/input.html">
			
			<label for="templateId">选择计划模板</label>
			<select id="templateId" name="templateId" style="width:auto">
				<c:forEach items="${templates}" var="t">
					<option value="${t.id}"><c:out value="${t.name}"/></option>
				</c:forEach>
			</select>
			<input type="submit" value="创建生产计划"/>
			
		</form>
	</c:if>
	<c:if test="${empty templates}">
	</c:if>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>