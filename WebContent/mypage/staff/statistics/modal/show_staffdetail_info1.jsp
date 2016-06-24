<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="modal-body">
	<p align="left">현재까지 직원의 정보 입니다.(트럭관리부)</p>	
	<hr>
	<table class="table table-bordered">
			<c:if test="${truck_size!=0 }">
					<tr>
					<td>번호판</td>
					<td>차종</td>
					<td>용량</td>
					<td>등록 일자</td>
				</tr>
				<c:forEach items="${truck }" var="list">
					<tr>
						<td>${list.car_name}</td>
						<td>${list.car_type}</td>
						<td>${list.capacity}</td>
						<td>${list.date}</td>
					</tr>
				</c:forEach>
			</c:if>
			<c:if test="${truck_size==0 }">
				<tr>
					<td>데이터가 없습니다.</td>
				</tr>
			</c:if>
	</table>	
</div>
