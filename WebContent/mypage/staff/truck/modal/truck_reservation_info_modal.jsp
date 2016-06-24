<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="modal-body">
	<table class="table table-bordered">
		<tr>
			<td colspan="1">예약 번호</td>
			<td colspan="2">회원</td>

		</tr>
		<tr>
			<td>${list.pay_num }</td>
			<td> ID : ${member_id }</td>
			<td> 이름 : ${member_name }</td>
		</tr>
		<tr>
			<td>출발 주소</td>
			<td>도착주소</td>
			<td>거리</td>
		</tr>
		<tr>
			<td>${list.addr1 }</td>
			<td>${list.addr2 }</td>
			<td>${list.distance }</td>
		</tr>
		<tr>
			<td colspan="3">가격</td>
		</tr>
		<tr>
			<td colspan="3">${list.price}</td>
		</tr>
	</table>

		
</div>
	
