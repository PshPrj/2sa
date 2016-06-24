<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<h4 align="left">�����̳� �� ������Ȳ <small>�����̳� �� �����Ȳ�Դϴ�.</small></h4>
	
<div align="right" id="truk_num">
<form class="form-inline" action="../staffpage?cmd=CONTAINER_RESERVATION" method="post">
	<span>�����̳� ���</span>&nbsp;&nbsp;	
	<select name="select_name">	
		<c:if test="${name_list!=null}">
			<c:forEach items="${name_list}" var="st">
				<option>${st.container_name}</option>
			</c:forEach>
		</c:if>
	</select>
	 <button type="submit" class="btn">Ȯ��</button>	
	</form> 
</div>
<hr/>	
	
<table class="table table-bordered">
			<thead>
				<tr>
					<th colspan="3">�����̳� �̿���Ȳ</th>				
				</tr>				
			</thead>
			<tbody>
					<tr>
					<c:if test="${list_size!=0 }">
						<td rowspan="${list_size+1}">
							<h4 style="margin: auto;">�ֱ� ��� ��</h4>
							<p class="text-info">(�̻� �Ϸ� 5������)</p>
							<a class="btn" href="staffmodal?cmd=ALL_CONRESERVATION&con_num=${container_num }" data-toggle="modal" data-target="#all_container_reservation" >��ü ��� ����</a>						
						</td>
					</c:if>
					<c:if test="${list_size==0}">
						<td rowspan="2">
						<h4 style="margin: auto;">�ֱ� ��� ��</h4>				
						</td>
					</c:if>
						<td>���� ��ȣ</td>
						<td>�̿��</td>
						<td>��� ��¥</td>
					</tr>
					<c:if test="${list_size==0}">
						<tr>
							<td colspan="3"><span class="text-info">�����̳ʸ� �������ּ���.</span></td>
						</tr>
					</c:if>
					<c:if test="${list_size!=0}">
						<c:forEach items="${list}" var="list">			
							<tr>
								<td>${list.pay_num}</td>
								<td>[ID : ${list.member_id }/ �̸� : ${list.member_name }] </td>
								<td>${list.date} ~ ${list.last_date}</td>
							</tr>
						</c:forEach>
					</c:if>	
					<tr>
						<td colspan="4">���� ��� �� ����Ʈ</td>
					</tr>					
					<tr>
						<td>���� ��ȣ</td>
						<td>�̿� ��</td>
						<td>��� ��¥</td>
						<td>��ǰ ��� Ȯ��</td>
					</tr>
					<c:if test="${current_size==0}">
						<tr>
							<td colspan="4"><span class="text-info">�����Ͱ� �����ϴ�.</span></td>
						</tr>
					</c:if>
					<c:if test="${current_size!=0}">
						<c:forEach items="${current}" var="cu">	
							<tr>
								<td>${cu.pay_num }</td>
								<td>[ID : ${cu.member_id }/ �̸� : ${cu.member_name }] </td>
								<td>${cu.date} ~ ${cu.last_date}</td>
								<td><a href="staffmodal?cmd=ITEMLIST_CONTAINER&res_num=${cu.res_num}" class="btn" data-toggle="modal" data-target="#container_item_modal">����</a></td>
							</tr>
						</c:forEach>
					</c:if>					
			</tbody>
			<tfoot></tfoot>	
	</table>
	
		
	<div class="modal fade" id="container_item_modal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="margin: auto;">
	    <div class="modal-dialog">
	        <div class="modal-content">
	          <div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">��</button>
				<h3 id="myModalLabel">��ǰ���</h3>
			  </div>
	          <div class="modal-body"></div>
	          <div class="modal-footer">
				<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>			
			  </div>           
	        </div> <!-- /.modal-content -->
	    </div> <!-- /.modal-dialog -->
	</div> 
	
	<div class="modal fade" id="all_container_reservation" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="margin: auto;">
	    <div class="modal-dialog">
	        <div class="modal-content">
	          <div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">��</button>
				<h3 id="myModalLabel">�󼼺���</h3>
			  </div>
	          <div class="modal-body"></div>
	          <div class="modal-footer">
				<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>			
			  </div>           
	        </div> <!-- /.modal-content -->
	    </div> <!-- /.modal-dialog -->
	</div>  

	
	
	