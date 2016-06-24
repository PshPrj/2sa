<!-- 
 	담당 : 정효진
	최종 수정 일자 : 6/19
	수정 후 이동 페이지
 -->

<%@page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@page contentType="text/html; charset=UTF-8" errorPage="DBError.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html;charset=UTF-8");
	request.getParameter("content").replace(" ", "&nbsp;").replace("\r\n","<br>");
%>

		<script>
			alert("수정되었습니다.");
			location.href="../front?cmd=NOTICE";
		</script>
