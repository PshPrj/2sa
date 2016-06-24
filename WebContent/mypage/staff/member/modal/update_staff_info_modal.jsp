<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>

$("#update_staff").click(function(){
	var dept=$("#dept option:selected").val();
	var num=$("#staff_num").text();
	var name=$("#name").val();
	var id=$("#id").val();
	var tel=$("#tel").val();
	$.ajax({
		type : "GET",
		url : "staffmodal?cmd=UPDATESTAFF_INFO&type=2&staff_num="+num+"&id="+id+"&name="+name+"&dept="+dept+"&tel="+tel,
		success : function(data) {
			$("#update_result p").remove();
			$("#update_result").append("<p class='text-info'>배정 완료</p>");
		}
	});
});

$("#do_back").click(function(){
	location.reload();
});

</script>



<div class="modal-body">
<table class="table table-bordered">
		<tr>
			<td>직원 번호</td>
			<td>직원 ID</td>
			<td>직원 이름</td>
			<td>직원 전화 번호</td>
		</tr>

		<tr>
			<td><span id="staff_num">${list.num }</span></td>
			<td><input type="text" value="${list.id}" id="id" class="input-small"/></td>			
			<td><input type="text" value="${list.name}" id="name" class="input-small"/></td>
			<td><input type="text" value="${list.tel}" id="tel" class="input-small"/></td>			
		</tr>
		<tr>
			<td colspan="2">현재 부서</td>
			<td colspan="2">변겅</td>
		</tr>
		<tr>
			<td colspan="2">현재 :${list.dept}</td>
			<td colspan="2">
				<select id="dept" style="width: 150px;">
					<option value="1">사이트 관리부</option>
					<option value="2">트럭 관리부</option>
					<option value="3">컨테이너 관리부</option>
					<option value="4">이삿짐부</option>
				</select>			
			</td>		
		</tr>

		<tr>
			<td colspan="4"><button class="btn" style="text-align: center;" id="update_staff">확인</button></td>
		</tr>
</table>

<div id="update_result"></div>
<div class="modal-footer">
				<button class="btn" data-dismiss="modal" aria-hidden="true" id="do_back">Close</button>
			</div>
</div>