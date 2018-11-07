<center>
	<br/>
	<#if plan.status == 'CREATING'>
		<#if plan.creator.username == __user.principal.username>		
			<form name="form" method="POST" action="${rc.getContextPath()}/do/plan/submitReview.html">
				<input type="hidden" name="planId" value="${plan.planId}">
				<input type="submit" value="提交审核"/>
			</form>
		</#if>
	<#elseif plan.status == 'REVIEWING'>
		<#if (template.reviewers)??>
			<#list template.reviewers as r>
				<#if r.username == __user.principal.username>
					<form name="form" method="POST" action="${rc.getContextPath()}/do/plan/review.html">
						<input type="hidden" name="planId" value="${plan.planId}">
						<input type="submit" name="action" value="发回修改"/>
						<input type="submit" name="action" value="通过审核"/>
					</form>
				</#if>
			</#list>
		</#if>
		
	<#elseif plan.status == 'APPROVING'>
		<#if (template.approvers)??>
			<#list template.approvers as r>
				<#if r.username == __user.principal.username>
					<form name="form" method="POST" action="${rc.getContextPath()}/do/plan/approve.html">
						<input type="hidden" name="planId" value="${plan.planId}">
						<input type="submit" name="action" value="发回修改"/>
						<input type="submit" name="action" value="承认"/>
					</form>
				</#if>
			</#list>
		</#if>
	</#if>
</center>