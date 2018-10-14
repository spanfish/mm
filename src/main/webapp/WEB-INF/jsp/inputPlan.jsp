<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/main.css">

<style>
* {
	box-sizing: border-box;
}

input[type=text], select, textarea {
	width: 100%;
	padding: 12px;
	border: 1px solid #ccc;
	border-radius: 4px;
	resize: vertical;
}

label {
	padding: 12px 12px 12px 0;
	display: inline-block;
}

input[type=submit] {
	background-color: #4CAF50;
	color: white;
	padding: 12px 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	float: right;
}

input[type=submit]:hover {
	background-color: #45a049;
}

.container {
	border-radius: 5px;
	background-color: #f2f2f2;
	padding: 20px;
}

.col-25 {
	float: left;
	width: 180px;
	margin-top: 6px;
}

.col-75 {
	float: left;
	margin-top: 6px;
}

/* Clear floats after the columns */
.row:after {
	content: "";
	display: table;
	clear: both;
}

/* Responsive layout - when the screen is less than 600px wide, make the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 600px) {
	.col-25, .col-75, input[type=submit] {
		width: 100%;
		margin-top: 0;
	}
}
</style>
</head>
<body>
	<jsp:include page="navi.jsp">
		<jsp:param name="page" value="home" />
	</jsp:include>

	<form:form method="POST"
		action="${pageContext.request.contextPath }/do/plan/create.htm"
		modelAttribute="plan" servletRelativeAction="">
		<div class="container">
			<div class="row">
				<div class="col-25">
					<label for="date">日期</label>
				</div>
				<div class="col-75">
					<input type="date" name="date">
				</div>
			</div>
			<div class="row">
				<div class="col-25">
					<label for="fname">客戶</label>
				</div>
				<div class="col-75">
					<form:input path="customer" />
				</div>
			</div>
			
			
			<div class="row">
				<div class="col-25">
					<label for="fname">生产计划通知书号</label>
				</div>
				<div class="col-75">
					<input type="text" id="fname" name="firstname"
						placeholder="Your name..">
				</div>
			</div>
			
			<div class="row">
				<div class="col-25">
					<label for="fname">版本号</label>
				</div>
				<div class="col-75">
					<input type="text" id="fname" name="firstname"
						placeholder="Your name..">
				</div>
			</div>
			
			<div class="row">
				<div class="col-25">
					<label for="fname">生产型号</label>
				</div>
				<div class="col-75">
					<input type="text" id="fname" name="firstname"
						placeholder="Your name..">
				</div>
			</div>
			
			<div class="row">
				<div class="col-25">
					<label for="fname">生产BOM编号</label>
				</div>
				<div class="col-75">
					<input type="text" id="fname" name="firstname"
						placeholder="Your name..">
				</div>
			</div>
			
			<div class="row">
				<div class="col-25">
					<label for="fname">软件版本号</label>
				</div>
				<div class="col-75">
					<input type="text" id="fname" name="firstname"
						placeholder="Your name..">
				</div>
			</div>
			
			<div class="row">
				<div class="col-25">
					<label for="fname">订单数量</label>
				</div>
				<div class="col-75">
					<input type="text" id="fname" name="firstname"
						placeholder="Your name..">
				</div>
			</div>
			<div class="row">
				<div class="col-25">
					<label for="fname">生产类型</label>
				</div>
				<div class="col-75">
					<input type="text" id="fname" name="firstname"
						placeholder="Your name..">
				</div>
			</div>
			<div class="row">
				<div class="col-25">
					<label for="fname">备注</label>
				</div>
				<div class="col-75">
					<input type="text" id="fname" name="firstname"
						placeholder="Your name..">
				</div>
			</div>
			<!-- 
			<div class="row">
				<div class="col-25">
					<label for="fname">审核</label>
				</div>
				<div class="col-75">
					<input type="text" id="fname" name="firstname"
						placeholder="Your name..">
				</div>
			</div>
			<div class="row">
				<div class="col-25">
					<label for="fname">承认</label>
				</div>
				<div class="col-75">
					<input type="text" id="fname" name="firstname"
						placeholder="Your name..">
				</div>
			</div>
			 -->
			<hr>

			<button type="submit" class="registerbtn">创建生产计划</button>
		</div>
	</form:form>

	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>