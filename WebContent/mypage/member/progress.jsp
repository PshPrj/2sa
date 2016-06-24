<%@page import="java.util.Date"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:formatDate value="<%=new Date()%>" var="date" type="date"/>
<h4>�̻� ��Ȳ</h4>
<h5>
	<fmt:formatDate value="<%=new Date()%>" var="now" type="both"/>
	${now} ����
</h5>
<div class="progress">
	<div class="bar"></div>
</div>
<table class="table prog-table">
	<tbody>
		<tr>
			<th class="span2">�̻� ����</th>
			<th class="span2">Ʈ�� ���</th>
			<th class="span2">����</th>
			<th class="span4">�� �ű��</th>
			<th class="span2">�Ϸ�</th>
		</tr>
		<c:forEach items="${progressList}" var="prog">
			<fmt:parseDate value="${prog.movement_start_time}" pattern="yyyy-MM-dd HH:mm:ss" var="temp"/>
			<fmt:formatDate value="${temp}" type="date" var="d_day"/>
			<c:choose>
				<c:when test="${prog != null}">
					 <c:if test="${d_day == date}">
						<tr>
							<td id="start"><fmt:parseDate value="${prog.movement_start_time}" pattern="yyyy-MM-dd HH:mm:ss" var="start" /><fmt:formatDate value="${start}" type="time" /></td>
							
							<td id="leave"><fmt:parseDate value="${prog.truck_leave_time}" pattern="yyyy-MM-dd HH:mm:ss" var="leave" /><fmt:formatDate value="${leave}" type="time" /></td>
							
							<td id="depart"><fmt:parseDate value="${prog.depart_time}" pattern="yyyy-MM-dd HH:mm:ss" var="leave" /><fmt:formatDate value="${leave}" type="time" /></td>
							
							<td></td>
							
							<td id="done"><fmt:parseDate value="${prog.complete_time}" pattern="yyyy-MM-dd HH:mm:ss" var="leave" /><fmt:formatDate value="${leave}" type="time" /></td>
						</tr>
					 </c:if>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="5" id="no-prog">���� ���� �̻簡 �����ϴ�.</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	</tbody>
</table>

<script>
	$(function() {
		if ($('#done').text() != '') {
			$('.bar').css('width', '100%');
		} else if ($('#depart').text() != '') {
			$('.bar').css('width', '40%');
		} else if ($('#leave').text() != '') {
			$('.bar').css('width', '25%');
		} else if ($('#start').text() != '') {
			$('.bar').css('width', '5%');
		} else {
			$('.bar').css('width', '0%');
		}
	})
</script>

<style>
.prog-table td {
	text-align: center;
}
.prog-table th {
	text-align: center;
}

#no-prog {
	text-align: center;
}
</style>