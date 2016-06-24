<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script src="../bootstrap/js/jquery-2.2.3.min.js"></script>

<script>

$(document).ready(function(){
	$("#del").click(function(event){
		alert("삭제 완료");	
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

<h4>도면 확인</h4>
<table id="floorplanTable" class="table table-hover">
	<thead>
		<tr>
			<th class="span2">도면 번호</th>
			<th class="span6">저장 일자</th>
			<th class="span1">보기</th>
			<th class="span1">삭제</th>
			<th class="span2">다운로드</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${floorplanList}" var="plan" varStatus="status">
			<tr>
				<td>${plan.template_num}</td>
				<td>${plan.regi_date_draw}</td>
				<td><a href="#show${status.count}" role="button" class="btn" data-toggle="modal">보기</a>

					<div id="show${status.count}" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
							<h3 id="myModalLabel">도면 확인</h3>
						</div>
						<div class="modal-body">
							<img src="../upload/drawing/${plan.img_name}.png">
						</div>
						<div class="modal-footer">
							<button class="btn" data-dismiss="modal" aria-hidden="true">닫기</button>
							<a href="../upload/drawing/${plan.img_name}.png" download="${plan.img_name}.jpg" role="button" class="btn">다운로드</a>
						</div>
					</div>
				</td>
				
				<input type="hidden" value="${plan.img_name}" id="img_name"/>
				<td><a class="btn" id="del">삭제 </a></td>
				<td><a href="../upload/drawing/${plan.img_name}.png" download="${plan.img_name}.jpg" role="button" class="btn">다운로드</a></td>
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