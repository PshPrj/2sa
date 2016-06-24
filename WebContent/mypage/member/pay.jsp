<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<h4>����/ȯ��</h4>
<ul class="nav nav-tabs" id="payTab">
	<li class="active"><a href="#unpaid">���� ���</a></li>
	<li><a href="#paid">���� �Ϸ�</a></li>
</ul>

<div class="tab-content">
	<div class="tab-pane active" id="unpaid">
		<table class="table table-hover">
			<thead>
				<tr>
					<th class="span3">���� ��ȣ</th>
					<th class="span4">���� ����</th>
					<th class="span3">�ݾ�</th>
					<th class="span2">����</th>
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
									data-target="#payModal">�����ϱ�</a></td>
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
					<th class="span2">���� ��ȣ</th>
					<th class="span3">���� ����</th>
					<th class="span3">�ݾ�</th>
					<th class="span2">���� ���</th>
					<th class="span2">ȯ�� ��û</th>
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
										�ſ�ī��
									</c:when>
										<c:when test="${payment.payment_type == 2}">
										������ �Ա�
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
												data-target="#refundModal">ȯ�� ��û</a>
										</c:when>
										<c:otherwise>
										ȯ�� ���										
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
<!-- ���� modal -->
<div id="payModal" class="modal fade" tabindex="-1" role="dialog"
	aria-labelledby="payLabel" aria-hidden="true" data-backdrop="static">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">��</button>
				<h3 id="myModalLabel">����</h3>
				<div class="modal-body"></div>
				<div class="modal-footer">
					<button class="btn" data-dismiss="modal" aria-hidden="true">�ݱ�</button>
					<button id="payBtn" class="btn btn-primary">�����ϱ�</button>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- ȯ�� modal -->
<div id="refundModal" class="modal fade" tabindex="-1" role="dialog"
	aria-labelledby="payLabel" aria-hidden="true" data-backdrop="static">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">��</button>
				<h3 id="myModalLabel">ȯ�� ��û</h3>
				<div class="modal-body"></div>
				<div class="modal-footer">
					<button class="btn" data-dismiss="modal" aria-hidden="true">�ݱ�</button>
					<button id="refundBtn" class="btn btn-primary">��û�ϱ�</button>
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