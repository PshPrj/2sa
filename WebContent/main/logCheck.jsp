<%@page import="register.model.registerDto"%>
<%@ page contentType="text/html; charset=utf-8"%>
<jsp:useBean id="dto" class="register.model.idcheckCommand"></jsp:useBean>
<%
	registerDto regidto = (registerDto)session.getAttribute("dto");
	String id = regidto.getId();
	String member_no = regidto.getMember_no();
	request.setCharacterEncoding("utf-8");
%>
	<%
		if(id.equals("비번")){
			
	%>
		<result>pw</result>
	<%
		}
		else if(id.equals("아이디")){
	%>
		<result>id</result>
	<%
		}
		else{
	%>
		<result><%=member_no%></result>
	<%
		}
	%>