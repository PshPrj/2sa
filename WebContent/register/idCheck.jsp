<%@page import="register.model.registerDto"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="dto" class="register.model.idcheckCommand"></jsp:useBean>

<%
	String id_c = (String)session.getAttribute("id_c");

	request.setCharacterEncoding("utf-8");
%>
	<%
		if(id_c=="사용불가"){
	%>
		<result>no</result>
	<%
		}
		else {
	%>
		<result>yes</result>
	<%
		}
	%>