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
    // currentProductId를 사용하여 필요한 처리를 수행합니다.
    // DAO 호출 및 데이터 처리 등
    
} else {
    // 세션에서 currentProductId가 없는 경우의 처리
    // 예: 다시 메인 페이지로 이동하거나 오류 메시지 표시 등
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
					<sapn style="color:red;">${ ProductDTO.price_percent }% </sapn>${ ProductDTO.price_discount}<sapn style="font-weight:500";>원</sapn>
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
			<div class= "row">
				<div class = "col-md-12 fontCommon_nomal">
					<button type="button" class="btn btn-success">쿠폰</button>
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
					${ ProductDTO.seller }
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
					${ ProductDTO.notifi } <br />
					
					상품특성상 3%내외의 중량차이가 있을 수 있습니다.<br/>
					신선식품 특성상 원물마다 크기 및 형태가 일정하지 않을 수 있습니다.
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
			<!-- <input type="text" class="button_style2" name="amounts" value="1"min="0"> -->
			<label class="fontCommon_nomal2" id='result' min="0">1</label>
			<input type='button' class="button_style2" onclick='count("plus")'value='+'style="min-width: 25px;height: auto;border-radius: 3px;">
			</div>
			</div>
			</div>
			<div class= "row">
				<div class = "col-md-12 fontgray right" style="display:inline-flex;align-items: center;">
				총 상품 금액:<label style="font-weight:bold;font-size:25px">${ ProductDTO.price_discount }</label>원</div>
			</c:forEach>
			</div>
			<div class="row">
				<div class= "col -4"style= "padding-bottom: 50px;">
				<button type="button" class="btn btn-success buy_button">장바구니 담기</button>
			</div>
			</div>
		 </div>
		 </div>
		 </div>
		 <div class="container" style = "max-width: 1050px; min-width:1050px; padding-left: 0px;position: sticky;top: 0px;z-index: 10;height:40px;">
		 <div class="row">
		 		<div class= "col-4">
				<button type="button" class="btn btn-outline-success button_style">상품설명</button>
				</div>
				<div class= "col-4">
				<button type="button" class="btn btn-outline-success button_style">후기</button>
				</div>
				<div class= "col-4">
				<button type="button" class="btn btn-outline-success button_style">문의</button>
				</div>
				
			</div>
		 </div>
		 <!-- 버튼이후 -->
		 <div class="container" style = "max-width: 1050px; min-width:1050px; padding-left: 0px;padding-top: 20px;">
		 <!-- 상품설명 -->
		 <div class="row" style="overflow: hidden;">
		 <div class="col-12">
		 <c:forEach var="ProductDTO" items="${product2}">
		 	<img src = "${ ProductDTO.product_noti_img }" style = "width: 1000px; height: 400; border-radius: 2%;z-index: 5;padding-bottom:30px;"/>
		 </div>
		 
		 <div class="row">
		 <h3>${ ProductDTO.sub_text }</h3>
		 <h3 style= "padding-bottom:30px;">${ ProductDTO.name }</h3><br />
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
        <img src=${ ProductDTO.product_img}style="width:100px; padding-bottom:10px;">
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
        <!-- <button type="submit" class="btn btn-outline-success" id="submitFormButton" style="width:100px; height:40px;" onclick="submitForm()">등록</button> -->
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
                     		<p>${ InqueryDTO.user_id }</p>
                    	</th>	
                    	<td>${ InqueryDTO.user_id }</td>
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
/* 	document.getElementById('idxForm').submit(); */
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
    }
		function count(type)  {
		  // 결과를 표시할 element
		  const resultElement = document.getElementById('result');
		  // 현재 화면에 표시된 값
		  let number = resultElement.innerText;
		 
		  // 더하기/빼기
		  if(type === 'plus') {
		    number = parseInt(number) + 1;

		  }else if(type === 'minus' && number!=1)  {
		    number = parseInt(number) - 1;
		  }
		  // 결과 출력
		  resultElement.innerText = number;
		}
		$('.board-row').on('click', function() {
			var target = $(this).data('target'); // Get the target content ID
			var $content = $(target).find('.hidden-content'); // Find the content to slide
			var target2 = $(this).data('target2');
			var $content2 = $(target).find('.hidden-content2'); 
			if ($content2.is(null)) {
				$content2.hidden();
			}
			else {
				
			}
			if ($content.is(':visible')) {
				$content.slideUp(); // Hide the content if it is visible
			} else {
				// Optionally: Close other open items if single open item behavior is needed
				$('.hidden-content').slideUp(); // Hide all other open contents

				// Show the clicked content
				$content.slideDown();
			}
		});	
		
</script>
	
	<script src="/resources/bootstrap/js/bootstrap.bundle.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
	 <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
</body>
</html>