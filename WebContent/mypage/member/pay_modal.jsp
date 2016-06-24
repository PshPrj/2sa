<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:forEach items="${paymentList}" var="payment">
	<c:if test="${payment.reservation_num == reservNum}">
		<input type="hidden" value="${reservNum}" />
		<!-- 결제 Modal -->
			<div class="row">
				<table class="table span2">
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
						</tr>
						<tr>
							<td class="span6">담당 기사 :</td>
						</tr>
						<tr>
							<td class="span6">짐 목록 :</td>
						</tr>
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
							<td class="span6"><button class="btn btn-small payTypeBtn"
									id="credit" value="credit">신용카드</button></td>
						</tr>
						<tr id="creditHide">
							<td>
								<div class="btn-group">
									<button id="card-select" class="btn btn-small drop-down-toggle"
										data-toggle="dropdown">
										카드 선택 <span class="caret"></span>
									</button>
									<ul class="dropdown-menu">
										<li><a tabindex="-1" href="#">BC</a></li>
										<li><a tabindex="-1" href="#">KB국민</a></li>
										<li><a tabindex="-1" href="#">VISA</a></li>
										<li><a tabindex="-1" href="#">삼성</a></li>
										<li><a tabindex="-1" href="#">신한</a></li>
										<li><a tabindex="-1" href="#">우리</a></li>
										<li><a tabindex="-1" href="#">현대</a></li>
									</ul>
								</div>
							</td>
						</tr>
						<tr>
							<td class="span6"><button class="btn btn-small payTypeBtn"
									value="transfer">무통장입금</button></td>
						</tr>
						<tr>
							<td class="span6">
								<button class="btn btn-small btn-success payTypeBtn"
									value="naver">Naver Pay</button>
							</td>
						</tr>
						<tr>
							<td class="span6">
								<button class="btn btn-small btn-danger payTypeBtn"
									value="payco">Payco</button>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
	</c:if>
</c:forEach>

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

	$('#payBtn').bind("click", function() {
 		$.post('mypage/member/pay_proc.jsp', {
			payType : payType,
			cardName : cardName,
			reservNum : reservNum
		}).done(function(data) {
			$('.modal-body').html(data);
			$('.modal-footer').attr('hidden', 'hidden');
		}).fail(function(data) {
			$('.modal-body').html('결제에 실패했습니다.');
		});
	});
</script>