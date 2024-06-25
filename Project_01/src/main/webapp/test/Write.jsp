<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의하기</title>
<script type = "text/javascript">
function validateForm(form) {
	if (form.name.value == "") {
		alert("이름을 입력하세요.");
		form.content.focus();
		return false;
	}
	if (form.title.value == "") {
		alert("제목을 입력하세요.");
		form.title.focus();
		return false;
	}
	if (form.content.value == "") {
		alert("내용을 입력하세요.");
		form.content.focus();
		return false;
	}
}

</script>
</head>
<body>
<form name="writeFrm" method="post" enctype="multpart/form-data"
	action="../test/Write.do" onsubmit="return validateForm(this);">
	<h2> 상품 문의하기</h2>
	<tr>
		<input type="image" src = "../resources/img/melon.jpg" style="width:150px;"/>
		<td>상품이름</td>
	</tr><br/>
	<tr>
		<td>유저</td>
		<td>
		<input type="text" name="name" style="width:30%;" />
		</td>
	</tr><br/>
	<tr>
		<td>제목</td>
		<td>
		<input type="text" name="title" style="width:30%;" />
		</td>
	</tr><br/>
	<tr>
	<td>내용</td>
		<td>
		<textarea name="content" style="width:30%; height:50px;"></textarea>
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<button type="cancle">취소</button>
			<button type="submit" onclick="location.href='/test/List.do'">등록</button>
		</td>
	</tr>
	</form>

</body>
</html>