<!-- 
 	담당 : 정효진
	최종 수정 일자 : 06/15
	예약 마지막 페이지
 -->

<%@ page language="java" contentType="text/html; charset=EUC-KR"%>

	<div class="span5" id="ver" style="background-color:#E5B1C5; height:20px; width:100px; margin-top:0px; align:left;">예약</div>
	<div class="span3" aling=right style="background-color:#79B3DC; height:20px; width:100px; margin-top:0px;">예상 완료</div>

<br/><br/><br/>
<span>${member_id } 고객님께서 선택하신 날짜, 견적으로 예약 되셨습니다.</span><br/>
최종 가격은 ${price} 원 이며<br/>
<center>(10% 부가세 포함)</center>
이사 날짜는 ${reservation_date} 입니다.
<br/><br/>
<center>최종 확인 전화를 통해 예약을 확정하오니
전화를 기다려 주세요!
</center>


<br/><br/>	
<a href="../front?cmd=RESERVATION" role="button" class="btn" style="margin-right:0px;">확인</a>
			