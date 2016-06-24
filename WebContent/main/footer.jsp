<%@ page contentType="text/html; charset=EUC-KR" %>

	
	<div class="row">
	<div class="span12" style="background-color:#6E6865; height:200px; font-family: 'Jeju Gothic', serif; color:#111;">
		<div class="span12" style="margin-top:20px; color:#111;" align="center">
			
			


<span class="dropdown" >
  <a href="dLabel" style="color:#F5F3F3;" data-toggle="dropdown" class="dropdown-toggle">사이트 맵</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

  <span class="dropdown-menu" role="menu" aria-labelledby="dLabel" style="background-color: #6E6865;"  >
		<div class="row span5">
			<div class="span1 " >

				<div >회사소개</div>
				<div><a href="../front?cmd=INTRODUCE">회사소개</a></div>
				<div><a href="../front?cmd=HISTORY">연혁</a></div>
				<div><a href="../front?cmd=NOTICE">공지</a></div>
			</div>
			<div class="span1 ">

				<div>이사하기</div>
				<div><a href="../front?cmd=DRAWING">도면 그리기</a></div>
				<div><a href="../front?cmd=ESTIMATE">견적 게시판</a></div>
				<div><a href="../front?cmd=RESERVATION">예약 게시판</a> </div>
			</div>
			<div class="span1">	
				<div>커뮤니티</div>
				<div><a href="../front?cmd=REVIEW">리뷰 게시판</a></div>
				<div><a href="../front?cmd=QNA">문의 게시판</a></div>
			</div>
			<div class="span1">
			
				<div>고객지원</div>
				<div><a href="#">이용 안내</a></div>
			</div>
		</div>
  </span>
</span>



			<a href="#terms" data-toggle="modal" style="color:#F5F3F3;">이용 약관</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="#personalinformation"  data-toggle="modal" style="color:#F5F3F3;">개인정보방침</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="#broken"  data-toggle="modal"style="color:#F5F3F3;">파손규정</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="#refund"  data-toggle="modal"style="color:#F5F3F3;">환불 정책</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			
		</div>
		<br/><br/><br/>
		<div class="span12" style="margin-left:-10px;">
			<p>&copy;Unique 2016 열심히 이사하겠습니다</p>
		<div class="row">
			<div class="span6">
				<div align="right"><a href="index.jsp"><img alt="" src="../img/15.png" style="color:#eee;"></a></div>
			</div>
			<div class="span6" style="align:left;">
				<div align="left"><p>&nbsp;&nbsp;&nbsp;&nbsp;서울시 중구 <br/>&nbsp;&nbsp;&nbsp;&nbsp; tel:010-1111-1111 <br/>&nbsp;&nbsp;&nbsp;&nbsp; All right reserved</p></div>
			</div>
		</div>
		</div>
	</div>
	</div>





<div id="terms" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
    <h3 id="myModalLabel">이용약관</h3>
  </div>
  <div class="modal-body">
    <p> 
		<jsp:include page="../footer/terms.jsp" flush="false"/>
	</p>
  </div>
  <div class="modal-footer">
    <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
  </div>
</div>


<div id="personalinformation" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
    <h3 id="myModalLabel">개인정보 취급 방침</h3>
  </div>
  <div class="modal-body">
    <p>
		<jsp:include page="../footer/personalinformation.jsp" flush="false"/>
	</p>
  </div>
  <div class="modal-footer">
    <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
  </div>
</div>

<div id="broken" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
    <h3 id="myModalLabel">파손규정</h3>
  </div>
  <div class="modal-body">    
  	<p>
		<jsp:include page="../footer/broken.jsp" flush="false"/>
	</p>
  </div>
  <div class="modal-footer">
    <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
  </div>
</div>

<div id="refund" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
    <h3 id="myModalLabel">환불 정책</h3>
  </div>
  <div class="modal-body">
		<jsp:include page="../footer/refund.jsp" flush="false"/>
  </div>
  <div class="modal-footer">
    <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
  </div>
</div>




