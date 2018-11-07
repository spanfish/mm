<br/>
<#if templates??>
	<form method="GET" action="${rc.getContextPath()}/do/plan/input.html">
		<label for="templateId">选择计划模板</label>
		<select id="templateId" name="templateId" style="width:auto">
			<#list templates as t>
				<option value="${t.id}">${t.name}</option>
			</#list>
		</select>
		<input type="submit" value="创建生产计划"/>
	</form>
</#if>