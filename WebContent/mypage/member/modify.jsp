<!-- 
	임동범
	2016-06-14
	회원 정보 수정 2단계 정보 수정.
	
 -->
<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<script>
$(function() {
	var verifyTel = false;
	
	/* 비밀번호 확인 버튼 */
	$('#inputPw2').bind("keyup", fnPwChk);
	
	/* 본인확인 버튼 */
	$('#verifyTel').bind("click", function() {
		verifyTel = true;
		$('#telControl').html('<span>본인확인이 완료되었습니다.<span>').css("color", "green");
	})
	
	$('#return').bind("click", function(e) {
		e.preventDefault();
		location.href='mypage?cmd=mymain';
	})

	$('#submit').bind("click", function(e) {
		if($('#inputPw1').val() == '' || $('#inputPw2').val() == '' || $('#inputPw1').val() != $('#inputPw2').val()) {
			alert("비밀번호를 확인해주세요.");
			e.preventDefault();
		} else if(verifyTel == false) {
			alert("본인 확인을 해주세요.");
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
		$('#feedback').text("비밀번호를 다시 한 번 입력해주세요.").css("color", "red");
	} else {
		if(pw2 == pw1) {
			$('#feedback').text("비밀번호가 일치합니다.").css("color", "green");
		} else {
			$('#feedback').text("비밀번호가 일치하지 않습니다.").css("color", "red");
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

<h4>정보 수정</h4>
<c:if test="${modifyDto != null}">
<div id="content">
<form class="form-horizontal">
	<div class="control-group">
		<label class="control-label" for="inputId">아이디</label>
		<div class="controls">
			<input type="text" name="id" id="inputId" value="${modifyDto.m_id}" readonly="readonly" class="input-medium"/>
		</div>
	</div>
	<div class="control-group">
		<label class="control-label" for="inputPw1">새 비밀번호</label>
		<div class="controls">
			<input type="password" name="pw1" id="inputPw1" class="input-medium" />
		</div>
	</div>
	<div class="control-group">
		<label class="control-label" for="inputPw2">비밀번호 확인</label>
		<div class="controls">
			<input type="password" name="pw2" id="inputPw2" class="input-medium" />
			<span id="feedback"></span>
		</div>
	</div>
	<div class="control-group">
		<label class="control-label" for="inputTel">휴대전화</label>
		<div class="controls">
			<input type="text" name="tel" id="inputTel" value="${modifyDto.m_tel}" class="input-medium"/>
			<span id="telControl">
				<input type="button" id="verifyTel" value="본인 확인" class="btn">
			</span>
		</div>
	</div>
	<div class="control-group">
		<div class="controls">
			<button type="reset" class="btn">원래대로</button>
			<button id="return" class="btn">돌아가기</button>
			<button id="submit" class="btn btn-primary">수정</button>
		</div>
	</div>
	<br> 
	<br>
</form>
</div>
</c:if>
 