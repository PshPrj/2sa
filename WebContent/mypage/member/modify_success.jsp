<%@ page contentType="text/html; charset=EUC-KR"%>
ȸ�� ������ �����Ǿ����ϴ�.<br>
<button id="toMain" class="btn">��������</button>

<script>
$(function() {
	$('#toMain').bind("click", function() {
		location.href='../main/index.jsp';
	})
})

</script>