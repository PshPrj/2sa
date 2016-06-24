<!-- 
	임동범
	2016-06-14
	회원 정보 수정 1단계 비밀번호 확인.
	
 -->
 
<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<h4>정보 수정</h4>
<p>소중한 정보 보호를 위해 비밀 번호를 다시 한 번 입력해주세요.</p>
<form class="form-inline" action="mypage?cmd=modify" method="post">
	비밀번호 : <input type="password" name="pw" id="pw" class="input-medium" />
	<button id="chk" class="btn">확인</button>
	<c:if test="${flag == false}">
		<br><br>
		<p style="color:red">비밀번호가 올바르지 않습니다.</p>
	</c:if>
</form>