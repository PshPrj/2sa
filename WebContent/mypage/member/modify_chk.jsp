<!-- 
	�ӵ���
	2016-06-14
	ȸ�� ���� ���� 1�ܰ� ��й�ȣ Ȯ��.
	
 -->
 
<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<h4>���� ����</h4>
<p>������ ���� ��ȣ�� ���� ��� ��ȣ�� �ٽ� �� �� �Է����ּ���.</p>
<form class="form-inline" action="mypage?cmd=modify" method="post">
	��й�ȣ : <input type="password" name="pw" id="pw" class="input-medium" />
	<button id="chk" class="btn">Ȯ��</button>
	<c:if test="${flag == false}">
		<br><br>
		<p style="color:red">��й�ȣ�� �ùٸ��� �ʽ��ϴ�.</p>
	</c:if>
</form>