<%@page import="register.model.registerDto"%>
<%@ page contentType="text/html; charset=utf-8"%>
<jsp:useBean id="dto" class="register.model.idcheckCommand"></jsp:useBean>
<%
	registerDto regidto = (registerDto)session.getAttribute("dto");
	String id = regidto.getId();
	String pw = regidto.getPw();
	request.setCharacterEncoding("utf-8");
%>
	<%
		if(id != ""){
			
	%>
		아이디는 <%=id %> 입니다.
	<%
		}
		else if(pw != ""){
	%>
		비밀번호는  <%=pw %> 입니다.
	<%
		}
	%>