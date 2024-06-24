<%@page import="Board.BoardDTO"%>
<%@page import="Board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<% 
String num = request.getParameter("idx");
BoardDAO dao = new BoardDAO();
BoardDTO dto = dao.View("idx");
dao.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 상세보기</title>
</head>
<body>
	<h2>게시판 상세보기</h2>
		
			<p>${ dto.idx }</p>
			<p>${ dto.name }</p>
			<h2><%@ %></h2>
</body>
</html>