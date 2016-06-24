<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<h4>예약 관리</h4>
<table class="table table-hover">
	<thead>
		<tr>
			<th class="span4">예약 번호</th>
			<th class="span4">예약 내용</th>
			<th class="span4">예약 현황</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach items="${reservationList}" var="reserv">
		<tr>
			<td>${reserv.reservation_num}</td>
			<td>${reserv.reservation_date}</td>
			<td>
			<c:choose>
				<c:when test="${reserv.is_confirm == 0}">
					예약 대기
				</c:when>
				<c:when test="${reserv.is_confirm == 1}">
					예약 승인
				</c:when>
				<c:when test="${reserv.is_confirm == 2}">
					예약 불가
				</c:when>
			</c:choose>
			</td>
		</tr>
	</c:forEach>
	</tbody>
</table>
