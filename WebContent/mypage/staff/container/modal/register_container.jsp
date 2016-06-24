<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
	
	$("#resister_ok").click(function(){
		var staff_num=$("#select_staff option:selected").val();
		var name=$("#name").val();
		var capacity=$(":radio[name='capacity']:checked").val();

		$.ajax({
			type : "GET",
			url : "staffmodal?cmd=REGISTER_CON&staff_num="+staff_num+"&name="+name+"&capacity="+capacity+"&type=Y",
			success : function(data) {	
				$("#name").val("");
				$("#type").val("");				
			}
		});
	});


</script>

	<div class="modal-body">
		<table class="table table-striped table-bordered">
			<tr>
				<td>컨테이너 이름</td>
				<td><input type="text" id="name" placeholder="컨테이너 이름을 입력하세요." /></td>			
			</tr>
			<tr>
				<td colspan="2">용량</td>
			</tr>
			<tr>
				<td colspan="2">
				<input type="radio" value="20" name="capacity" checked="checked" />20톤 &nbsp; &nbsp; &nbsp;			 	
				<input type="radio" value="30" name="capacity" />30톤		 &nbsp; &nbsp; &nbsp;		
				<input type="radio" value="40" name="capacity" />40톤 &nbsp; &nbsp; &nbsp;
				<input type="radio" value="50" name="capacity" />50톤		 &nbsp; &nbsp; &nbsp;				
				</td>
			</tr>
			<tr>
				<td>직원 선택</td>
				<td>
					<select id="select_staff">
					<c:forEach items="${list}" var="list">
						<option value="${list.num }">${list.name }</option>
					</c:forEach>
					</select>			
				</td>			
			</tr>
			<tr>
				<td>컨테이너 등록</td>
				<td><a class="btn btn-primary" id="resister_ok">확인</a></td>
			</tr>			
		</table>			
	</div>
