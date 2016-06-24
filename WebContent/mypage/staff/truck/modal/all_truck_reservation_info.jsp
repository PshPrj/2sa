<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<div class="modal-body">
		<table class="table table-striped table-bordered">
				<thead>
					<tr>
						<td>ȸ�� </td>
						<td>��¥</td>
						<td>��� �ּ�</td>
						<td>���� �ּ�</td>
						<td>�̵��Ÿ�</td>
					</tr>
				</thead>
				<tbody>
				<c:if test="${list_size!=0 }">
					<c:forEach items="${list}" var="list">
						<tr>
							<td>[ID:${list.member_id}/�̸� : ${list.member_name }]</td>
							<td>${list.date }</td>
							<td>${list.addr1 } </td>
							<td>${list.addr2 }</td>
							<td>${list.distant} km</td>
						</tr>
					</c:forEach>
				</c:if>	
				</tbody>
			</table>
</div>	
