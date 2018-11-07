<#assign  security=JspTaglibs["http://www.springframework.org/security/tags"] /> 
<ul id="navi" class="navi-ul">
	<#if planListClass??>
		<li class="navi-li"><a class="active" href="${rc.getContextPath()}/do/plan/list.html">生产计划</a></li>
	<#else>
		<li class="navi-li"><a class="" href="${rc.getContextPath()}/do/plan/list.html">生产计划</a></li>
	</#if>
	
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
  	
  	
  	<li class="navi-li" style="float:right"><a href="${rc.getContextPath()}/logout">退出</a></li>
</ul>

