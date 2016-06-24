<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<div class="modal-body">
	
	<p align="left">회원 기본 정보</p>
			<table class="table table-bordered">
				<thead>
					<tr>
						<td>회원 번호</td>
						<td>회원</td>
						<td>가입 날짜</td>
						<td>회원 전화 번호</td>		
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>${dto.member_num}</td>
						<td>[id : ${dto.member_id }/이름 : ${dto.member_name }]</td>
						<td>${dto.date }</td>
						<td>${dto.tel }</td>				
					</tr>					
					<tr>						
						<td>견적 횟수</td>
						<td>예약 회수</td>
						<td>결제 횟수</td>
						<td>환불횟수</td>
					</tr>
					<tr>							
						<td>${dto.es_cnt }</td>
						<td>${dto.res_cnt }</td>
						<td>${dto.pay_cnt }</td>
						<td>${dto.refund_cnt }</td>						
					</tr>	
				</tbody>
				<tfoot>	</tfoot>
			</table>

<hr/>
<p  id="reservation_title" align="left">회원 예약 정보<i class="icon-arrow-down"></i></p>
<div id="reservation_content">


<p class="text-info" align="left">el: 엘레베이터 여부 ,pk: 주차장 여부</p>

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
</div>
	       
<script>
	$(document).ready(function() {
		$("#reservation_content").hide();
		$("#reservation_title").click(function() {
			$("#reservation_content").slideToggle("slow");
		});
	});
</script>   
