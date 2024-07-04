<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
    HttpSession session2 = request.getSession(false);
    if (session != null) {
        Integer productId = (Integer) session.getAttribute("currentProductId");
        Integer userId = (Integer) session.getAttribute("idx");
        Integer quantity = (Integer) session.getAttribute("quantity");

        // 로그로 세션 값 확인
        System.out.println("Product ID: " + productId);
        System.out.println("User ID: " + userId);
        System.out.println("Quantity: " + quantity);
    } else {
        // 세션이 없는 경우 (로그인하지 않거나 세션이 만료된 경우)
        response.sendRedirect("/MainPage/LoginPage.jsp");
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Buypage</title>
<jsp:include page="/Common/LinkFile.jsp"/>
<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="/resources/css/Common.css">
<script src="https://kit.fontawesome.com/a0b08e370a.js" crossorigin="anonymous"></script>
<script src="/resources/bootstrap/js/jquery-3.7.1.js"></script>
<script src="/resources/bootstrap/js/jQueryRotate.js"></script>
<style type="text/css">
h2 {
text-align:center;
font-family: "Noto Sans KR";
font-optical-sizing: auto;
font-style: normal;
color: gray;

}
</style>
</head>
<body>
<jsp:include page="/Common/Header.jsp"/>
<main>
<div class="container"style = "max-width: 1050px; min-width:1050px; padding-left: 0px;padding-top: 20px;" >
<h2>구매 페이지</h2>

 <p>Product ID: <%= session.getAttribute("currentProductId") %></p>
    <p>User ID: <%= session.getAttribute("idx") %></p>
    <p>Quantity: <%= session.getAttribute("quantity") %></p>
    
<button type="button" class="btn btn-outline-success" id="buyButton">구매완료</button>

<form id="buyForm" action="/test/Buypage.do" method="post">
  				<input type="hidden" name="product_id" id="hiddenProductId" value="<%= session.getAttribute("currentProductId") %>">
  				<input type="hidden" name="idx" id="hiddenUserId" value="<%= session.getAttribute("idx") %>">
  				<input type="hidden" name="quantity" id="hiddenQuantity" value="<%= session.getAttribute("quantity") %>">
				<input type="hidden" name="price" id= "hiddenprice" value ="<%= session.getAttribute("price") %>">
				</form>


</div>
</main>
<jsp:include page="/Common/Footer.jsp"/>
	
	
	<script>
	
	$(document).ready(function() 
	{
		
		var loginCheck = $('#loginSave').val();
		var authCheck = $('#authSave').val();
		
		if(loginCheck == 'null') {
			

			console.log("체크");
		}			
		else
		{ 
			console.log("있음 체크");
		}
	});
	
	 document.getElementById('buyButton').addEventListener('click', function() {
		    // 이미 폼에 값이 설정되어 있으므로 여기서 따로 설정할 필요 없음

		    // 값 확인
		    var productId = document.getElementById('hiddenProductId').value;
		    var userId = document.getElementById('hiddenUserId').value;
		    var quantity = document.getElementById('hiddenQuantity').value; // .value로 가져옴

		    if (!productId) {
		      console.log("상품 ID가 비어 있습니다.");
		    } else {
		      console.log("상품 ID: " + productId);
		    }
		    
		    if (!userId) {
		      console.log("유저 ID가 비어 있습니다.");
		    } else {
		      console.log("유저 ID: " + userId);
		    }
		    
		    if (!quantity) {
		      console.log("수량이 비어 있습니다.");
		    } else {
		      console.log("수량: " + quantity);
		    }

		    // 폼을 제출
		    document.getElementById('buyForm').submit();
		  });
	</script>	
	
	<script src="/resources/bootstrap/js/bootstrap.bundle.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
	 <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
	
</body>
</html>