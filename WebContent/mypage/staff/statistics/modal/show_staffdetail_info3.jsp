<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="modal-body">
	<p align="left">현재까지 직원의 정보 입니다.(이삿짐부)</p>	
	<hr>
	<table class="table table-bordered">
		
			<c:if test="${res_size!=0 }">
				<tr>
					<td>회원 ID</td>
					<td>회원 이름</td>
					<td>날짜</td>
					<td>출발 주소</td>
					<td>도착 주소</td>
					<td>거리</td>
				</tr>
				<c:forEach items="${res }" var="res">
					<tr>
						<td>${res.member_id }</td>
						<td>${res.member_name }</td>
						<td>${res.date }</td>
						<td>${res.addr1 }</td>
						<td>${res.addr2 }</td>
						<td>${res.distant }</td>
					</tr>
				</c:forEach>
			</c:if>
			<c:if test="${res_size==0 }">
				<tr>
					<td>데이터가 없습니다.</td>
				</tr>
			</c:if>
		
	</table>
</div>
