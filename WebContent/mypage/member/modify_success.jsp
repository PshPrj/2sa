<%@ page contentType="text/html; charset=EUC-KR"%>
회원 정보가 수정되었습니다.<br>
<button id="toMain" class="btn">메인으로</button>

<script>
$(function() {
	$('#toMain').bind("click", function() {
		location.href='../main/index.jsp';
	})
})

</script>