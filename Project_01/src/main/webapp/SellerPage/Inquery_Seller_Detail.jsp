<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>SellerMain</title>
<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.css">
<jsp:include page="/Common/LinkFile.jsp"/>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
<link href="https://unpkg.com/tabulator-tables/dist/css/tabulator.min.css" rel="stylesheet">
<link href="/resources/css/tabulator_site.css" rel="stylesheet">

<link rel="stylesheet" href="/resources/css/MainPage.css">

<script src="/resources/bootstrap/js/jquery-3.7.1.js"></script>
<script src="/resources/bootstrap/js/jQueryRotate.js"></script>

<script type="text/javascript" src="https://unpkg.com/tabulator-tables/dist/js/tabulator.min.js"></script>
<style>
.tabulator.tabulator-header
{
	border-bottom: 1px solid #3FB449;	
}
.label_element
{
	margin_right: 10px;
	height: 70px;
	line-height: 4.5;
	
	min-width: 200px;
}
.label_title
{
	min-width: 110px;
	margin_right: 10px;
	height: 70px;
	line-height: 4.5;
}
</style>
</head>
<body>
<jsp:include page="/Common/Header.jsp"/>
<main>
<input id = "form_inquery_id" type = "hidden" value = <%= request.getParameter("order_id") %>>
<input id = "form_seller_id" type = "hidden" value = <%= request.getParameter("seller_id") %>>
<input id = "form_product_id" type = "hidden" value = <%= request.getParameter("product_id") %>>
<label id = "form_product_name" style = "display: none;"><%= request.getParameter("product_name") %></label>
<div class = "container" style = "max-width: 1050px; min-width: 1050px; padding-left: 0px; padding-right: 0px; padding-top: 40px;">
	<div class = "row" style = "border-bottom: 1px solid #efefef; padding-bottom: 20px;">
		<div class = "col-12" style="display: inline-flex;justify-content: center;">
			<label class = "sellerMainTitle">상세 문의 사항</label>
		</div>
	</div>
</div>
<div class = "container" style = "max-width: 1050px; min-width: 1050px; padding-left: 0px; padding-right: 0px; padding-top: 40px;">
	<div class = "row" style = "border-bottom: 1px solid #efefef; border-top: 1px solid #163020;">
		<div class = "col-12" style="display: inline-flex; justify-content: center; justify-content: flex-start;">
			<label class = "label_title fontCommon_Option">문의 제품 :</label>
			<label class = "label_element" id = "product_name" style = "margin-left: 20px;">문의 제품</label>
		</div>
	</div>
	<div class = "row" style = "border-bottom: 1px solid #efefef; border-top: 1px solid #163020;">
		<div class = "col-12" style="display: inline-flex; justify-content: center; justify-content: flex-start;">
			<label class = "label_title fontCommon_Option">문의 제목 :</label>
			<label class = "label_element" id = "inquery_title" style = "margin-left: 20px;">문의 제목</label>
		</div>
	</div>
	<div class = "row" style = "border-bottom: 1px solid #efefef; border-top: 1px solid #163020;">
		<div class = "col-12" style="display: inline-flex; justify-content: center; justify-content: flex-start;">
			<label class = "label_title fontCommon_Option">문의 내용 :</label>
			<label class = "label_element" id = "inquery_content" style = "margin-left: 20px; height: auto;">
			</label>
		</div>
	</div>
	<div class = "row" style = "border-bottom: 1px solid #efefef; border-top: 1px solid #163020;">
		<div class = "col-12" style="display: inline-flex; justify-content: center; justify-content: flex-start;">
			<label class = "label_title fontCommon_Option">문의 답변</label>
			<textarea class = "label_element form-control" 
				id = "seller_content" 
				style = "margin-left: 20px; margin-top:5px; margin-bottom: 5px; width:90%; min-height:150px; line-height: normal;"></textarea>
		</div>
	</div>
	
	<div class = "row" style = "padding-top: 30px;">
		<div class = "col-12" style="display: inline-flex;justify-content: center; justify-content: flex-end;">
			<div style = "margin-right : 10px; ">
				<button class = "btn btn-primary rounded-1" id = "updateBtn" type = "button" >답변작성</button>
				<button class = "btn btn-success rounded-1 " id = "returnBtn" type = "button">돌아가기</button>
			</div>
		</div>
	</div>
</div>


</main>
<jsp:include page="/Common/Footer.jsp"/>
<script src="/resources/bootstrap/js/bootstrap.bundle.js"></script>
</body>
<script type="text/javascript">
var table;
$(document).ready(function()
{	
	//1. data 가져오기
	$('#product_name').html($('#form_product_name').html());
	Get_InqueryData();
	
	//2. 데이터 쏴주기
	$('#updateBtn').click(function()
	{		
		Set_SellerContent();
	});
	
	//3. 후처리
	
});

function Set_SellerContent()
{
	var id = $('#form_inquery_id').val();	
	var conent = $('#seller_content').val();
	var data = 
	{
		inquery_id : id,
		seller_content : conent
	};
	var url = "http://localhost:8080/SellerController/Set_SellerContent"; 
	
	$.ajax({
		type:"post",
        url:url,
        contentType: 'application/json',
        data: JSON.stringify(data),		       
        success: function(response) 
        {
        	console.log(response);
        	//response.intData_00;
        	if(response.intData_00 == 1)
        	{
        		swal({
  				  title: "답변이 등록되었습니다.",		
  				  //text : "asdsad",
  				  icon: "success", //"success"
  				  button: "확인",
  					}).then((value) => {
  					location.replace("/SellerPage/Inquery_Seller.jsp");
  				});	
        	}
        	else
        	{
        		swal({
    				  title: "처리 실패하였습니다.",		
    				  //text : "asdsad",
    				  icon: "error", //"success"
    				  button: "확인",
    					}).then((value) => {
    					location.replace("/SellerPage/Inquery_Seller.jsp");
    				});	
        	}
        },
        error : function(request,status,error){
            alert('code:'+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); //에러 상태에 대한 세부사항 출력
            alert(e);
        }
	});
}


function Get_InqueryData()
{
	var id = $('#form_inquery_id').val();	
	var data = 
	{
		inquery_id : id
	};
	var url = "http://localhost:8080/SellerController/Get_InqueryData"; 
	
	$.ajax({
		type:"post",
        url:url,
        contentType: 'application/json',
        data: JSON.stringify(data),		       
        success: function(response) 
        {
        	$('#inquery_title').html(response.inquery_title);
        	$('#inquery_content').html(response.inquery_content);
        	
        },
        error : function(request,status,error){
            alert('code:'+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); //에러 상태에 대한 세부사항 출력
            alert(e);
        }
	});
	
	
}
</script>
</html>