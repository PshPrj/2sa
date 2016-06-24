<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="modal-body">
	<p align="left">[<span class="text-info">${id}/${name}</span>]님의 이용 정보입니다.</p>
	<p align="left">총 예약 건수 : ${list_size } 건</p>
	<hr>	
	<c:if test="${list_size!=0}">
		          	<table class="table table-bordered">
		          	<c:forEach items="${list}" var="list">
		          		<tr>
		          			<td>예약 번호</td>
		          			<td>요청 날짜</td>
		          			<td>요청 시간</td>
		          			<td>담당 직원</td>
		          		</tr>        
		          		<tr>
		          			<td>${list.rs_num }</td>
		          			<td>${list.date }</td>
		          			<td>${list.time }</td>
		          			<td>${list.staff_num }</td>
		          		</tr>
		          		<tr>
		          			<td>출발 주소</td>
		          			<td>도착 주소</td>
		          			<td>거리</td>
		          			<td>예약 가격</td>
		          		</tr>
		          		<tr>
		          			<td>${list.addr1 }</td>
		          			<td>${list.addr2 }</td>
		          			<td>${list.distance }</td>
		          			<td>${list.price }</td>
		          		</tr>
		          		<tr>
		          			<td>결제 승인 여부</td>
		          			<td>환불 여부</td>
		          			<td>결제 여부</td>
		          			<td>결제일</td>
		          		</tr>
		          		<tr>
		          		<c:if test="${list.is_confirm==0 }">	
		          			<td>결제 승인 대기 중</td>
		          			<td>없음</td>
		          			<td>없음</td>
		          			<td>없음</td>
		          		</c:if>
		          		<c:if test="${list.is_confirm==1 }">	
		          			<td>결제 승인 완료</td>
		          			<c:if test="${list.is_refund==0 }">		
		          			<td>환불 안함</td>
			          		</c:if>	
			          		<c:if test="${list.is_refund==1 }">		
			          			<td>환불 처리 완료</td>
			          		</c:if>
			          		<c:if test="${list.pay_date!=null }">
			          			<td>결제 완료</td>
			          			<td>${list.pay_date }</td>
			          		</c:if>	
			          		<c:if test="${list.pay_date!=null }">
			          			<td>결제 전</td>
			          			<td>없음</td>
			          		</c:if>	
		          		</c:if>
		          		
		          		</tr>
		          		<tr>
		          			<td colspan="4">예약 내역</td>
		          		</tr>
		          		<tr>
		          			<td colspan="4">${list.estimate_content }</td>
		          		</tr>	
		          		</c:forEach>
		          	</table>
	          	</c:if>
	          	<c:if test="${list_size==0 }">
	          		데이터가 없습니다.
	          	</c:if>
</div>
