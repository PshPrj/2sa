<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="modal-body">
	<table class="table table-striped table-bordered">

			<tr>
				<td>회원 ID</td>
				<td>회원 이름</td>
				<td>시작 날짜</td>
				<td>마지막 날짜</td>
			</tr>
			
		<c:if test="${list_size!=0}">
			<c:forEach items="${list}" var="list">
				<tr>
					<td>${list.member_id }</td>
					<td>${list.member_name }</td>
					<td>${list.date }</td>
					<td>${list.last_date }</td>
				</tr>
			</c:forEach>	
		</c:if>	
	</table>
</div>

