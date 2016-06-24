<!-- 
 	담당 : 1조
	최종 수정 일자 : 05/25
	메인 페이지
 -->		
 <%@ page contentType="text/html; charset=utf-8" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <style>
 img {
	width: 90px;
	height: 90px;
}
 </style>
		<div class="row-fluid">
			<!-- 메인 바로 가기 화면 시작 -->
			<c:if test="${!empty member_num}">
				<div class="row-fluid">
					<div class="span3 pic" style="height:300px; border-radius: 4px">
						<h4 style="margin-top:10px;">이사준비</h4>
						<div class="row" align="center">
							<a href="../front?cmd=DRAWING" title="도면 그리기" rel="tooltip"><img alt="" src="../img/1.png"></a>
							<a href="../front?cmd=CALENDAR" data-toggle="modal" title="일정 확인" data-target="#schedule"rel="tooltip"><img alt="" src="../img/2.png"></a>
						</div>
						<div class="row">
							<a href="../front?cmd=ESTIMATE" title="짐 등록/수정" rel="tooltip"><img alt="" src="../img/3.png"></a>
							<a href="../front?cmd=RESERVATION" title="보관/배치 신청" rel="tooltip"><img alt="" src="../img/4.png"></a>
						</div>
					</div>
					<div class="span3 pic" style="height:300px; border-radius: 4px">
						<h4>예약</h4>
						<div class="row" style="margin-left:13px;">
							<a href="../mypage?cmd=stuffList" data-toggle="modal" style="color:#F5F3F3;" title="견적" rel="tooltip"><img alt="" src="../img/5.png"></a>
							<a href="../mypage?cmd=pay" title="결제" rel="tooltip"><img alt="" src="../img/6.png"></a>
						</div>
						<div class="row" style="margin-left:13px;">
							<a href="../mypage?cmd=assignment" title="트럭 배정" rel="tooltip"><img alt="" src="../img/7.png"></a>
							<a href="../mypage?cmd=assignment" title="컨테이너 배정" rel="tooltip"><img alt="" src="../img/8.png"></a>
						</div>
					</div>
					<div class="span3 pic"  style="height:300px; border-radius: 4px">
					<h4>이사진행</h4>
						<div class="row" style="margin-left:13px;">
							<a href="../mypage?cmd=progress" title="이사 진행" rel="tooltip"><img alt="" src="../img/9.png"></a>
						</div>
						<div class="row" style="margin-left:13px;">
							<a href="../mypage?cmd=floorplan" title="도면 확인" rel="tooltip"><img alt="" src="../img/10.png"></a>
						</div>
					</div>
					<div class="span3 pic" style="height:300px; border-radius: 4px">
					<h4>이사완료</h4>
						<div class="row" style="margin-left:15px;">
							<a href="../front?cmd=REVIEW" title="리뷰" rel="tooltip"><img alt="" src="../img/11.png"></a>
						</div>
		
					</div>
				</div>
			</c:if>
			<c:if test="${!empty staff_num}">
				<div class="row-fluid">
					<div class="span3 pic" style="height:300px; border-radius: 4px">
						<h4 style="margin-top:10px;">이사준비</h4>
						<div class="row" align="center">
							<a href="../front?cmd=DRAWING" title="도면 그리기" rel="tooltip"><img alt="" src="../img/1.png"></a>
							<a href="../front?cmd=CALENDAR" data-toggle="modal" title="일정 확인" data-target="#schedule"rel="tooltip"><img alt="" src="../img/2.png"></a>
						</div>
						<div class="row">
							<a href="../front?cmd=ESTIMATE" title="짐 등록/수정" rel="tooltip"><img alt="" src="../img/3.png"></a>
							<a href="../front?cmd=RESERVATION" title="보관/배치 신청" rel="tooltip"><img alt="" src="../img/4.png"></a>
						</div>
					</div>
						<div class="span3 pic" style="height:300px; border-radius: 4px">
						<h4>예약</h4>
						<div class="row" style="margin-left:13px;">
							<a href="#alert" data-toggle="modal" data-toggle="modal" style="color:#F5F3F3;" title="견적" rel="tooltip"><img alt="" src="../img/5.png"></a>
							<a href="#alert" data-toggle="modal" title="결제" rel="tooltip"><img alt="" src="../img/6.png"></a>
						</div>
						<div class="row" style="margin-left:13px;">
							<a href="#alert" data-toggle="modal" title="트럭 배정" rel="tooltip"><img alt="" src="../img/7.png"></a>
							<a href="#alert" data-toggle="modal" title="컨테이너 배정" rel="tooltip"><img alt="" src="../img/8.png"></a>
						</div>
					</div>
					<div class="span3 pic"  style="height:300px; border-radius: 4px">
					<h4>이사진행</h4>
						<div class="row" style="margin-left:13px;">
							<a href="#alert" data-toggle="modal" title="이사 진행" rel="tooltip"><img alt="" src="../img/9.png"></a>
						</div>
						<div class="row" style="margin-left:13px;">
							<a href="#alert" data-toggle="modal" title="도면 확인" rel="tooltip"><img alt="" src="../img/10.png"></a>
						</div>
					</div>
					<div class="span3 pic" style="height:300px; border-radius: 4px">
					<h4>이사완료</h4>
						<div class="row" style="margin-left:15px;">
							<a href="../front?cmd=REVIEW" title="리뷰" rel="tooltip"><img alt="" src="../img/11.png"></a>
						</div>
		
					</div>
				</div>
			</c:if>
			<c:if test="${empty staff_num and empty member_num}">
				<div class="row-fluid">
					<div class="span3 pic" style="height:300px; border-radius: 4px">
						<h4 style="margin-top:10px;">이사준비</h4>
						<div class="row" align="center">
							<a href="#alert" data-toggle="modal" title="도면 그리기" rel="tooltip"><img alt="" src="../img/1.png"></a>
							<a href="#alert" data-toggle="modal" title="일정 확인" rel="tooltip"><img alt="" src="../img/2.png"></a>
						</div>
						<div class="row">
							<a href="#alert" data-toggle="modal" title="짐 등록/수정" rel="tooltip"><img alt="" src="../img/3.png"></a>
							<a href="#alert" data-toggle="modal" title="보관/배치 신청" rel="tooltip"><img alt="" src="../img/4.png"></a>
						</div>
					</div>
					<div class="span3 pic" style="height:300px; border-radius: 4px">
						<h4>예약</h4>
						<div class="row" style="margin-left:13px;">
							<a href="#alert" data-toggle="modal" data-toggle="modal" style="color:#F5F3F3;" title="견적" rel="tooltip"><img alt="" src="../img/5.png"></a>
							<a href="#alert" data-toggle="modal" title="결제" rel="tooltip"><img alt="" src="../img/6.png"></a>
						</div>
						<div class="row" style="margin-left:13px;">
							<a href="#alert" data-toggle="modal" title="트럭 배정" rel="tooltip"><img alt="" src="../img/7.png"></a>
							<a href="#alert" data-toggle="modal" title="컨테이너 배정" rel="tooltip"><img alt="" src="../img/8.png"></a>
						</div>
					</div>
					<div class="span3 pic"  style="height:300px; border-radius: 4px">
					<h4>이사진행</h4>
						<div class="row" style="margin-left:13px;">
							<a href="#alert" data-toggle="modal" title="이사 진행" rel="tooltip"><img alt="" src="../img/9.png"></a>
						</div>
						<div class="row" style="margin-left:13px;">
							<a href="#alert" data-toggle="modal" title="도면 확인" rel="tooltip"><img alt="" src="../img/10.png"></a>
						</div>
					</div>
					<div class="span3 pic" style="height:300px; border-radius: 4px">
					<h4>이사완료</h4>
						<div class="row" style="margin-left:15px;">
							<a href="../front?cmd=REVIEW" title="리뷰" rel="tooltip"><img alt="" src="../img/11.png"></a>
						</div>
		
					</div>
				</div>
			</c:if>
			
			<div id="alert" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			  <div class="modal-header">
			    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			    <h3 id="myModalLabel">로그인 알림</h3>
			  </div>
			  <div class="modal-body">
			    <p>
					로그인한 회원만 이용 가능한 서비스 입니다.
				</p>
			  </div>
			  <div class="modal-footer">
			    <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
			  </div>
			</div>
			
			<div id="schedule" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			  <div class="modal-header">
			    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			    <h3 id="myModalLabel">일정 확인</h3>
			  </div>
			  <div class="modal-body">
			    <p>
					
				</p>
			  </div>
			  <div class="modal-footer">
			    <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
			  </div>
			</div>
						
			
		<!-- 메인 바로 가기 화면 끝 -->
		
		<div class="row-fluid">
			<!-- carousel 서비스 소개  -->
			<div class="span5">
				<fieldset border="1">
				<legend>서비스 소개</legend>
				<div id="theCarousel" class="carousel slide">
					<ol class="carousel-indicators">
						<li data-target="#theCarousel" data-slide-to="0" class="active"></li>
						<li data-target="#theCarousel" data-slide-to="1"></li>
						<li data-target="#theCarousel" data-slide-to="2"></li>
					</ol>
					<div class="carousel-inner">
						<div class="item active">
							<img src="../img/1.jpg" style="height:300px; width:500px">
								<div class="carousel-caption">
									<h4>이사</h4>
								</div>
						</div>
						<div class="item">
							<img src="../img/2.jpg" style="height:300px; width:500px">
							<div class="carousel-caption">
								<h4>이사2</h4>
							</div>
						</div>
						<div class="item">
							<img src="../img/3.jpg" style="height:300px; width:500px">
							<div class="carousel-caption">
								<h4>이사3</h4>
							</div>
						</div>
					</div>
					<a href="#theCarousel" class="carousel-control left" data-slide="prev">&lsaquo;</a>
					<a href="#theCarousel" class="carousel-control right" data-slide="next">&rsaquo;</a>
				</div>
				</fieldset>
			</div>
			<!-- 서비스 소개 끝 -->
			
			
			
			
			
			<!-- thumbnail 이용 방법 -->
			<div class="span7">
			<fieldset border="1">
			<legend class="">이 용 방 법</legend>
				<ul class="thumbnails">
					<li class="span3" align="center">
						<div class="thumbnail">
							<i class="fa fa-edit fa-5x" style="align:center;"></i>
							<div class="caption" align="center">
								<h3 class="">이름</h3>
								<p class="">내용</p>
								<p align="center"><button class="btn btn-primary " style="margin-bottom:0px; font-family: 'Jeju Gothic', serif;">자세히 보기</button></p>
							</div>
						</div>
					</li>
					<li class="span3" align="center">
						<div class="thumbnail">
							<i class="fa fa-edit fa-5x"></i>
							<div class="caption">
								<h3 class="">이름</h3>
								<p class="">내용</p>
								<p align="center"><button class="btn btn-primary " style="margin-bottom:0px; font-family: 'Jeju Gothic', serif;">자세히 보기</button></p>
							</div>
						</div>
					</li>
					<li class="span3" align="center">
						<div class="thumbnail">
							<i class="fa fa-edit fa-5x"></i>
							<div class="caption">
								<h3 class="">이름</h3>
								<p class="">내용</p>
								<p align="center"><button class="btn btn-primary " style="margin-bottom:0px; font-family: 'Jeju Gothic', serif;">자세히 보기</button></p>
							</div>
						</div>
					</li>
					<li class="span2">
						<button class="btn btn-primary " style="margin-bottom:0px; font-family: 'Jeju Gothic', serif;">더 보기</button>
					</li>
				</ul>
			</fieldset>
		</div>
		<!-- 이용방법 끝 -->
	</div>
</div>
	
		