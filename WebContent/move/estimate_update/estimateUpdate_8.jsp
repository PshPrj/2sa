<!-- 
 	담당 : 정효진
	최종 수정 일자 : 06/19
	견적 수정 결과 페이지
 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR"%>

	<div class="span5" id="ver" style="background-color:#E5B1C5; height:20px; width:100px; margin-top:0px; align:left;">견적 수정</div>
	<div class="span3" aling=right style="background-color:#79B3DC; height:20px; width:100px; margin-top:0px;">예상 견적</div>

<br/><br/><br/>

<center>고객님의 견적 사항이 수정되었습니다.</center>
<span>${member_id} 고객님께서 문의하신 이사의 견적은</span><br/>
<center>${price}원 입니다.</center>
<center>(10% 부가세 포함 전 가격 입니다.)</center>
<center>총 이동 거리는  ${distance} km 입니다.</center>
<br/><br/>
<center>예약 페이지에서 예약을 진행해 주세요!</center>

<br/><br/>	
<a href="../front?cmd=ESTIMATE" role="button" class="btn" style="margin-right:0px;">확인</a>
			