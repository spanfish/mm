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
					<input type="date" name="dateFrom" min="2018-11-01" style="width:140px">
				</td>
				<th style="width: 40px; text-align:right">到</th>
				<td>
					<input type="date" name="dateTo" min="2018-11-01">
				</td>
				<th style="width: 60px; text-align:right">客戶</th>
				<td style="width: 180px;">
					<select name="customer">
						<option></option>
						<#list templates as t>
							<option value="${t.id}">${t.name}</option>
						</#list>
					</select>
				</td>
				
				<th style="text-align:right">生产计划通知书号</th>
				<td>
					<input type="text" name="notifyNo"></input>
				</td>
				
				<th style="width: 120px; text-align:right">状态</th>
				<td>
					<select name="status">
						<option></option>
						<option value="CREATING">填写中</option>
						<option value="REVIEWING">待审核</option>
						<option value="APPROVING">待承认</option>
						<option value="APPROVED">承认通过</option>
						<option value="REJECTED">被否决</option>
					</select>
				</td>
				
				<td>
					<input type="button" value="检索"  onclick="filter()"/>
				</td>
			</tr>
		</table>
	</form>
</div>