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
<input id = "form_order_id" type = "hidden" value = <%= request.getParameter("order_id") %>>
<input id = "form_product_cnt" type = "hidden" value = <%= request.getParameter("product_cnt") %>>
<input id = "form_product_id" type = "hidden" value = <%= request.getParameter("product_id") %>>
<label id = "form_product_name" style = "display: none;"><%= request.getParameter("product_name") %></label>
<label id = "form_order_state" style = "display: none;"><%= request.getParameter("order_state") %></label>
<div class = "container" style = "max-width: 1050px; min-width: 1050px; padding-left: 0px; padding-right: 0px; padding-top: 40px;">
	<div class = "row" style = "border-bottom: 1px solid #efefef; padding-bottom: 20px;">
		<div class = "col-12" style="display: inline-flex;justify-content: center;">
			<label class = "sellerMainTitle">주문 내용</label>
		</div>
	</div>
</div>
<div class = "container" style = "max-width: 1050px; min-width: 1050px; padding-left: 0px; padding-right: 0px; padding-top: 40px;">
	<div class = "row" style = "border-bottom: 1px solid #efefef; border-top: 1px solid #163020;">
		<div class = "col-12" style="display: inline-flex; justify-content: center; justify-content: flex-start;">
			<label class = "label_title fontCommon_Option">구매 제품 :</label>
			<label class = "label_element" id = "product_name" style = "margin-left: 20px;">문의 제품</label>
		</div>
	</div>
	<div class = "row" style = "border-bottom: 1px solid #efefef; border-top: 1px solid #163020;">
		<div class = "col-12" style="display: inline-flex; justify-content: center; justify-content: flex-start;">
			<label class = "label_title fontCommon_Option">구매 수량 :</label>
			<label class = "label_element" id = "product_cnt" style = "margin-left: 20px;">문의 제목</label>
		</div>
	</div>
	<div class = "row" style = "border-bottom: 1px solid #efefef; border-top: 1px solid #163020;">
		<div class = "col-12" style="display: inline-flex; justify-content: center; justify-content: flex-start;">
			<label class = "label_title fontCommon_Option">주문 상태 :</label>
			<label class = "label_element" id = "order_state" style = "margin-left: 20px; height: auto;">
			</label>
		</div>
	</div>
	<div class = "row" style = "border-bottom: 1px solid #efefef; border-top: 1px solid #163020;">
		<div class = "col-12" style="display: inline-flex; justify-content: center; justify-content: flex-start;">
			<label class = "label_title fontCommon_Option">환불 사유</label>
			<textarea class = "label_element form-control" 
				id = "refund_content" 
				style = "margin-left: 20px; margin-top:5px; margin-bottom: 5px; width:90%; min-height:150px; line-height: normal;"></textarea>
		</div>
	</div>
	
	<div class = "row" style = "padding-top: 30px;">
		<div class = "col-12" style="display: inline-flex;justify-content: center; justify-content: flex-end;">
			<div style = "margin-right : 10px; ">
				<button class = "btn btn-primary rounded-1" id = "updateBtn" type = "button" >환불신청</button>
				<button class = "btn btn-success rounded-1 " id = "returnBtn" type = "button">돌아가기</button>
			</div>
		</div>
	</div>
</div>
</main>
<input id = "refund_date" type = "hidden" value = ""/>
<jsp:include page="/Common/Footer.jsp"/>
<script src="/resources/bootstrap/js/bootstrap.bundle.js"></script>
<script>
$(document).ready(function()
{	
	$('#product_name').html($('#form_product_name').html());	
	$('#product_cnt').html($('#form_product_cnt').val());
	$('#order_state').html($('#form_order_state').html());
	
	
	
	
	
	//order id 를 통해서 refund 데이터를 가져온다.
	//refund 데이터가 만약에 없다 = 정상 구매 상태이다.
	//refund 데이터가 있다 = 환불요청 및 환불거절, 환불완료 상태이다.
	
	//만약 환불요청 일때는 환불 취소가 활성화
	//만약 환불완료 상태일때는 활성화 없음
	//만약 환불거절 상태일때는? update 문으로 다시 환불 신청
	//만약 정상구매상태일때는 inset 문으로 환불 신청 활성화
	
	//데이터를 가져와야하는 경우 = 구매완료 제외 전부 -> 구매 완료는 refund 가 없다.
	
	Get_OrderInfoData();	
});

function Get_OrderInfoData()
{
	var data = 
	{
		intData_00 : $('#form_order_id').val()
	};
	
	var result;
	
	var url = url_server + "/SellerController/Get_OrderDetail.func";
	$.ajax({
		type:"post",
        url:url,
        contentType: 'application/json',
        data: JSON.stringify(data),		       
        success: function(response) 
        {   
        	Set_PageEelement(response);
        },
        error : function(request,status,error){
            alert('code:'+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); //에러 상태에 대한 세부사항 출력
            alert(e);
        }
	});
}

function Set_PageEelement(data)
{
	$('#refund_content').val(data.refund_reason);
	$('#refund_date').val(data.refund_date);
	
	console.log('Set_PageEelement');
	//만약 환불완료 상태일때는 활성화 없음
	if($('#form_order_state').html() == '환불승인' || 
		$('#form_order_state').html() == '환불신청' )
	{
		$('#refund_content').prop('readonly', true);
		$('#refund_content').prop('disabled', true);
		$('#updateBtn').css('display','none');
	}
	//만약 환불거절 상태일때는? update 문으로 다시 환불 신청 버튼 활성화
	else if($('#form_order_state').html() == '환불거절')
	{
		Set_RefundClickEvent('');
	}
	else if($('#form_order_state').html() == '구매완료')
	{
		Set_RefundClickEvent('');
	}
}

function Set_RefundClickEvent(url)
{
	var data = 
	{
			
		//여기 작업중
		order_id : $('#form_order_id').val(),
		refund_reason : $('#refund_content').val(),
		refund_date : $('#refund_date').val(),
		refund_state : $('#order_state').html()
	};	
	
	//해야할 일
	//데이터 설정 되었으니 ajax 로 보내서 처리
	//stat 에 따라서 분기 만들기
	
	
	
	$('#updateBtn').click(function()
	{
		$.ajax({
			type:"post",
	        url:url,
	        contentType: 'application/json',
	        data: JSON.stringify(data),		       
	        success: function(response) 
	        {        	
	        	Set_PageEelement(response);
	        },
	        error : function(request,status,error){
	            alert('code:'+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); //에러 상태에 대한 세부사항 출력
	            alert(e);
	        }
		});
	});
}


</script>
</body>
</html>