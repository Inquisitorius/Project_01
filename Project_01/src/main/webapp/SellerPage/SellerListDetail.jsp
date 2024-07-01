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
<script type="text/javascript" src="https://unpkg.com/tabulator-tables/dist/js/tabulator.min.js"></script>
<style>
.tabulator.tabulator-header
{
	border-bottom: 1px solid #3FB449;	
}
.tabulator-tableholder 
{
	border-right: 1px solid #f5f0f5;
	border-left: 1px solid #f5f0f5;
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
<input id = "seller_id" type = "hidden" value = <%= request.getParameter("order_id") %>>
<main>
	<div class = "container" style = "max-width: 1050px; min-width: 1050px; padding-left: 0px; padding-right: 0px; padding-top: 40px;">
		<div class = "row" style = "border-bottom: 1px solid #efefef; padding-bottom: 20px;">
			<div class = "col-12" style="display: inline-flex;justify-content: center;">
				<label class = "sellerMainTitle">환불 상세 내역</label>
			</div>
		</div>
	</div>
	<div class = "container" style = "max-width: 1050px; min-width: 1050px; padding-left: 0px; padding-right: 0px; padding-top: 40px;">
		<div class = "row" style = "border-bottom: 1px solid #efefef; border-top: 1px solid #163020;">
			<div class = "col-12" style="display: inline-flex; justify-content: center; justify-content: flex-start;">
				<div style = "margin-right : 10px;">
					<label class = "label_title fontCommon_Option">주문 번호 :</label>
					<label class = "label_element" id = "order_id" style = "margin-left: 20px;">order_id</label>
				</div>
				<div style = "margin-right : 10px;">
					<label class = "label_title fontCommon_Option" >환불 번호 :</label>
					<label class = "label_element" id = "refund_id" style = "margin-left: 20px;">refund_id</label>
				</div>
			</div>
		</div>
		<div class = "row" style = "border-bottom: 1px solid #efefef;">
			<div class = "col-12" style="display: inline-flex;justify-content: center; justify-content: flex-start;">
				<div style = "margin-right : 10px;">										
					<label class = "label_title fontCommon_Option">환불 요청시간 :</label>
					<label class = "label_element" id = "refund_date" style = "margin-left: 20px;">refund_date</label>
				</div>
				<div style = "margin-right : 10px;">				
					<label class = "label_title fontCommon_Option">환불 요청상태 :</label>
					<label class = "label_element" id = "refund_state" style = "margin-left: 20px;">refund_state</label>
				</div>
			</div>
		</div>
		<div class = "row" style = "border-bottom: 1px solid #efefef;">
			<div class = "col-12" style="display: inline-flex;justify-content: center; justify-content: flex-start;">
				<div style = "margin-right : 10px;">
					<label class = "label_title fontCommon_Option">환불 신청내용</label>
				</div>
			</div>
		</div>
		<div class = "row" style = "border-bottom: 1px solid #efefef;">
			<div class = "col-12" style="display: inline-flex;justify-content: center; justify-content: flex-start;">
				<div style = "margin-right : 10px;">
					<label id = "refund_reason" class = "label_title fontCommon_Option"></label>
				</div>
			</div>
		</div>
		<div class = "row" style = "padding-top: 30px;">
			<div class = "col-12" style="display: inline-flex;justify-content: center; justify-content: flex-end;">
				<div style = "margin-right : 10px; ">
					<button class = "btn btn-primary rounded-1" id = "updateBtn" type = "button" >환불승인</button>
					<button class = "btn btn-secondary rounded-1" id = "cancelBtn" type = "button">환불거절</button>
					<button class = "btn btn-success rounded-1 " id = "returnBtn" type = "button">돌아가기</button>
				</div>
			</div>
		</div>
	</div>
</main>
<jsp:include page="/Common/Footer.jsp"/>
</body>
<script src="/resources/bootstrap/js/bootstrap.bundle.js"></script>
<script>

$(document).ready(function()
{
	DetailDataLoasd();	
	
	$('#returnBtn').click(function()
	{		
		location.replace("/SellerPage/OrderListPage.jsp");
	});
	
	$('#updateBtn').click(function()
	{
		Refund_Progress('환불승인');
	});
	
	$('#cancelBtn').click(function()
	{
		Refund_Progress('환불거절');
	});
});

function DetailDataLoasd()
{
	var data = 
	{
		seller_id : $('#seller_id').val()
	};
	
	var result;
	
	var url = "http://localhost:8080/SellerController/RefundDetail.func";
	$.ajax({
		type:"post",
        url:url,
        contentType: 'application/json',
        data: JSON.stringify(data),		       
        success: function(response) 
        {
        	//여기서 테이블 초기화
        	PageDataInsert(response);
        },
        error : function(request,status,error){
            alert('code:'+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); //에러 상태에 대한 세부사항 출력
            alert(e);
        }
	});
}

function Refund_Progress(flag)
{
	var data = 
	{
		refund_id : $('#refund_id').html(),
		refund_state : flag,
		order_id : $('#order_id').html()
	};
	
	console.log(data);
	var result;
	
	var url = "http://localhost:8080/SellerController/RefundUpdate.func";
	$.ajax({
		type:"post",
        url:url,
        contentType: 'application/json',
        data: JSON.stringify(data),		       
        success: function(response) 
        {
        	swal({
				  title: "처리가 완료되었습니다.",		
				  //text : "asdsad",
				  icon: "success", //"success"
				  button: "확인",
				}).then((value) => {
					location.replace("/SellerPage/OrderListPage.jsp");
			});		
        },
        error : function(request,status,error){
            alert('code:'+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); //에러 상태에 대한 세부사항 출력
            alert(e);
        }
	});
}

function PageDataInsert(data)
{      
	$('#order_id').html(data.order_id);
	$('#refund_id').html(data.refund_id);
	$('#refund_date').html(data.refund_date);
	$('#refund_state').html(data.refund_state);
	$('#refund_reason').html(data.refund_reason);
	console.log(data);
}

</script>
</html>