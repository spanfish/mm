<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring"
	uri="http://www.springframework.org/tags"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
	
	<!-- 当前显示页 -->
	<c:if test="${not empty param.page}">
		<c:set value="${param.page}" var="cp"></c:set>
	</c:if>
	<c:if test="${empty param.page}">
		<c:set value="0" var="cp"></c:set>
	</c:if>
	<!-- 每页显示件数 -->
	<c:if test="${not empty param.pageSize}">
		<c:set value="${param.pageSize}" var="pageSize"></c:set>
	</c:if>
	<c:if test="${empty param.pageSize}">
		<c:set value="10" var="pageSize"></c:set>
	</c:if>
	
	<c:if test="${not empty plans}">
	<c:forEach var="p" items="${plans}" varStatus="status">
		<tr>
			<td style="width:40px"><c:out value="${status.index  + 1 + cp * pageSize}"></c:out></td>
			<td style="width:100px"><fmt:formatDate value="${p.createDate}" pattern="yyyy-MM-dd" /></td>
			<td style="width:300px"><c:out value="${p.customer}"></c:out></td>
			<td style="width:100px">
				<spring:url value="${p.notifyNo}" var="notifyNo" htmlEscape="true"/>
				<spring:url value="${p.planId}" var="planId" htmlEscape="true"/>
				<a href="<%=request.getContextPath()%>/do/plan/input.html?notifyNo=${notifyNo}&planId=${planId}"><c:out value="${p.notifyNo}"></c:out></a>
			</td>
			<td style="width:100px"><c:out value="${p.creator.userDispName}"></c:out></td>
			<td style="width:100px">
				<c:if test="${p.reviewStatus == 'REJECTED'  or p.reviewStatus == 'APPROVED'}">
				<div class="stamp stamp-${plan.reviewStatus}">
					<span><fmt:formatDate value="${p.reviewDate}" pattern="yyyy-MM-dd" /></span>
					<span><c:out value="${p.reviewer.userDispName}"></c:out></span>
				</div>
				</c:if>
			</td>
			<td style="width:100px">
				<c:if test="${p.approveStatus == 'REJECTED'  or p.approveStatus == 'APPROVED'}">
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

<c:if test="${empty plans}">
	还没有生产计划
</c:if>

<div class="pagination">
<c:if test="${pageCount > 1 }">
	<!-- 导航条大小 -->
	<c:set value="10" var="ps"></c:set>
	
	<!-- 导航条开始位置 -->
	<c:if test="${empty param.st}">
		<c:set value="0" var="st"></c:set>
	</c:if>
	<c:if test="${not empty param.st}">
		<c:set value="${param.st}" var="st"></c:set>
	</c:if>
	
	<!-- 导航条结束位置 -->
	<c:set value="${st + ps - 1}" var="es"></c:set>			
	<c:if test="${pageCount - 1 < es}">
		<c:set value="${pageCount - 1}" var="es"></c:set>
	</c:if>

	<c:if test="${st >= ps}">
		<a href="<%=request.getContextPath()%>/do/plan/list.html?st=${st-ps}&page=${st - ps}&pageSize=${pageSize}">&laquo;</a>
	</c:if>

    <c:forEach begin="${st}" end="${es}" varStatus="loop">
    	<c:if test="${cp == st + loop.index}">
    		<a class="active" href="#">${loop.index + 1}</a>
    	</c:if>
    	<c:if test="${cp != st + loop.index}">
    		<a href="<%=request.getContextPath()%>/do/plan/list.html?st=${st}&page=${loop.index}&pageSize=${pageSize}">${loop.index + 1}</a>
    	</c:if>
   </c:forEach>
  
   <c:if test="${pageCount - 1> es}">
		<a href="<%=request.getContextPath()%>/do/plan/list.html?st=${st+ps}&page=${st + ps}&pageSize=${pageSize}">&raquo;</a>
   </c:if>
 </c:if>
</div>
