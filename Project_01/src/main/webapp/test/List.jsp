<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>목록</title>
<style>a{text-decoration:none;}</style>
</head>
<body>
	<h2> 게시판 - 목록</h2>
	<form method="get">
	</form>
	<section class="notice">
		<div class = "container">
		<h3>상품 문의</h3>
		<c:choose>
			<c:when test="${ empty boardLists }">
				<p>등록된 게시물이 없습니다</p>
			</c:when>
			<c:otherwise>
				<c:forEach items="${ boardLists }" var="row" varStatus="loop">
				<p>${ map.totalCount - (((map.pageNum-1) * map.pageSize) + loop.index)}
				</p>
				<p>${ row.name } </p>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</div>
	</section>	
</body>
</html>