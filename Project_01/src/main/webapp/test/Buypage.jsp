<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix ="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="Board.BoardDAO"%>
<%@ page import="Board.BoardDTO"%>
<%@ page import="Main.JDBConnect"%>
<%@ page import="Main.TestDBPool"%>
<%@ page import="DTO.InqueryDTO"%>
    
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
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<style type="text/css">
h2 {
text-align:center;
font-family: "Noto Sans KR";
font-optical-sizing: auto;
font-style: bold;
color: black;

}
.button_style2
{
background-color: green;
color: white;
}

.fontCommon_Option
{
font-family: "Noto Sans KR", sans-serif;
font-optical-sizing: auto;
font-style: normal;
color: #333333;
margin-bottom:10px;
font-size: 18px;
}
.fontCommon_bold
{
font-family: "Noto Sans KR", sans-serif;
font-optical-sizing: auto;
font-style: bold;
color: #333333;
margin-bottom:10px;
font-size: 24px;
}
.fontCommon_price
{
font-family: "Noto Sans KR", sans-serif;
font-optical-sizing: auto;
font-style: normal;
color: #333333;
font-size: 18px;
margin-bottom:10px;
}

</style>
</head>
<body>
<jsp:include page="/Common/Header.jsp"/>
<main>
<div class="container"style = "max-width: 1050px; min-width:1050px; padding-left: 0px;padding-top: 15px;" >
<h2>구매 페이지</h2>
    <hr>
    <div class ="row d-flex flex-nowrap" style="padding-bottom: 10px">
    <div class ="col-4" style="display: flex; justify-content: center;"> 
    <c:forEach var="ProductDTO" items="${product2}">
    <img src = "${ ProductDTO.product_img }" style = "width: 220px; height: auto; border-radius: 2%;overflow: hidden;"/>
    </div>
     <div class="col-4">
     <div class="row" style="padding-bottom: 10px">
    <div class = "col-md-12 fontCommon_bold">
     상품 상세 정보
	</div>
	</div>
     <div class="row" style="padding-bottom: 10px">
    <div class = "col-md-12 fontCommon_Option">
     상품이름 : ${ ProductDTO.name } 
	</div>
	</div>
	 <div class="row" style="padding-bottom: 10px">
    <div class = "col-md-12 fontCommon_Option">
     수량 : <%= session.getAttribute("quantity") %> <span>개</span>
	</div>
	</div>
	 <div class="row" style="padding-bottom: 10px">
    <div class = "col-md-12 fontCommon_Option">
     배송 : ${ ProductDTO.delivery_type } 
	</div>
	</div>
	<div class="row">
	<div class = "col-md-12 fontCommon_price">
	
	</div>
    </div>
    </div>
    <div class="col-4">
    <div class="row">
    <div class = "col-md-12 fontCommon_bold">
     최종 주문 금액
	</div>
    </div>
    <div class="row">
    <div class = "col-md-12 fontCommon_Option">
     할인율 : <sapn style=color:red;> ${ ProductDTO.price_percent }% </sapn> 		
	</div>
    </div>
    <div class="row">
    <div class = "col-md-12 fontCommon_Option">
     최종 구매 가격 : 
	 <fmt:formatNumber type="Number" maxFractionDigits="3" value="${price}" />
	 <span>원</span>
    </div>
    </div>
    </div>
</div> </c:forEach>
<hr>
    <div class = "row" style="display:flex;justify-content: center;">
   <div class="col">
   <button type="button" class="btn btn-outline-secondary" id="backButton"style="float: right;">뒤로 가기</button>
</div>
    	<div class="col">
<button type="button" class="btn btn-outline-success" id="buyButton">구매완료</button>

<form id="buyForm" action="/test/Buypage.do" method="post">
  				<input type="hidden" name="product_id" id="hiddenProductId" value="<%= session.getAttribute("currentProductId") %>">
  				<input type="hidden" name="idx" id="hiddenUserId" value="<%= session.getAttribute("idx") %>">
  				<input type="hidden" name="quantity" id="hiddenQuantity" value="<%= session.getAttribute("quantity") %>">
				<input type="hidden" name="price" id= "hiddenprice" value ="<%= session.getAttribute("price") %>">
				</form>
				</div>
</div>
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
    document.getElementById('backButton').addEventListener('click', function() {
        window.history.back(); // 이전 페이지로 이동
    });
    
	 document.getElementById('buyButton').addEventListener('click', function() {
	 

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
		    
		    Swal.fire({
                icon: 'success',
                title: '구매가 완료되었습니다.',
                text: '메인 페이지로 이동합니다.',
                confirmButtonText: '확인'
            }).then((result) => {
                if (result.isConfirmed) {
                    document.getElementById('buyForm').submit();
                }
		    
		    document.getElementById('buyForm').submit();
		  });	
	 });
	 
	</script>	
	
	<script src="/resources/bootstrap/js/bootstrap.bundle.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
	 <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
	
</body>
</html>