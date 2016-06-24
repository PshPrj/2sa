<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script src="../bootstrap/js/jquery-2.2.3.min.js"></script>

<script>

$(document).ready(function(){
	$("#del").click(function(event){
		alert("���� �Ϸ�");	
		var img_name = $("#img_name").val();
		  $.ajax({
		      type: "POST", 
		      url: "../drawing.do?cmd=D_2", 
		      contentType: "application/x-www-form-urlencoded; charset=utf-8",  
		      data: { "img_name": img_name }
		    }).success(function(o) {
		    	 location.reload();
		    });
		});

});


</script>

<h4>���� Ȯ��</h4>
<table id="floorplanTable" class="table table-hover">
	<thead>
		<tr>
			<th class="span2">���� ��ȣ</th>
			<th class="span6">���� ����</th>
			<th class="span1">����</th>
			<th class="span1">����</th>
			<th class="span2">�ٿ�ε�</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${floorplanList}" var="plan" varStatus="status">
			<tr>
				<td>${plan.template_num}</td>
				<td>${plan.regi_date_draw}</td>
				<td><a href="#show${status.count}" role="button" class="btn" data-toggle="modal">����</a>

					<div id="show${status.count}" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">��</button>
							<h3 id="myModalLabel">���� Ȯ��</h3>
						</div>
						<div class="modal-body">
							<img src="../upload/drawing/${plan.img_name}.png">
						</div>
						<div class="modal-footer">
							<button class="btn" data-dismiss="modal" aria-hidden="true">�ݱ�</button>
							<a href="../upload/drawing/${plan.img_name}.png" download="${plan.img_name}.jpg" role="button" class="btn">�ٿ�ε�</a>
						</div>
					</div>
				</td>
				
				<input type="hidden" value="${plan.img_name}" id="img_name"/>
				<td><a class="btn" id="del">���� </a></td>
				<td><a href="../upload/drawing/${plan.img_name}.png" download="${plan.img_name}.jpg" role="button" class="btn">�ٿ�ε�</a></td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<style>
.modal img {
	width: 100%;
	height: 100%;
}

#floorplanTable th {
	text-align: center;
}
#floorplanTable td {
	text-align: center;
}
</style>