<script>
	function filter() {
		$.ajax({
			  method: "POST",
			  url: "${rc.getContextPath()}/do/plan/filter.html",
			  data: $( "#f" ).serialize()
			})
			.done(function( response ) {
				$('#result').html(response);
			})
			.fail(function() {
			    alert( "出错啦" );
			});
	}
</script>
<div id="filter">
	<form id="f">
		<table id="search">
			<tr>
				<th style="width: 120px;text-align:right">创建/更新日期: 从</th>
				<td>
					<input type="date" class="rs" name="dateFrom" min="2018-11-01" style="width:140px" value="${(searchForm['dateFrom'])!''}">
				</td>
				<th style="width: 20px; text-align:right">到</th>
				<td>
					<input type="date"  class="rs" name="dateTo" min="2018-11-01" value="${(searchForm['dateTo'])!''}">
				</td>
				<th style="width: 33px; text-align:right">客戶</th>
				<td style="width: 180px;">
				<select name="customer"  class="rs"  style="width:auto" >
					<option></option>
					<#list templates as t>
						<option value="${t.id}" <#if ((searchForm['customer'])!'') == t.id>selected </#if>>${t.name}</option>
					</#list>
				</select>
				</td>
				<th style="width: 60px;" style="text-align:right">生产计划<br>通知书号</th>
				<td style="width: 140px;">
					<input type="text"  class="rs"  name="notifyNo" value="${(searchForm['notifyNo'])!''}"></input>
				</td>
				<th style="width: 64px;" style="text-align:center">文件编号/工单编号</th>
				<td style="width: 165px;">
					<input type="text"  class="rs" name="fileNo" value="${(searchForm['fileNo'])!''}"></input>
				</td>
				<th style="width: 33px; text-align:right">状态</th>
				<td style="width: 90px";>
					<select name="status" class="rs" >
						<option></option>
						<option value="CREATING" <#if ((searchForm['status'])!'') == 'CREATING'>selected </#if>>填写中</option>
						<option value="REVIEWING" <#if ((searchForm['status'])!'') == 'REVIEWING'>selected </#if>>待审核</option>
						<option value="APPROVING" <#if ((searchForm['status'])!'') == 'APPROVING'>selected </#if>>待承认</option>
						<option value="APPROVED" <#if ((searchForm['status'])!'') == 'APPROVED'>selected </#if>>承认通过</option>
						<option value="REJECTED" <#if ((searchForm['status'])!'') == 'REJECTED'>selected </#if>>被否决</option>
					</select>
				</td>
				<td>
					<input type="button" value="检索"  onclick="filter()"/>
					<input type="button" value="重置"  onclick="resetForm()"/>
				</td>
			</tr>
		</table>
	</form>
</div>