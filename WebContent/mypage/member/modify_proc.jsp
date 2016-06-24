<%@ page contentType="text/html; charset=EUC-KR"%>
<%@page import="mypage.db.ModifyDto"%>
<%@page import="mypage.db.MyPageDao"%>
<%@ page import="java.sql.*"%><%@page import="move.dbcp.DBconnectionMgr"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<%
		System.out.println("여기는들리니????????????????????");
		request.setCharacterEncoding("utf-8");
		String pw = request.getParameter("pw");
		String tel = request.getParameter("tel");
		int num = Integer.parseInt(request.getParameter("num"));

		System.out.println("여기는들리니????????????????????"+pw);
		System.out.println("여기는들리니????????????????????"+tel);
		System.out.println("여기는들리니????????????????????"+num);
	%>
	<jsp:useBean id="dto" class="mypage.db.ModifyDto">
		
		<jsp:setProperty property="m_pw" name="dto" value="<%=pw%>" />
		<jsp:setProperty property="m_tel" name="dto" value="<%=tel%>" />
		<jsp:setProperty property="m_num" name="dto" value="<%=num%>"/>
	</jsp:useBean>
	<jsp:useBean id="dao" class="mypage.db.MyPageDao" />
	<%
		dao.Update(dto);
	%>
</body>
</html>