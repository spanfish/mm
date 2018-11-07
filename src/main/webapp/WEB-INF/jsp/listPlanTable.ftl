<div>
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
		
		<tbody>
			<#if plans??>
				<!-- 当前显示页 -->
				<#assign cp =0>
				<!-- 每页显示件数 -->
				<#assign pageSize = 10>
	
				<#list plans as p>
					<tr style="height: 80px;">
						<td style="width:40px">${p_index + 1 + cp * pageSize}</td>
						<td style="width:100px">${p.createDate?string["yyyy-MM-dd"]}</td>
						<td style="width:300px">${p.customer}</td>
						<td style="width:100px">
							<a href="${rc.getContextPath()}/do/plan/input.html?notifyNo=${p.notifyNo}&planId=${p.planId}">${p.notifyNo}</a>
						</td>
						<td style="width:100px">
							<#if p.creator??>
								${p.creator.userDispName}
							</#if>
						</td>
						<td style="width:100px">
							<#if p.reviewStatus == 'REJECTED' || p.reviewStatus == 'APPROVED'>
							<div class="stamp stamp-${p.reviewStatus}">
								<span>${p.reviewDate?string["yyyy-MM-dd"]}</span>
								<span>${p.reviewer.userDispName}</span>
							</div>
							</#if>
						</td>
						<td style="width:100px">
							<#if p.approveStatus == 'REJECTED' || p.approveStatus == 'APPROVED'>
							<div class="stamp stamp-${p.approveStatus}">
								<span>${p.approveDate?string["yyyy-MM-dd"]}</span>
								<span>${p.approver.userDispName}</span>
							</div>
							</#if>
						</td>
					</tr>
				</#list>
			</#if>
		</tbody>
	</table>
	
	<#if !plans??>
		还没有生产计划
	</#if>
	
	<div class="pagination">
	<#if pageCount gt 1>
		<!-- Pagination Bar size -->
		<#assign ns = 10>
		<#assign ps = 2>
		
		<!-- Current page -->
		<#if RequestParameters.page??>
			<#assign cp = RequestParameters.page?number>
		<#else>
			<#assign cp = 0>
		</#if>
		
		<!-- Pagination Bar Start Index-->
		<#if RequestParameters.st??>
			<#assign si = RequestParameters.st?number>
		<#else>
			<#assign si = 0>
		</#if>
		
		<!-- Pagination Bar End Index-->
		<#assign ei = si + ns - 1>
		<#if pageCount - 1 lt ei>
			<#assign ei = pageCount - 1>
		</#if>
		
		<#if si gte ns>
			<a href="${rc.getContextPath()}/do/plan/list.html?st=${si-ns}&page=${si - ns}">&laquo;</a>
		</#if>
		
		<!-- Pagination Bar-->
		<#list si..ei as x>
			<#if cp == si + x_index>
    			<a class="active" href="#">${x_index + 1}</a>
    		<#else>
    			<a href="${rc.getContextPath()}/do/plan/list.html?st=${si}&page=${x_index}&pageSize=${ps}">${x_index + 1}</a>
	    	</#if>
		</#list>
	</#if>
	</div>
</div>
