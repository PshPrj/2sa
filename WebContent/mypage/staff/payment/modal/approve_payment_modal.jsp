<%@ page contentType="text/html; charset=utf-8"%>

<div class="modal-body">
<input type="hidden" value=${res_num } id="res_num"/>
	${id}의  ${res_num }번 예약을 승인 하시겠습니까? <br />
</div>
<div class="modal-footer">
	<button class="btn btn-primary" id="update_reservation">승인</button>
	<button class="btn" aria-hidden="true" >Close</button>
</div>

<script>
	$("#update_reservation").click(function(){
		var res_num=$("#res_num").val();

		$.ajax({
			type : "GET",
			url : "staffmodal?cmd=PAYMENTAPPROVE_MODAL&update=Y&res_num="+res_num,
			success : function(data) {
				location.reload();
			}
		});
	});
</script>
