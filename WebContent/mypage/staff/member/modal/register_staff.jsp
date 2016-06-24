<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>

$("#update_staff").click(function(){
	var dept=$("#dept option:selected").val();
	var name=$("#name").val();
	var id=$("#id").val();
	var tel=$("#tel").val();
	var pw=$("#pw").val();
	$.ajax({
		type : "GET",
		url : "staffmodal?cmd=REGISTER_STAFF&type=2&id="+id+"&name="+name+"&dept="+dept+"&tel="+tel+"&type=Y&pw="+pw,
		success : function(data) {
			$("#update_result p").remove();
			$("#update_result").append("<p class='text-info'>등록 완료</p>");
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
			<td>직원 ID</td>
			<td>비밀번호</td>
		</tr>
		
		<tr>
			<td><input type="text" id="id" placeholder="아이디를 입력하세요."/></td>
			<td><input type="text" id="pw" placeholder="비밀번호를 입력하세요."/></td>
		</tr>
		<tr>	
			<td>직원 이름</td>
			<td>직원 전화 번호</td>			
		</tr>
			
		<tr>					
			<td><input type="text" id="name" placeholder="이름을 입력하세요."/></td>
			<td><input type="text" id="tel" placeholder="전화번호를 입력하세요."/></td>			
		</tr>
		<tr>
			<td colspan="1">부서</td>
			<td colspan="1">
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

</div>