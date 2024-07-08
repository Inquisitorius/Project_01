<%@page import="java.util.List"%>
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
	border-top: 1px solid black;
}

hr {
	border: 1px solid gray;
}	
.pagination {
    display: flex;
    justify-content: center;
    margin-top: 20px;
    
}
.pagination a {
    margin: 0 5px;
    padding: 10px 15px;
    text-decoration: none;
    color: #108c0d;
    border: 1px solid #108c0d;
    border-radius: 4px;
    font-size: 15px;
}
.pagination a.active {
    background-color: #108c0d;
    color: white;
    border-color: #108c0d;
}
.pagination a:hover {
    background-color: #108c0d;
    color: white;
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
					<sapn style="color:red;">
					<fmt:formatNumber type="Number" maxFractionDigits="3" value="${ ProductDTO.price_percent }"/>
					%</sapn>
					<fmt:formatNumber type="Number" maxFractionDigits="3" value="${ ProductDTO.price_discount}"/>
					<sapn style="font-weight:500";>원</sapn>
				</div>
			</div>	
			<div class= "row">
				<div class = "col-md-12 font_line" style="padding-bottom:10px;">
					<fmt:formatNumber type="Number" maxFractionDigits="3" value="${ProductDTO.price_ori}" />
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
				총 상품 금액:<label id="totalPrice" style="font-weight:bold;font-size:25px;">
				<fmt:formatNumber type="Number" maxFractionDigits="3" value="${ ProductDTO.price_discount }" />
				</label>원</div>
					</div>
				<script>
 				 const basePrice = ${ ProductDTO.price_discount };
				</script>	
			</c:forEach>
			<div class="row">
				<div class= "col -4"style= "padding-bottom: 50px;display: flex;justify-content: flex-end;">
				<button type="button" class="btn btn-success" id="buyButton" style="width:350px; height:50px;font-size:20px;font-weight: bold";>구매하기</button>

			<!-- 폼 Hidden  -->
				<form id="buyForm" action="/test/Buypage.do" method="GET">
  				<input type="hidden" name="product_id" id="hiddenProductId" value="<%= currentProductId %>">
  				<input type="hidden" name="idx" id="hiddenUserId" value="<%= UserIDX %>">
  				<input type="hidden" name="quantity" id="hiddenQuantity" value="1">
				<input type="hidden" name="price" id= "hiddenPrice" value =<%= session.getAttribute("price") %>">
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
				<button type="button" id='button2'class="btn btn-outline-success button_style">상세정보</button>
				</div>
				<div class= "col-4">
				<button type="button" id='button3'class="btn btn-outline-success button_style">문의</button>
				</div>
			</div>
		 </div>
		 <!-- 버튼이후 -->
		 <div class="container" style = "max-width: 1050px; min-width:1050px; padding-left: 0px;padding-top: 20px;">
		  <section class='section' id='section1'>
        <h2></h2>
   		 </section>
		 <!-- 상품설명 -->
		 <div class="row" style="overflow: hidden;">
		 <div class="col-12">
		 <c:forEach var="ProductDTO" items="${product2}">
		 	${ ProductDTO.product_noti_img }
		 </div>
		 <div class="row">
		 <h3>${ ProductDTO.sub_text }</h3>
		 <h3 style= "padding-bottom:30px;">${ ProductDTO.name }</h3><br />
		 <section class='section' id='section2'>
         <h2></h2>
  		 </section>
		 <hr>
		
		 </div>
		 </div>
		 </c:forEach>
		 
		 <!-- 후기  -->
		<div class="row d-flex flex-nowrap">
		 <div class="row">
		 <div class="col fontCommon_nomal" style="width:500px; height:300; display:flex; justify-content: space-around;">
		 <h2>상세정보</h2>
		 </div>
		 <div class="row">
		 <div class="col" style="font-size:26px;color: black;font-weight:400;justify-content:flex-start;padding-bottom:30px;">
		 고객행복센터
		 </div>
		 </div>
		 
		 <div class="row" style="padding-bottom:15px";>
		 <div class="col">
		 <strong>궁금하신 점이나 서비스 이용에 불편한 점이 있으신가요?</strong>
		 </div>
		 </div>
		 
		 <div class="row"style="padding-bottom:15px";>
		 <div class="col-3">
		 <span style="color:#108c0d";><strong>환불 및 취소안내</strong></span> 
		 </div> 
		 <div class="col-9">
		 환불 및 취소가 필요하신 경우 마이페이지에서 구매 상품 확인 페이지를 통해서 문의해주세요.
		 </div>
		 <hr style="margin-bottom:10px;margin-top:10px;">
		 </div>
		 
		 
		 <div class="row" style="padding-bottom:10px;">
		 <div class="col-4">
		 <strong>01. 상품에 문제가 있는 경우</strong> 
		 </div>
		 <div class="col-6">
		 받으신 상품에 표시 내용이 다른경우에 상품을 받은날 3개월 이내에, 사실을 알게 된 날부터 30일 이내에 교환 및 환불을 요청하실수 있습니다.
		 </div>
		 <hr style="margin-bottom:10px;margin-top:10px;">
		 </div>
		 
		 <div class="row" style="padding-bottom:10px;">
		 <div class="col-4">
		 <strong>02. 단순 변심, 주문 착오의 경우</strong>
		 </div>
		 <div class="col-6">
		 식품 베이커리 등은 상품의 특성상 재판매가 
		 불가하여 단순 변심, 주문 착오, 주소 오입력 등 고객의 책임 사유로 인한 교환 및 환불가 어려운 점 양해 부탁드립니다.
		 상품에 따라 조금씩 맛이 다를 수 있으며, 개인의 기호에 따라 같은 상품도 다르게 느낄 수 있습니다.<br>
		 <span>유통 기한 30일 이상 식품  상품을 받은 날부터 7일이내에 환불 및 취소가 가능합니다. 아래 문의사항을 통해 판매자와 소통할수있습니다.
		 </span>
		 </div>
		 <hr style="margin-bottom:10px;margin-top:10px;">
		 </div>
		 
		 <div class="row">
		 <div class="col-4">
		 <strong>03. 환불, 취소가 불가한 경우</strong>
		 </div>
		 <div class="col-6">
		 다음에 해당하는 환불및 취소 신청은 처리가 어려울 수 있으니 양해 부탁드립니다.<br />
		 ● 고객님의 책임 있는 사유로 상품이 훼손된경우<br />
		 ● 고객님의 사용 또는 일부 소비로 상품의 가치가 감소한 경우<br />
		 ● 시간이 지나 다시 판매하기 곤란할 정도로 상품의 가치가 감소한 경우
		 </div>
		 <hr style="margin-bottom:10px;margin-top:10px;">
		 </div>
		 
		 <div class="row">
		 <div class="col-4">
		 <span style="color:#108c0d";><strong>배송관련 안내</strong></span>
		 </div>
		 
		 <div class="col-6">
		  배송 과정 중 기상 악화 및 교통 상황에 따라 부득이하게 지연 배송이 발생될 수 있습니다.
		 </div>
		 </div>
		 <hr style="margin-bottom:10px;margin-top:10px;">
		 </div>
		 </div>
		 <div class="row" style="padding-bottom:15px";>
		 <div class="col">
		 <strong>* 문제가 되는 부분이나 궁금하신점을 아래 상품 문의하기를 통해서 글을 작성해주시면 빠르게 도와드리겠습니다.</strong>
		 </div>
		 </div>
		 <br />
		 <!-- 문의 -->
		<section class='section' id='section3'>
        <h2></h2>
    </section>
    <hr>
    <section class="notice"style="min-width:1050px; height:1000px; display:flex; justify-content: space-around;">
  <div class="page-title fontCommon_nomal">
  <h2 style="font-size: 28px;color: #333333;font-weight: 400;text-align: center;">상품 문의</h3>
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
                <c:forEach var="InqueryDTO" items="${newlist}">
                <tbody style="border:none;">
                 <tr class="board-row" data-target="#content${ InqueryDTO.inquery_id }"style="border:none;">
                    <td>${ InqueryDTO.inquery_id }</td>
                    	<th>
                      		<a href="#!">${ InqueryDTO.inquery_title }</a>
                     		<p>${ InqueryDTO.name }</p>
                    	</th>	
                    	<td>${ InqueryDTO.name }</td>
                    	<td>${ InqueryDTO.inquery_date }</td>
                     <tr id="content${ InqueryDTO.inquery_id }" class="hidden-content-row"style="width:150px;hegiht:200px;"> 
                     <!-- 문의글  -->
                        <td colspan="4"style="padding : 0px;border:none;">
                          <div class="hidden-content">
                            <div class="row" style="display:flex;font-size:15px;"> 
                             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;문의내용 :
                             &nbsp;&nbsp;
                             	${ InqueryDTO.inquery_content }
                              	
                              <c:if test="${not empty InqueryDTO.seller_content}">
                   		 <div class="hidden-content2" data-target2="#content2${InqueryDTO.seller_content}"
                  		  style="display:flex;justify-content: flex-start;">
                    	<br />
                       &nbsp;&nbsp;&nbsp;답변내용 :
                       &nbsp;&nbsp;  
                       ${InqueryDTO.seller_content}
                    </div>
                </c:if>
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
   	 <div class="pagination"style="display:flex;justify-content: center;">
        <c:forEach var="i" begin="1" end="${totalPages}">
            <a href="ProductInfo.do?page=${i}&product_id=${product_id}#content"
            onclick="saveScrollPosition();" 
            class="${i == currentPage ? 'active' : ''}">${i}</a>
        </c:forEach>
    </div>
</main> 
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
       
        document.getElementById('hiddenPrice').value = totalPrice;
    }
    
    	document.getElementById('buyButton').addEventListener('click', function() {
    	    // 상품 ID와 사용자 ID, 수량 값을 설정
    	    
    	    var productId = document.getElementById('hiddenProductId').value;
    	    var userId = document.getElementById('hiddenUserId').value;
    	    var quantity = document.getElementById('result').innerText; // 현재 수량을 가져옴
    	    var totalPrice = document.getElementById('totalPrice').innerText.replace(/,/g, '');
    	    // 폼에 값을 설정
    	    document.getElementById('hiddenProductId').value = productId;
    	    document.getElementById('hiddenUserId').value = userId;
    	    document.getElementById('hiddenQuantity').value = quantity;
    	    document.getElementById('hiddenPrice').value = totalPrice;
			
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
    		if(totalPrice == 'null') {
    			console.log("가격체크");
    		}			
    		else
    		{ 
    			console.log("가격 있음");
    			console.log("총 금액: " + document.getElementById('hiddenPrice').value);
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
		// 스크롤 lock
		 function saveScrollPosition() {
	            localStorage.setItem('scrollPosition', window.scrollY);
	        }

	        // 페이지 로드 시 스크롤 위치를 복원하는 함수
	        function restoreScrollPosition() {
	            const scrollPosition = localStorage.getItem('scrollPosition');
	            if (scrollPosition) {
	                window.scrollTo(0, scrollPosition);
	                localStorage.removeItem('scrollPosition'); // 한 번 사용 후 제거하여, 다음 로드 때 영향을 주지 않음
	            }
	        }

	        // 페이지 로드 시 스크롤 위치 복원
	        window.onload = function() {
	            restoreScrollPosition();
	        };
</script>
	
	<script src="/resources/bootstrap/js/bootstrap.bundle.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
	 <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
</body>
</html>