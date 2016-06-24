<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<h4>결제/환불</h4>
<ul class="nav nav-tabs" id="payTab">
	<li class="active"><a href="#unpaid">결제 대기</a></li>
	<li><a href="#paid">결제 완료</a></li>
</ul>

<div class="tab-content">
	<div class="tab-pane active" id="unpaid">
		<table class="table table-hover">
			<thead>
				<tr>
					<th class="span3">예약 번호</th>
					<th class="span4">예약 일자</th>
					<th class="span3">금액</th>
					<th class="span2">결제</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${paymentList != null}">
					<c:forEach items="${paymentList}" var="payment">
						<c:if test="${payment.payment_date == null}">
							<tr>
								<td>${payment.reservation_num}</td>
								<td>${payment.reservation_date}</td>
								<td><fmt:formatNumber value="${payment.price}"
										type="currency" /></td>
								<td><a
									href="mypage?cmd=pay_modal&reservNum=${payment.reservation_num}"
									role="button" class="btn modalbtn" data-toggle="modal"
									data-target="#payModal">결제하기</a></td>
							</tr>
						</c:if>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
	</div>
	<div class="tab-pane" id="paid">
		<table class="table table-hover">
			<thead>
				<tr>
					<th class="span2">예약 번호</th>
					<th class="span3">예약 일자</th>
					<th class="span3">금액</th>
					<th class="span2">결제 방법</th>
					<th class="span2">환불 신청</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${paymentList != null}">
					<c:forEach items="${paymentList}" var="payment">
						<c:if test="${payment.payment_date != null}">
							<tr>
								<td>${payment.reservation_num}</td>
								<td>${payment.reservation_date}</td>
								<td><fmt:formatNumber value="${payment.price}"
										type="currency" /></td>
								<td><c:choose>
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
									</c:choose></td>
								<td><c:choose>
										<c:when test="${payment.is_refund == 0}">
											<a
												href="mypage?cmd=refund_modal&reservNum=${payment.reservation_num}"
												role="button" class="btn" data-toggle="modal"
												data-target="#refundModal">환불 신청</a>
										</c:when>
										<c:otherwise>
										환불 대기										
									</c:otherwise>
									</c:choose></td>
							</tr>
						</c:if>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
	</div>
</div>
<!-- 결제 modal -->
<div id="payModal" class="modal fade" tabindex="-1" role="dialog"
	aria-labelledby="payLabel" aria-hidden="true" data-backdrop="static">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">×</button>
				<h3 id="myModalLabel">결제</h3>
				<div class="modal-body"></div>
				<div class="modal-footer">
					<button class="btn" data-dismiss="modal" aria-hidden="true">닫기</button>
					<button id="payBtn" class="btn btn-primary">결제하기</button>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 환불 modal -->
<div id="refundModal" class="modal fade" tabindex="-1" role="dialog"
	aria-labelledby="payLabel" aria-hidden="true" data-backdrop="static">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">×</button>
				<h3 id="myModalLabel">환불 신청</h3>
				<div class="modal-body"></div>
				<div class="modal-footer">
					<button class="btn" data-dismiss="modal" aria-hidden="true">닫기</button>
					<button id="refundBtn" class="btn btn-primary">신청하기</button>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
	/* Tab */
	$(function() {
		var httpRequest = null;
		$('#payTab a:first').tab('show');
	});

	$('#payTab a').click(function(e) {
		e.preventDefault();
		$(this).tab('show');
	});
</script>
<style>
.modal-body button {
	width: 96px;
}

.modal .table td {
	border: none;
}
</style>