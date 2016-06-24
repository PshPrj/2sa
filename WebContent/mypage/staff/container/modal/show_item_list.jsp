<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="modal-body">
	<table class="table table-striped table-bordered">
		<tr>
			<td>출발 주소</td>
			<td>엘레베이터 여부</td>
			<td>주차장 여부</td>
		</tr>
		<tr>
			<td>${from.addr }</td>
			<td>${from.el }</td>
			<td>${from.pk }</td>
		</tr>
		<tr>
			<td>도착 주소</td>
			<td>엘레베이터 여부</td>
			<td>주차장 여부</td>
		</tr>
		<tr>
			<td>${to.addr }</td>
			<td>${to.el }</td>
			<td>${to.pk }</td>
		</tr>
		<tr>
			<td colspan="3">아이템 목록</td>
		<tr>
			<c:if test="${item_size==0 }">
				<tr>
					<td colspan="3">데이터가 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${item_size!=0}">
				<c:forEach items="${item_list}" var="list">
					<tr>
						<td colspan="3">${list.item}</td>
					</tr>
				</c:forEach>
			</c:if>
		<tr>
			<td colspan="3">버리는 물건</td>
		</tr>
		<tr>
			<td colspan="3">${waste.item}</td>
		</tr>
	</table>
</div>
