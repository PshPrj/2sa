<%@ page contentType="text/html; charset=utf-8"%>
<script>
var next_url;
	$("#refund").click(function(){
		var pay_num=$("#pay_num").val();
		$.ajax({
			type : "GET",
			url : "staffmodal?cmd=REFUNDMODAL&pay_num="+pay_num+"&type=Y",
			success : function(data) {
				location.reload();
			}
		});
	});
	
	$("#close").click(function (){
		location.reload();
	});
	
</script>	

<div class="modal-body">
	
	<input type="hidden" value=${pay_num } id="pay_num"/>

		<span>${id}님의 예약 환불 처리하시겠습니까?</span><br />
		<p class="text-error" style="font-size: 15px">
		이사 ${dist }일 전 환불 요청이므로 ${100-percent}%의 수수료가 부과됩니다. 예약 금액 ${price}원의  ${percent }%인  ${re_price }원의 금액이 지불됩니다.</p>

		<button class="btn" id="refund">예</button>
		<button class="btn" id="close" aria-hidden="true">아니오</button>


</div>