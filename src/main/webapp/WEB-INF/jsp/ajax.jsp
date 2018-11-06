<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="modal">
	<script>
		$(document).ajaxStart(function() {
			$("body").addClass("loading");
		});
		$(document).ajaxStop(function() {
			$("body").removeClass("loading");
		});
		$(document).ajaxComplete(function() {
			$('#error').html('');
		});
	</script>
</div>

<div id="ajax_msg" style="position:fixed; left:0px; bottom:0px">

</div>