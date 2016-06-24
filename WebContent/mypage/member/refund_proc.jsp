<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:import url="../../mypage">
	<c:param name="cmd" value="payConfirm"/>
	<c:param name="reservNum" value="${param.reservNum}"/>
	<c:param name="payType" value="${param.payType}"/>
</c:import>

<c:choose>
	<c:when test="${param.payType == 'credit' }">
		<c:set var="payType" value="신용카드"></c:set>
	</c:when>
	<c:when test="${param.payType == 'transfer'}">
		<c:set var="payType" value="무통장입금"></c:set>
	</c:when>
	<c:when test="${param.payType == 'naver'}">
		<c:set var="payType" value="네이버 페이"></c:set>
	</c:when>
	<c:when test="${param.payType == 'payco'}">
		<c:set var="payType" value="Payco"></c:set>
	</c:when>
</c:choose>

결제 수단 : ${payType}<br>
<c:if test="${payType == '신용카드'}">
	결제 카드 : ${param.cardName}<br>
</c:if>

<span>환불 신청이 완료되었습니다.</span>
<button class="btn" data-dismiss="modal" aria-hidden="true" onclick="location.reload()">닫기</button>