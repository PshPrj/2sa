<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="modal-body">
	<p align="left">현재까지 직원의 정보 입니다.(컨테이너 관리부)</p>	
	<hr>
	<table class="table table-bordered">
			<c:if test="${container_size!=0 }">
				<tr>
					<td>컨테이너 이름</td>
					<td>용량</td>
					<td>등록 일자</td>
				</tr>
				<c:forEach items="${container}" var="container">
					<tr>
						<td>${container.container_name }</td>
						<td>${container.container_capacity }</td>
						<td>${container.regi_date }</td>
					</tr>
				</c:forEach>
			</c:if>
			<c:if test="${container_size==0 }">
				<tr>
					<td>데이터가 없습니다.</td>
				</tr>
			</c:if>
	
	</table>
</div>
