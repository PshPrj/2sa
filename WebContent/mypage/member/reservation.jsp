<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<h4>���� ����</h4>
<table class="table table-hover">
	<thead>
		<tr>
			<th class="span4">���� ��ȣ</th>
			<th class="span4">���� ����</th>
			<th class="span4">���� ��Ȳ</th>
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
					���� ���
				</c:when>
				<c:when test="${reserv.is_confirm == 1}">
					���� ����
				</c:when>
				<c:when test="${reserv.is_confirm == 2}">
					���� �Ұ�
				</c:when>
			</c:choose>
			</td>
		</tr>
	</c:forEach>
	</tbody>
</table>
