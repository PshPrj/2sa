<%@page import="move.db.NoticeBoardDao"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page contentType="text/html; charset=EUC-KR" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<% 
	request.setCharacterEncoding("euc-kr");
	response.setContentType("text/html;charset=UTF-8");
%>
</head>
<body>


<script>
	alert("입력 되었습니다.");
	location.href="../front?cmd=QNA";
</script>
</body>
</html>