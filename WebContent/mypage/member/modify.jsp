<!-- 
	�ӵ���
	2016-06-14
	ȸ�� ���� ���� 2�ܰ� ���� ����.
	
 -->
<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<script>
$(function() {
	var verifyTel = false;
	
	/* ��й�ȣ Ȯ�� ��ư */
	$('#inputPw2').bind("keyup", fnPwChk);
	
	/* ����Ȯ�� ��ư */
	$('#verifyTel').bind("click", function() {
		verifyTel = true;
		$('#telControl').html('<span>����Ȯ���� �Ϸ�Ǿ����ϴ�.<span>').css("color", "green");
	})
	
	$('#return').bind("click", function(e) {
		e.preventDefault();
		location.href='mypage?cmd=mymain';
	})

	$('#submit').bind("click", function(e) {
		if($('#inputPw1').val() == '' || $('#inputPw2').val() == '' || $('#inputPw1').val() != $('#inputPw2').val()) {
			alert("��й�ȣ�� Ȯ�����ּ���.");
			e.preventDefault();
		} else if(verifyTel == false) {
			alert("���� Ȯ���� ���ּ���.");
			e.preventDefault();
		} else {
			e.preventDefault();
	 		$.post("mypage?cmd=modify_proc", {pw : $('#inputPw2').val(), tel : $('#inputTel').val()})
			.done(function(data) {
				$('#content').html(data);
			})
			.fail(function() {
				alert("bad");	
			})
		}
	})
})

function fnPwChk() {
	var pw1 = $('#inputPw1').val();
	var pw2 = $('#inputPw2').val();
	
	if(pw2 == 0) {
		$('#feedback').text("��й�ȣ�� �ٽ� �� �� �Է����ּ���.").css("color", "red");
	} else {
		if(pw2 == pw1) {
			$('#feedback').text("��й�ȣ�� ��ġ�մϴ�.").css("color", "green");
		} else {
			$('#feedback').text("��й�ȣ�� ��ġ���� �ʽ��ϴ�.").css("color", "red");
		}
	}
}
</script>
<style>
input {
	text-align: left;
}
form {
	text-align: left;
}
</style>

<h4>���� ����</h4>
<c:if test="${modifyDto != null}">
<div id="content">
<form class="form-horizontal">
	<div class="control-group">
		<label class="control-label" for="inputId">���̵�</label>
		<div class="controls">
			<input type="text" name="id" id="inputId" value="${modifyDto.m_id}" readonly="readonly" class="input-medium"/>
		</div>
	</div>
	<div class="control-group">
		<label class="control-label" for="inputPw1">�� ��й�ȣ</label>
		<div class="controls">
			<input type="password" name="pw1" id="inputPw1" class="input-medium" />
		</div>
	</div>
	<div class="control-group">
		<label class="control-label" for="inputPw2">��й�ȣ Ȯ��</label>
		<div class="controls">
			<input type="password" name="pw2" id="inputPw2" class="input-medium" />
			<span id="feedback"></span>
		</div>
	</div>
	<div class="control-group">
		<label class="control-label" for="inputTel">�޴���ȭ</label>
		<div class="controls">
			<input type="text" name="tel" id="inputTel" value="${modifyDto.m_tel}" class="input-medium"/>
			<span id="telControl">
				<input type="button" id="verifyTel" value="���� Ȯ��" class="btn">
			</span>
		</div>
	</div>
	<div class="control-group">
		<div class="controls">
			<button type="reset" class="btn">�������</button>
			<button id="return" class="btn">���ư���</button>
			<button id="submit" class="btn btn-primary">����</button>
		</div>
	</div>
	<br> 
	<br>
</form>
</div>
</c:if>
 