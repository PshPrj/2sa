<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>고정 크기 레이아웃</title>
<link rel="stylesheet" href="/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/bootstrap/css/bootstrap-responsive.min.css">
<script src="/bootstrap/js/jquery-2.2.3.min.js"></script>
<script src="/bootstrap/js/jcanvas.min.js"></script>
<script src="/bootstrap/js/handle.js"></script>
<link rel="stylesheet" href="/font-awesome-4.6.3/css/font-awesome.min.css">
<head>
<style>
body {
	background-color: #ffffff;
	font-family: 'Jeju Gothic', serif;
	color: #111;
	vertical-align:middle;

}

btn-primary{
	color:#F5F3F3;
}

a:link {color: #666666;}
a:visited {color : #666666;}
a:hover {color : #666666;}
a:active li:active{color : #666666;}

table.basic { 
	width:80%; 
	line-height:21px; 
	border-top: 1px solid #6E6865; 
	border-left: 1px solid #6E6865; 
	border-collapse: collapse; 
} 
table.basic th, table.basic td { 
	color:#678197; 
	text-align:center; 
	border-right: 1px solid #6E6865; 
	border-bottom: 1px solid #6E6865; 
	padding: 3px 0; 
	text-align:center; 
} 
table.basic th { 
	background-color: #eeeeee; 
} 

body{
	font-family: 'Jeju Gothic', serif;
}

</style>

</head>
<body>

<h4 align="left">예약 내역</h4>
<p class="text-info">이사 날자가 지나기 전 예약 내역은 수정이 가능합니다</p>

<hr/>

<div class="container">
	<table class="table table-bordered">
		<tbody>
			<tr>
				<td>예약 정보</td>
			</tr>
			<tr>
				<td>회원 이름</td>
				<td>예약 날짜</td>
				<td>시간</td>
			</tr>
			<tr>
				<td>[이름 : ${member_name}/ ID : ${member_id}]</td>
				<td>${res_date }</td>
				<td>${time}시</td>
			</tr>
			<tr>
				<td colspan="2">가격</td>
				<td ><fmt:formatNumber value="${price}" type="currency" /></td>
			</tr>
			<c:if test="${staff!=null }">
			<tr>
				<td colspan="2">담당자 이름</td>
				<td>담당자 전화번호</td>

			</tr>
			<tr>
				<td colspan="2">${staff.name }</td>
				<td>${staff.tel }</td>

			</tr>
			</c:if>
			<tr>
				<td colspan="3">트럭 예약 내역</td>				
			<tr>
			<tr>
				<td>트럭 이름</td>
				<td>담당 직원 번호</td>
				<td>재배정</td>
			<tr>
			<tr>			
				<td>${truck.car_name}</td>
				<td>${truck.staff_num }</td>
				<td><a href="#" >재배정</a></td>
			<tr>
			<c:if test="${container!=null}">
				<tr>
					<td colspan="3">컨테이너 예약 내역</td>				
				<tr>
				<tr>
					<td>컨테이너 이름</td>
					<td>담당 직원 번호</td>
					<td>재배정</td>
				</tr>
				<tr>
					<td>${container.container_name}</td>
					<td>${container.staff_num }</td>
					<c:if test="${is_past==false }">
						<td><a href="#" >재배정</a></td>
					</c:if>
				</tr>
			</c:if>			
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
		</tbody>
	</table>
</div>
	

</body>
</html>