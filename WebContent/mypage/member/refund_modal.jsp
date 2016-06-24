<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:forEach items="${paymentList}" var="payment">
	<c:if test="${payment.reservation_num == reservNum}">
		<input type="hidden" value="${reservNum}" />
		<!-- 결제 Modal -->
		<div class="row">
			<table class="table span3">
				<tbody>
					<tr>
						<td class="span6">예약자 : ${payment.member_name}</td>
					</tr>
					<tr>
						<td class="span6">예약일자 : ${payment.reservation_date}</td>
					</tr>
					<tr>
						<td class="span6">출발 장소 : ${payment.addr1}</td>
					</tr>
					<tr>
						<td class="span6">도착 장소 : ${payment.addr2}</td>
				</tbody>
			</table>
			<table class="table span2">
				<tbody>
					<tr>
						<td class="span6">총 결제 금액 : <fmt:formatNumber
								value="${payment.price}" type="currency" /></td>
					</tr>
					<tr></tr>
					<tr>
						<td class="span6">결제일 : ${payment.payment_date}
						</td>
					</tr>
					<tr>
						<td class="span6">결제 수단 : <c:choose>
								<c:when test="${payment.payment_type == 1}">
										신용카드
									</c:when>
								<c:when test="${payment.payment_type == 2}">
										무통장 입금
									</c:when>
								<c:when test="${payment.payment_type == 3}">
										Naver Pay
									</c:when>
								<c:when test="${payment.payment_type == 4}">
										Payco
									</c:when>
							</c:choose>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<p>환불 신청을 하시겠습니까?</p>
	</c:if>
</c:forEach>

<div id="refundRequest" hidden="hidden">
	
</div>

<script type="text/javascript">
	var payType = null;
	var cardName = null;
	var reservNum = null;

	$(function() {
		reservNum = $('input').val();
		$('#creditHide').attr('hidden', 'hidden');
	})

	$('#credit').bind("click", function() {
		$('#creditHide').removeAttr('hidden');
	})

	$('.payTypeBtn').bind("click", function() {
		payType = $(this).val();
	})

	$('.dropdown-menu li').bind("click", function() {
		cardName = $(this).text();
	})

	$('#refundBtn').bind("click", function() {
		$.post('mypage', 
		{
			cmd : 'refundRequest',
			reservNum : reservNum
		}).done(function(data) {
			$('.modal-body').html('<span>환불 신청이 완료되었습니다.</span><br><button class="btn" data-dismiss="modal" aria-hidden="true" onclick="location.reload()">닫기</button>');
			$('.modal-footer').attr('hidden', 'hidden');
		}).fail(function(data) {
			$('.modal-body').html('환불 요청에 실패했습니다. 다시 시도해주세요.');
		});
	});
</script>