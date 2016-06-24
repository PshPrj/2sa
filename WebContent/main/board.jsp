<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- 
 	담당 : 정효진
	최종 수정 일자 : 6/01
	nav-bar 설정 페이지
 -->
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<nav class="navbar">
<div class="row-fluid">
<c:if test="${!empty staff_num or !empty member_num}">
<div class="navbar" style="margin-top:5px; border-radius: 4px">
	<a class="btn btn-navbar" data-toggle="collapse"
			data-target=".nav-collapse">
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
	</a>
		<ul class="dropdown" align="left" style="color:#111;">
			<div class="nav-collapse" style=" vertical-align:'center';">
			<div class="nav">
				<li data-toggle="dropdown"><a href="#">회사소개</a></li>
				<ul class="dropdown-menu" >
					<li><a href="../front?cmd=INTRODUCE">회사소개</a><li> <br/>
					<li><a href="../front?cmd=HISTORY">연혁</a><li> <br/>
					<li><a href="../front?cmd=NOTICE">공지</a><li> <br/>
				</ul>
			</div>
			<div class="nav">
				<li data-toggle="dropdown"><a href="#">이사하기</a></li>
				<ul class="dropdown-menu">
					<li><a href="../front?cmd=DRAWING">도면 그리기</a><li> <br/>
					<li><a href="../front?cmd=ESTIMATE">견적 게시판</a></li> <br/>
					<li><a href="../front?cmd=RESERVATION">예약 게시판</a> </li> <br/>
				</ul>
			</div>
			<div class="nav">
				<li data-toggle="dropdown"><a href="#">커뮤니티</a></li>
				<ul class="dropdown-menu">
					<li><a href="../front?cmd=REVIEW">리뷰 게시판</a></li> <br/>
					<li><a href="../front?cmd=QNA">문의 게시판</a></li> <br/>
				</ul>
			</div>
			<div class="nav">
				<li data-toggle="dropdown"><a href="#">고객지원</a></li>
				<ul class="dropdown-menu">
					<li><a href="../front?cmd=GUIDANCE">이용 안내</a></li> <br/>

				</ul>		
			</div>
			</div>
		</ul>
</div>
</c:if>

	<c:if test="${empty staff_num and empty member_num}">
			<div class="navbar" style="margin-top:5px; border-radius: 4px">
			<a class="btn btn-navbar" data-toggle="collapse"
					data-target=".nav-collapse">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
			</a>
				<ul class="dropdown" align="left" style="color:#111;">
					<div class="nav-collapse" style=" vertical-align:'center';">
					<div class="nav">
						<li data-toggle="dropdown"><a href="#">회사소개</a></li>
						<ul class="dropdown-menu" >
							<li><a href="../front?cmd=INTRODUCE">회사소개</a><li> <br/>
							<li><a href="../front?cmd=HISTORY">연혁</a><li> <br/>
							<li><a href="../front?cmd=NOTICE">공지</a><li> <br/>
						</ul>
					</div>
					<div class="nav">
						<li data-toggle="dropdown"><a href="#">이사하기</a></li>
						<ul class="dropdown-menu">
							<li><a href="#alert" data-toggle="modal">도면 그리기</a><li> <br/>
							<li><a href="#alert" data-toggle="modal">견적 게시판</a></li> <br/>
							<li><a href="#alert" data-toggle="modal">예약 게시판</a> </li> <br/>
						</ul>
					</div>
					<div class="nav">
						<li data-toggle="dropdown"><a href="#">커뮤니티</a></li>
						<ul class="dropdown-menu">
							<li><a href="../front?cmd=REVIEW">리뷰 게시판</a></li> <br/>
							<li><a href="../front?cmd=QNA">문의 게시판</a></li> <br/>
						</ul>
					</div>
					<div class="nav">
						<li data-toggle="dropdown"><a href="#">고객지원</a></li>
						<ul class="dropdown-menu">
							<li><a href="#">이용 안내</a></li> <br/>
		
						</ul>		
					</div>
					</div>
				</ul>
			</div>
	</c:if>
</div>
</nav>

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