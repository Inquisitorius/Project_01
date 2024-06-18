<%@page import="Info.TestDAO"%>
<%@page import="Info.TestDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Main.JDBConnect"%>
<%@ page import="Main.TestDBPool"%>
<% 
String num = request.getParameter("num");
TestDAO dao = new TestDAO(application);
TestDTO dto = dao.View(num);
dao.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>JDBC 테스트 1</h2>
	<%
	JDBConnect jdbc1 = new JDBConnect();
	jdbc1.close();
	%>
	<h2>JDBC 테스트 2</h2>
	<%
	String driver = application.getInitParameter("OracleDriver");
	String url = application.getInitParameter("OracleURL");
	String id = application.getInitParameter("OracleId");
	String pwd = application.getInitParameter("OraclePwd");
	
	JDBConnect jdbc2 = new JDBConnect(driver, url, id, pwd);
	jdbc2.close();
	%>
	<h3>JDBC 테스트 3</h3>
	<%
	JDBConnect jdbc3 = new JDBConnect(application);
	jdbc3.close();
	%>
	 <h4>JDBC 테스트 4</h4>
	<%
	TestDBPool pool = new TestDBPool();
	pool.close();
	%> 
	<h5>연결확인</h5>
	<%
	String name = dto.getName();
	%>
	<script>
	document.write("ddddddddd");
	</script>
	<h4>${ dto.name }</h4>
	<form name="Views">
		<td>번호</td>
		<td><%= dto.getNum() %></td>
		<td><%= dto.getName() %></td>
		<td><%= dto.getKind() %></td>
	</form>
</body>
</html>