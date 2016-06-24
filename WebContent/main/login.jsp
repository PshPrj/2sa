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
	<h1>아이디 : <%=regidto.getName()%>님 로그인</h1>
</body>
</html>