<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h4 align="left">Ʈ�� �� ������Ȳ <small>Ʈ�� �� �����Ȳ�Դϴ�.</small></h4>

<div align="right" id="truk_num">
<form class="form-inline" action="../staffpage?cmd=TRUCK_RESERVATION" method="post">
	<span>Ʈ�� ��ȣ</span>&nbsp;&nbsp;	
	<select name="select_name">	
		<c:if test="${name_list!=null}">
			<c:forEach items="${name_list}" var="st">
				<!-- Ʈ�� ��ȣ ������ -->
				<option>${st.car_name}</option>
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
			<th colspan="4">Ʈ�� �̿���Ȳ</th>
		</tr>
	</thead>
	<tbody>
		<tr><c:if test="${list!=null }">
				<td rowspan="${list_size+1}">
				<h4 style="margin: auto;">�ֱ� ��� ��</h4>
				<p class="text-info">(�̻� �Ϸ� 5������)</p> <a class="btn"
				href="staffmodal?cmd=ALL_TRUCK_INFO&truck_num=${truck_num}"
				data-toggle="modal" data-target="#all_truck_reservation">��ü ���
					����</a>				
				</td>
			</c:if>
			<c:if test="${list==null}">
				<td rowspan="2">
				<h4 style="margin: auto;">�ֱ� ��� ��</h4>				
				</td>
			</c:if>
			<td>���� ��ȣ</td>
			<td>�̿� ��</td>
			<td>��� ��¥</td>
		</tr>
		<c:if test="${list_size==0}">
			<tr>
				<td colspan="3"><span class="text-info">�� ��ȣ�� �������ּ���.</span></td>
			</tr>
		</c:if>	
		<c:if test="${list_size!=0}">
			<c:forEach items="${list}" var="list">			
				<tr>
					<td>${list.pay_num}</td>
					<td>[ID : ${list.member_id }/ �̸� : ${list.member_name }] </td>
					<td>${list.date}</td>
				</tr>
			</c:forEach>
		</c:if>		
		<tr>
			<td colspan="4">���� ���� ����Ʈ</td>
		</tr>
		<tr>
			<td>���� ��ȣ</td>
			<td>��</td>
			<td>��� ��¥</td>
			<td>���� �� ����</td>
		</tr>
		
		<c:if test="${current!=null}">
			<tr>
				<td>${current.pay_num}</td>
				<td>${current.member_id}/${current.member_name }</td>
				<td>${current.date}</td>
				<td><a
					href="staffmodal?cmd=CURRENTRESTURCK&truck_num=${truck_num }"
					class="btn" data-toggle="modal"
					data-target="#detail_truck_reservation">����</a></td>
			</tr>
		</c:if>
		<c:if test="${current==null}">
			<tr>
				<td colspan="4"><span class="text-info">�����Ͱ� �����ϴ�.</span></td>
			</tr>
		</c:if>		
	</tbody>
	<tfoot></tfoot>
</table>

<div class="modal fade" id="detail_truck_reservation" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true" style="margin: auto;">
	<div class="modal-dialog">
		<div class="modal-content" style="margin: auto">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">��</button>
			</div>
			<div class="modal-body"></div>
			<div class="modal-footer">
				<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>


<div class="modal fade" id="all_truck_reservation" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true" style="margin: auto;">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">��</button>
				<h3 id="myModalLabel">���� ���</h3>
			</div>
			<div class="modal-body"></div>
			<div class="modal-footer">
				<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>







