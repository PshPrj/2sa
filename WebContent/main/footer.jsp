<%@ page contentType="text/html; charset=EUC-KR" %>

	
	<div class="row">
	<div class="span12" style="background-color:#6E6865; height:200px; font-family: 'Jeju Gothic', serif; color:#111;">
		<div class="span12" style="margin-top:20px; color:#111;" align="center">
			
			


<span class="dropdown" >
  <a href="dLabel" style="color:#F5F3F3;" data-toggle="dropdown" class="dropdown-toggle">����Ʈ ��</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

  <span class="dropdown-menu" role="menu" aria-labelledby="dLabel" style="background-color: #6E6865;"  >
		<div class="row span5">
			<div class="span1 " >

				<div >ȸ��Ұ�</div>
				<div><a href="../front?cmd=INTRODUCE">ȸ��Ұ�</a></div>
				<div><a href="../front?cmd=HISTORY">����</a></div>
				<div><a href="../front?cmd=NOTICE">����</a></div>
			</div>
			<div class="span1 ">

				<div>�̻��ϱ�</div>
				<div><a href="../front?cmd=DRAWING">���� �׸���</a></div>
				<div><a href="../front?cmd=ESTIMATE">���� �Խ���</a></div>
				<div><a href="../front?cmd=RESERVATION">���� �Խ���</a> </div>
			</div>
			<div class="span1">	
				<div>Ŀ�´�Ƽ</div>
				<div><a href="../front?cmd=REVIEW">���� �Խ���</a></div>
				<div><a href="../front?cmd=QNA">���� �Խ���</a></div>
			</div>
			<div class="span1">
			
				<div>������</div>
				<div><a href="#">�̿� �ȳ�</a></div>
			</div>
		</div>
  </span>
</span>



			<a href="#terms" data-toggle="modal" style="color:#F5F3F3;">�̿� ���</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="#personalinformation"  data-toggle="modal" style="color:#F5F3F3;">����������ħ</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="#broken"  data-toggle="modal"style="color:#F5F3F3;">�ļձ���</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="#refund"  data-toggle="modal"style="color:#F5F3F3;">ȯ�� ��å</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			
		</div>
		<br/><br/><br/>
		<div class="span12" style="margin-left:-10px;">
			<p>&copy;Unique 2016 ������ �̻��ϰڽ��ϴ�</p>
		<div class="row">
			<div class="span6">
				<div align="right"><a href="index.jsp"><img alt="" src="../img/15.png" style="color:#eee;"></a></div>
			</div>
			<div class="span6" style="align:left;">
				<div align="left"><p>&nbsp;&nbsp;&nbsp;&nbsp;����� �߱� <br/>&nbsp;&nbsp;&nbsp;&nbsp; tel:010-1111-1111 <br/>&nbsp;&nbsp;&nbsp;&nbsp; All right reserved</p></div>
			</div>
		</div>
		</div>
	</div>
	</div>





<div id="terms" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">��</button>
    <h3 id="myModalLabel">�̿���</h3>
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
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">��</button>
    <h3 id="myModalLabel">�������� ��� ��ħ</h3>
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
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">��</button>
    <h3 id="myModalLabel">�ļձ���</h3>
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
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">��</button>
    <h3 id="myModalLabel">ȯ�� ��å</h3>
  </div>
  <div class="modal-body">
		<jsp:include page="../footer/refund.jsp" flush="false"/>
  </div>
  <div class="modal-footer">
    <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
  </div>
</div>




