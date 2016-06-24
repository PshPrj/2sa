<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- 
 	��� : ��ȿ��
	���� ���� ���� : 6/01
	nav-bar ���� ������
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
				<li data-toggle="dropdown"><a href="#">ȸ��Ұ�</a></li>
				<ul class="dropdown-menu" >
					<li><a href="../front?cmd=INTRODUCE">ȸ��Ұ�</a><li> <br/>
					<li><a href="../front?cmd=HISTORY">����</a><li> <br/>
					<li><a href="../front?cmd=NOTICE">����</a><li> <br/>
				</ul>
			</div>
			<div class="nav">
				<li data-toggle="dropdown"><a href="#">�̻��ϱ�</a></li>
				<ul class="dropdown-menu">
					<li><a href="../front?cmd=DRAWING">���� �׸���</a><li> <br/>
					<li><a href="../front?cmd=ESTIMATE">���� �Խ���</a></li> <br/>
					<li><a href="../front?cmd=RESERVATION">���� �Խ���</a> </li> <br/>
				</ul>
			</div>
			<div class="nav">
				<li data-toggle="dropdown"><a href="#">Ŀ�´�Ƽ</a></li>
				<ul class="dropdown-menu">
					<li><a href="../front?cmd=REVIEW">���� �Խ���</a></li> <br/>
					<li><a href="../front?cmd=QNA">���� �Խ���</a></li> <br/>
				</ul>
			</div>
			<div class="nav">
				<li data-toggle="dropdown"><a href="#">������</a></li>
				<ul class="dropdown-menu">
					<li><a href="../front?cmd=GUIDANCE">�̿� �ȳ�</a></li> <br/>

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
						<li data-toggle="dropdown"><a href="#">ȸ��Ұ�</a></li>
						<ul class="dropdown-menu" >
							<li><a href="../front?cmd=INTRODUCE">ȸ��Ұ�</a><li> <br/>
							<li><a href="../front?cmd=HISTORY">����</a><li> <br/>
							<li><a href="../front?cmd=NOTICE">����</a><li> <br/>
						</ul>
					</div>
					<div class="nav">
						<li data-toggle="dropdown"><a href="#">�̻��ϱ�</a></li>
						<ul class="dropdown-menu">
							<li><a href="#alert" data-toggle="modal">���� �׸���</a><li> <br/>
							<li><a href="#alert" data-toggle="modal">���� �Խ���</a></li> <br/>
							<li><a href="#alert" data-toggle="modal">���� �Խ���</a> </li> <br/>
						</ul>
					</div>
					<div class="nav">
						<li data-toggle="dropdown"><a href="#">Ŀ�´�Ƽ</a></li>
						<ul class="dropdown-menu">
							<li><a href="../front?cmd=REVIEW">���� �Խ���</a></li> <br/>
							<li><a href="../front?cmd=QNA">���� �Խ���</a></li> <br/>
						</ul>
					</div>
					<div class="nav">
						<li data-toggle="dropdown"><a href="#">������</a></li>
						<ul class="dropdown-menu">
							<li><a href="#">�̿� �ȳ�</a></li> <br/>
		
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
	    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">��</button>
	    <h3 id="myModalLabel">�α��� �˸�</h3>
	  </div>
	  <div class="modal-body">
	    <p>
			�α����� ȸ���� �̿� ������ ���� �Դϴ�.
		</p>
	  </div>
	  <div class="modal-footer">
	    <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
	  </div>
</div>