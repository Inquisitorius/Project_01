<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="Board.BoardDAO"%>
<%@ page import="Board.BoardDTO"%>
<%@ page import="Main.JDBConnect"%>
<%@ page import="Main.TestDBPool"%>
<%@ page import="DTO.InqueryDTO"%>

<%
HttpSession session2 = request.getSession();
Integer currentProductId = (Integer) session.getAttribute("currentProductId");
Integer UserIDX = (Integer) session.getAttribute("idx");
if (currentProductId != null) {
    
} else {
	out.println("수량: " + currentProductId);
	out.println("상품 ID: " + UserIDX);

}

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Productpage</title>
<jsp:include page="/Common/LinkFile.jsp"/>
<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="/resources/css/Common.css">
<script src="https://kit.fontawesome.com/a0b08e370a.js" crossorigin="anonymous"></script>
<script src="/resources/bootstrap/js/jquery-3.7.1.js"></script>
<script src="/resources/bootstrap/js/jQueryRotate.js"></script>
<style type="text/css">
/*문의사항 css */
section.notice {
  padding: 80px 0;
}
.section 
{
height: 100px;
}
.page-title {
  margin-bottom: 60px;
}
	
.page-title h3 {
  font-size: 28px;
  color: #333333;
  font-weight: 400;
  text-align: center;
}
.board-table {
	font-size: 13px;
	border-top: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
}
.board-table a {
  color: #333;
  display: inline-block;
  line-height: 1.4;
  word-break: break-all;
  vertical-align: middle;
}
.board-table a:hover {
  text-decoration: underline;
} 
.board-table th {
  text-align: center;
}

.board-table .th-num {
  width: 150px;
  text-align: center;
}

.board-table .th-date {
  width: 200px;
}

.board-table .th-title{
	text-align: center;
	 width: 400px;
}
.board-table tbody td {
  border-top: 1px solid #e7e7e7;
  text-align: center;
}

.board-table tbody th {
  padding-left: 28px;
  padding-right: 14px;
  border-top: 1px solid #e7e7e7;
  text-align: left;
}

.board-table tbody th p{
  display: none;
  
}

.btn-dark {
  background: #555;
  color: #fff;
}

.btn-dark:hover, .btn-dark:focus {
  background: #373737;
  border-color: #373737;
  color: #fff;
}

.btn-dark {
  background: #555;
  color: #fff;
}

.btn-dark:hover, .btn-dark:focus {
  background: #373737;
  border-color: #373737;
  color: #fff;
}

/*문의사항 css e  */
.texttop_01
{
background-color :white ;
color :black;
font-weight: bold;
font-size: 30px;
}
.product_01
{
background-pozsition: left;
background-sie: cover;
border-radius: 24px;
}
.fontCommon_Option
{
font-family: "Noto Sans KR", sans-serif;
font-optical-sizing: auto;
font-style: normal;
color: #333333;
margin-bottom:10px
}
.fontCommon_price
{
font-family: "Noto Sans KR", sans-serif;
font-optical-sizing: auto;
font-style: normal;
color: #333333;
}
.fontCommon_nomal
{
font-family: "Noto Sans KR", serif;
font-optical-sizing: auto;
font-style: normal;
color: #333333;
margin-bottom:10px
}
.fontCommon_nomal2
{
font-family: "Noto Sans KR", serif;
font-optical-sizing: auto;
font-style: normal;
color: #333333;
width: 50px;
text-align: center;
}
.fontgray
{
font-family: "Noto Sans KR", sans-serif;
font-optical-sizing: auto;
font-style: normal;
color: gray;
margin-bottom:10px
}
.fontsmall
{
font-family: "Noto Sans KR";
font-optical-sizing: auto;
font-style: normal;
color: gray;
margin-bottom:10px
}
.font_line
{
font-family: "Noto Sans KR", serif;
text-decoration:line-through;
font-style: normal;
color: gray;
}
.right
{
display: flex;
justify-content: flex-end;
text-align: right;
float: right;
color :black;
font-weight: bold;
font-size: 15px;
}
.buy_button
{  
float: right;
width: 250px;
height: 50px;
}
.button_style
{      
background-color: #fff;
width: 330px;
height: auto;
top: 0px;
z-index: 10;
position: sticky;

}
.button_style2
{
background-color: white;
color: black;
}
.line_stlye
{
width:50%;
border:none;
background-color:gray;
}

h3 {
text-align:center;
font-family: "Noto Sans KR";
font-optical-sizing: auto;
font-style: normal;
color: gray;
}
p{
font-family: "Noto Sans KR";
font-optical-sizing: auto;
font-style: normal;
color: black;
}
.board-table .hidden-content {
	display: none; 
	padding: 10px;
	background-color: #f9f9f9;
}

.board-table tr {
	cursor: pointer; 
}

hr {
	border: 1px solid gray;
}

</style>
</head>
<body>
<jsp:include page="/Common/Header.jsp"/>
<main>
<div class="container"style = "max-width: 1050px; min-width:1050px; padding-left: 0px;padding-top: 20px;" >

<form id="idxForm" action="/SetSessionServlet" method="post" style="display:none;">
    <input type="hidden" name="idx" value="<%= session.getAttribute("idx") %>" />
    <button type="submit">Submit</button>
</form>
<div class="row d-flex flex-nowrap">
		 <div class="col-5"><c:forEach var="ProductDTO" items="${product2}">
		 	<img src = "${ ProductDTO.product_img }" style = "width: 400px; height: auto; border-radius: 2%;
		 	overflow: hidden; margin-right: 300px;"/>
		 </div>
		 <div class = "col-7">
		 	<div class= "row">
				<div class = "col-md-12 fontgray">
					${ ProductDTO.delivery_type } 
				</div>
			</div>
		 	<div class = "row">
					<div class = "col-md-12 fontCommon_Option" style = "font-size: 24px; font-weight: 600; color: #333;">
					${ ProductDTO.name }
					</div>
			</div>
			<div class= "row">
				<div class = "col-md-12 fontgray">
					${ ProductDTO.sub_text } 
				</div>
			</div>	
			<div class= "row">
				<div class = "col-md-12 fontCommon_price" style = "font-size: 26px;font-weight: 750; color: #333;">
					<sapn style="color:red;">${ ProductDTO.price_percent }% </sapn>${ ProductDTO.price_discount} <sapn style="font-weight:500";>원</sapn>
				</div>
			</div>	
			<div class= "row">
				<div class = "col-md-12 font_line" style="padding-bottom:10px;">
					${ ProductDTO.price_ori }
				</div>
			</div>	
			<div class= "row">
				<div class = "col-md-12 fontCommon_nomal">
					원산지 ${ ProductDTO.origin }
				</div>
			</div>	
			<hr style="height:1px;border:none;background-color:gray;">
			<div class= "row">
				<div class = "col-md-3 fontgray">
					배송
				</div>
				<div class = "col-md-4 fontgray">
					${ ProductDTO.delivery_type }
				</div>
			</div>
			<hr style="height:1px;border:none;background-color:gray;">
			<div class= "row">
				<div class = "col-md-3 fontgray">
					판매자
				</div>
				<div class = "col-md-4 fontgray">
					${ ProductDTO.seller_name }
				</div>
			</div>	
			<hr style="height:1px;border:none;background-color:gray;">
			<div class= "row">
				<div class = "col-md-3 fontgray">
					포장타입
				</div>
				<div class = "col-md-4 fontgray">
					${ ProductDTO.packaging_type }
				</div>
			</div>	
			<hr style="height:1px;border:none;background-color:gray;">
			<div class= "row">
				<div class = "col-md-3 fontgray">
					판매단위
				</div>
				<div class = "col-md-4 fontgray">
					${ ProductDTO.unit }
				</div>
			</div>
			<hr style="height:1px;border:none;background-color:gray;">
			<div class= "row">
				<div class = "col-md-3 fontgray">
					중량
				</div>
				<div class = "col-md-4 fontgray">
					${ ProductDTO.weight }
				</div>
			</div>
			<hr style="height:1px;border:none;background-color:gray;">
			<div class= "row">
				<div class = "col-md-3 fontgray">
					소비기한정보
				</div>
				<div class = "col-md-8 fontgray">
					${ ProductDTO.dateInfo }
				</div>
			</div>
			<hr style="height:1px;border:none;background-color:gray;">
			<div class= "row">
				<div class = "col-md-3 fontgray">
					안내사항
				</div>
				<div class = "col-md-8 fontgray">
					${ ProductDTO.notifi }
				</div>
			</div>
			<hr style="height:1px;border:none;background-color:gray;">
			<div class= "row">
				<div class = "col-md-3 fontgray">
					상품선택
				</div>
				<div class = "col-md-9 fontgray">
					<div class = "col-md-9 fontgray">
			<input type='button' class="button_style2"onclick='count("minus")'value='-'style="min-width: 25px;height: auto;border-radius: 2px;">
			<label class="fontCommon_nomal2" id='result'>1</label>
			<input type='button' class="button_style2" onclick='count("plus")'value='+'style="min-width: 25px;height: auto;border-radius: 3px;">
			</div>
			</div>
			</div>
			<hr style="height:1px;border:none;background-color:gray;">
			<div class= "row">
				<div class = "col-md-12 fontgray right" style="display:inline-flex;align-items: center;">
				총 상품 금액:<label id="totalPrice" style="font-weight:bold;font-size:25px;">${ ProductDTO.price_discount }</label>원</div>
					</div>
				<script>
 				 const basePrice = ${ ProductDTO.price_discount };
				</script>	
			</c:forEach>
			<div class="row">
				<div class= "col -4"style= "padding-bottom: 50px;display: flex;justify-content: flex-end;">
				<button type="button" class="btn btn-outline-success" id="buyButton" style="width:350px; height:50px";>구매하기</button>

			<!-- 폼 Hidden  -->
				<form id="buyForm" action="/test/Buypage.do" method="GET">
  				<input type="hidden" name="product_id" id="hiddenProductId" value="<%= currentProductId %>">
  				<input type="hidden" name="idx" id="hiddenUserId" value="<%= UserIDX %>">
  				<input type="hidden" name="quantity" id="hiddenQuantity" value="1">
				</form>
			
			</div>
			</div>
		 </div>
		 </div>
		 </div>
		 <div class="container" style = "max-width: 1050px; min-width:1050px; padding-left: 0px;position: sticky;top: 0px;z-index: 10;height:40px;">
		 <div class="row">
		 		<div class= "col-4">
				<button type="button" id='button1' class="btn btn-outline-success button_style">상품설명</button>
				</div>
				<div class= "col-4">
				<button type="button" id='button2'class="btn btn-outline-success button_style">후기</button>
				</div>
				<div class= "col-4">
				<button type="button" id='button3'class="btn btn-outline-success button_style">문의</button>
				</div>
			</div>
		 </div>
		 <!-- 버튼이후 -->
		 <div class="container" style = "max-width: 1050px; min-width:1050px; padding-left: 0px;padding-top: 20px;">
		  <section class='section' id='section1'>
        <h2>1 이동위치</h2>
   		 </section>
		 <!-- 상품설명 -->
		 <div class="row" style="overflow: hidden;">
		 <div class="col-12">
		 <c:forEach var="ProductDTO" items="${product2}">
		 	"${ ProductDTO.product_noti_img }"
		 </div>
		 <div class="row">
		 <h3>${ ProductDTO.sub_text }</h3>
		 <h3 style= "padding-bottom:30px;">${ ProductDTO.name }</h3><br />
		 <section class='section' id='section2'>
        <h2>2 이동위치</h2>
    </section>
		 <hr>
		 <p style="padiing-top:30px;">멜론은 촉촉한 식감과 입안에 감도는 단맛으로 그만의 매력을 톡톡히 발산하는 과일이죠. 
		 그중에서도 달콤한 맛과 향을 품은 머스캣멜론을 마켓그린에서 합리적인 가격으로 만나보세요. 
		 국내 농가에서 정성스레 재배해 묵직하게 잘 익은 머스크 멜론이랍니다. 
		 맛도 맛이지만 비타민c칼륨도 풍부하게 함유하고있어 꾸준히 즐겨찾는분들도 계시죠. 
		 과일 디저트는 물론이고 근사한 안주로 즐겨도 좋을 거예요. </p>
		 </div>
		 </div>
		 </c:forEach>
		 
		 <!-- 후기  -->
		 <div class="row">
		 <div class="col fontCommon_nomal" style="width:500px; height:300; display:flex; justify-content: space-around;">
		 <h3>후기</h3>
		 </div>
		 <br />
		 <!-- 문의 -->
		<section class='section' id='section3'>
        <h2>3 이동위치</h2>
    </section>
    <section class="notice"style="min-width:1050px; height:1000px; display:flex; justify-content: space-around;">
  <div class="page-title">
  <h3>상품 문의</h3>
        <div class="container"style="min-width:1050px; height:auto; display:flex; justify-content: flex-end;">

	<div class="row">
	<div class="col" style="display:flex;justify-content:flex-end;padding-bottom:10px;">
	<button type="button" class="btn btn-outline-success" data-bs-toggle="modal" data-bs-target="#exampleModal" >문의하기</button>
</div>
</div>

<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" data-bs-backdrop="static">
  <div class="modal-dialog modal-dialog-centered modal-dialog modal-dialog-scrollable modal-dialog modal-lg">>
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title texttop_01" id="exampleModalLabel">상품 문의하기</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <c:forEach var="ProductDTO" items="${product2}">
      <div class="modal-body">
        <div class="row"style="padding-bottom:5px;padding-top:5px;">
        <div class="col-3">
        <img src="${ ProductDTO.product_img}"style="width:100px; padding-bottom:10px;">
        </div>
        <div class="col-6">	
        <div class="col" style="font-size:20px;display:flex;align-items: center;height:100%;">
        ${ ProductDTO.name }
        </div>
        </div>
        </c:forEach>
		<div>
		<hr style="width:100%; margin: auto;">
		<form action="../test/ProductInfo.do" method="post" enctype="multpart/form-data"
		 onsubmit="return validateForm(this)"id="ModalWriteForm" accept-charset="utf-8";>	
		 <input type="hidden" name="product_id" id="product_id">
          <div class="form-group-mb-3">
            <label for="recipient-name" class="col-form-label">제목</label>
            <input type="text" class="form-control" name="inquery_title">
          </div>
          <div class="form-group-mb-3">
            <label for="message-text" class="col-form-label">내용</label>
            <textarea class="form-control" name="inquery_content" rows="4">메시지를 입력하시오.</textarea>
          </div>
        </form>
      </div>
      <div class="modal-footer"style="display:flex;justify-content:center;">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal"style="width:100px;height:40px;">취소</button>

         <button type="submit" class="btn btn-outline-success" form="ModalWriteForm" style="width:100px;height:40px;">등록</button>
      </div>
    </div>
  </div>	
</div>
</div>
</div></div>
<!-- board list area -->
    <div id="board-list">
        <div class="panel-faq-container"style="min-width: 1050px;height:auto; display:flex; justify-content: space-around;">
            <table class="board-table table">
            	    <thead>
            	    <tr>
                    <th scope="col" class="th-num">번호</th>
                    <th scope="col" class="th-title">제목</th>
                    <th scope="col" class="th-writer">이름</th>
                    <th scope="col" class="th-date">날짜</th>
                </tr>
                </thead>
                <c:forEach var="InqueryDTO" items="${board}">
                <tbody style="border:none;">
                 <tr class="board-row" data-target="#content${ InqueryDTO.inquery_id }"style="border:none;">
                    <td>${ InqueryDTO.inquery_id }</td>
                    	<th>
                      		<a href="#!">${ InqueryDTO.inquery_title }</a>
                     		<p>${ InqueryDTO.name }</p>
                    	</th>	
                    	<td>${ InqueryDTO.name }</td>
                    	<td>${ InqueryDTO.inquery_date }</td>
                     <tr id="content${ InqueryDTO.inquery_id }" class="hidden-content-row"style="width:150px;hegiht:300px;"> 
                        <td colspan="4"style="padding : 0px;border:none;">
                          <div class="hidden-content">
                            <div class="row" style="display:flex;font-size:15px;"> 
                             문의내용 :
                             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                             	${ InqueryDTO.inquery_content }
                              	
                             <div class="hideen-content2-row" data-target2="#content2%${ InqueryDTO.seller_content }"
                             style="display:flex;justify-content: flex-start;">
                             <br />
                             ${ InqueryDTO.seller_content }
                             </div> 
                           </div>
                           </div>
                     </td>
               	 </tr>
                </tbody>  
                
                </c:forEach>
            </table>   
      	  </div>	
     	 </table>
   	 </div> 
    </section>
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

        $('#submitFormButton').click(function() {
        	
            $('#ModalWriteForm').submit();
        });
        
        $('#exampleModal').on('shown.bs.modal', function (event) 
        {
            let productId = '<%= session.getAttribute("currentProductId") %>';
            document.getElementById('product_id').value = productId;
              	
            var button = event.relatedTarget;
            var modalTitle = this.querySelector('.modal-title');
            var modalBodyInput = this.querySelector('.modal-body input');
            modalTitle.textContent = '상품 문의하기';
        });
    });

    function validateForm(form) {
        if (form.inquery_title.value == "") {
        	alert("제목을 입력하세요.")
            form.inquery_title.focus();
            return false;
        }
        if (form.inquery_content.value == "") {
            alert("내용을 입력하세요.");
            form.inquery_content.focus();
            return false;
        }
        return true;
    };
    
    function count(type) {
        const resultElement = document.getElementById('result');
        let number = parseInt(resultElement.innerText);
        
        // 더하기/빼기 로직
        if (type === 'plus') {
            number += 1;
        } else if (type === 'minus' && number > 1) {  // 최소 수량 1 제한
            number -= 1;
        }

        // 결과 출력 (수량 업데이트)
        resultElement.innerText = number;

        //  업데이트
        updateTotalPrice(number);
    };
    
    // 총 상품 금액 업데이트 함수
    function updateTotalPrice(quantity) {
        // 기본 상품 가격을 사용하여 총 금액 계산
        const totalPriceElement = document.getElementById('totalPrice');
        const totalPrice = basePrice * quantity;

        // 결과 출력 (총 금액 업데이트)
        totalPriceElement.innerText = totalPrice.toLocaleString(); // 천 단위 콤마 추가
    };
    
    	document.getElementById('buyButton').addEventListener('click', function() {
    	    // 상품 ID와 사용자 ID, 수량 값을 설정
    	    
    	    var productId = document.getElementById('hiddenProductId').value;
    	    var userId = document.getElementById('hiddenUserId').value;
    	    var quantity = document.getElementById('result').innerText; // 현재 수량을 가져옴

    	    // 폼에 값을 설정
    	    document.getElementById('hiddenProductId').value = productId;
    	    document.getElementById('hiddenUserId').value = userId;
    	    document.getElementById('hiddenQuantity').value = quantity;
			
    	    if(productId == 'null') {
    			console.log("상품체크");
    		}			
    		else
    		{ 
    			console.log("상품있음 ");
    		}
    	    if(userId == 'null') {
    			console.log("유저체크");
    		}			
    		else
    		{ 
    			console.log("유저있음");
    		}if(quantity == 'null') {
    			console.log("수량체크");
    		}			
    		else
    		{ 
    			console.log("수량 있음");
    		}
    	    
    	    // 폼을 제출
    	    document.getElementById('buyForm').submit();
    	  });

    
		$('.board-row').on('click', function() {
			var target = $(this).data('target'); // Get the target content ID
			var $content = $(target).find('.hidden-content'); // Find the content to slide
			var $content2 = $(target).find('.hidden-content2'); 
			
			if ($content.is(':visible')) {
				$content.slideUp(); // Hide the content if it is visible
			} else {
				// Optionally: Close other open items if single open item behavior is needed
				$('.hidden-content').slideUp(); // Hide all other open contents

				// Show the clicked content
				$content.slideDown();
			}
		});	
		
		const button1 = document.getElementById('button1');
		const button2 = document.getElementById('button2');
		const button3 = document.getElementById('button3');
		button1.addEventListener('click', () => {
	        window.scrollBy({top: section1.getBoundingClientRect().top, behavior: 'smooth'});
	    });
		button2.addEventListener('click', () => {
	        window.scrollBy({top: section2.getBoundingClientRect().top, behavior: 'smooth'});
	    });
		button3.addEventListener('click', () => {
	        window.scrollBy({top: section3.getBoundingClientRect().top, behavior: 'smooth'});
	    });
		
		
</script>
	
	<script src="/resources/bootstrap/js/bootstrap.bundle.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
	 <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
</body>
</html>