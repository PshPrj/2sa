<%@page import="register.model.registerDto"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="dto" class="register.model.registerDto"></jsp:useBean>
<%
			registerDto regidto = (registerDto)session.getAttribute("dto");
		%>
	<h1>���̵� : <%=regidto.getName()%>�� �α���</h1>
</body>
</html>