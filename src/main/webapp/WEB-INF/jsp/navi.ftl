<#assign  security=JspTaglibs["http://www.springframework.org/security/tags"] /> 
<ul id="navi" class="navi-ul">
	<#if planListClass??>
		<li class="navi-li"><a class="active" href="${rc.getContextPath()}/do/plan/list.html">生产计划</a></li>
	<#else>
		<li class="navi-li"><a class="" href="${rc.getContextPath()}/do/plan/list.html">生产计划</a></li>
	</#if>
	
	<@security.authorize access="hasRole('ROLE_ADMIN')">
	<#if templateClass??>
		<li class="navi-li"><a class="${templateClass}" href="${rc.getContextPath()}/do/template/">模板设置</a></li>
	<#else>
		<li class="navi-li"><a class="" href="${rc.getContextPath()}/do/template/">模板设置</a></li>
	</#if>
	
	<#if settingClass??>
		<li class="navi-li"><a class="${settingClass}" href="${rc.getContextPath()}/do/user/users.html">用户设置</a></li>
	<#else>
		<li class="navi-li"><a class="" href="${rc.getContextPath()}/do/user/users.html">用户设置</a></li>
	</#if>
	</@security.authorize>
	
  	<li class="navi-li" style="float:right"><a href="${rc.getContextPath()}/logout">退出</a></li>
  	
  	<#if RequestParameters.notifyNo??>
  		<#if RequestParameters.planId??>
  			<script>
function printPlan()
{
	window.open('${rc.getContextPath()}/do/plan/printView.html?print=true&notifyNo=${RequestParameters.notifyNo}&planId=${RequestParameters.planId}', '', 'width=1024,height=960'); 
	return false;
}
</script>
  			<li class="navi-li" style="float:right"><a href="javascript:void();" onclick="return printPlan()">打印</a></li>
  		</#if>
  	</#if>
</ul>


