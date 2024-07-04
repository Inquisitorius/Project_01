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
	/*background-color: #3f3f3f; /* 원하는 배경 색으로 변경 */
}
</style>
</head>
<body>
<jsp:include page="/Common/Header.jsp"/>
<main>
<div class = "container" style = "max-width: 1050px; min-width: 1050px; padding-left: 0px; padding-right: 0px; padding-top: 40px;">
	<div class = "row" style = "border-bottom: 1px solid #efefef; padding-bottom: 20px;">
		<div class = "col-12" style="display: inline-flex;justify-content: center;">
			<label class = "sellerMainTitle">환불 요청 내역</label>
		</div>
	</div>
</div>
<div class = "container" style = "max-width: 1050px; min-width: 1050px; padding-left: 0px; padding-right: 0px; padding-top: 40px;">
	<div class= "row d-flex flex-nowrap" style = "justify-content: space-between; padding-bottom: 10px; min-height: 200px;">
		<div class = "col-12">
			<div id="example-table" style = "border-bottom: 4px solid #163020;"></div>
		</div>
	</div>
	<div class = "row" style = "padding-top: 0px;">
		<div class = "col-12" style="display: inline-flex;justify-content: center; justify-content: flex-end;">
			<div style = "margin-right : 10px; ">				
				<button class = "btn btn-success rounded-1 " id = "returnBtn" type = "button">돌아가기</button>
			</div>
		</div>
	</div>
</div>
<div style = "display: none;">
	<form id = "dataForm" name="data" method="post" action = "/SellerPage/SellerListDetail.jsp">
		<input id = "form_order_id" type="hidden" name ="order_id" value="">
		<input id = "form_name" type="hidden" name ="name" value="">
	</form>
</div>
</main>
<jsp:include page="/Common/Footer.jsp"/>
<script src="/resources/bootstrap/js/bootstrap.bundle.js"></script>
<script type="text/javascript">
$(document).ready(function()
{
	$('#returnBtn').click(function()
	{
		location.replace("/SellerPage/SellerMainPage.jsp");
	});
	
	
	var table = tabulatorInit();		
});


function get_SellerListData()
{
	//seller id 필요
	var id = 2;
	
	var data = 
	{
		seller_id : id
	};
	
	var result;
	
	var url = url_server + "/SellerController/sellerRefundList.func";
	$.ajax({
		type:"post",
        url:url,
        contentType: 'application/json',
        data: JSON.stringify(data),		       
        success: function(response) 
        {
        	//여기서 테이블 초기화
        	GridInit(response);
        },
        error : function(request,status,error){
            alert('code:'+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); //에러 상태에 대한 세부사항 출력
            alert(e);
        }
	});
	
	return result;
}

function tabulatorInit()
{
	var table = new Tabulator("#example-table", {
	    height:"430px",
	    layout: "fitColumns",
	    pagination: "local",          // 로컬 페이징 사용
	    paginationSize: 10,           // 페이지당 행 수
	    paginationSizeSelector: [5, 10, 20, 50], // 선택 가능한 페이지당 행 수
	    ajaxURL: "/SellerController/orderListTableData.func", // 데이터 로드할 URL
	    ajaxParams: { 
	        seller: 2
	    },
	    ajaxConfig: {
	        method: "GET"
	    },
	    columns:
	    [
		    {title:"주문번호", field:"order_id", sorter:"number"},
		    {title:"상품명", field:"name"},
		    {title:"상품수량", field:"product_cnt", hozAlign:"center"},		    
		    {title:"신청일자", field:"order_date", hozAlign:"center"},
		    {title:"지연상태", field:"rating", formatter:"traffic", hozAlign:"center", formatterParams:{ min:0,max:10,color:["green", "orange", "red"] }},	
	    ],
	    layout:"fitColumns"
	});
	    
	table.on("rowClick", function(e,row){
			//페이지 이동 처리 
		   console.log(row.getData());
			
		   	$('#form_order_id').val(row.getData().order_id);
	   		$("#form_name").val(row.getData().name);
			
		   $('#dataForm').submit();
		   //pageContext.forward("/SellerPage/SellerMainPage.jsp");
	    });
	    
	    return table;
}

function GridInit(list)
{
	var data_save = [];
	
	list.forEach((dto, index) => 
	{
		var nowDate = new Date();
		var oldDate = new Date(dto.order_date);
		
		var differenceInMillis = nowDate - oldDate; //ms
		var differenceInDays = Math.floor(differenceInMillis / (1000 * 60 * 60 *24)); //일단위 변환
		
		data_save.push({id:1, order_id:dto.order_id, name:dto.name, product_cnt : dto.product_cnt , rating: differenceInDays, order_date:dto.order_date });
	});
	
	
	var table = new Tabulator("#example-table", {
	    height:"430px",
	    layout: "fitColumns",
	    pagination: "local",          // 로컬 페이징 사용
	    paginationSize: 10,           // 페이지당 행 수
	    paginationSizeSelector: [5, 10, 20, 50], // 선택 가능한 페이지당 행 수
	    columns:
	    [
		    {title:"주문번호", field:"order_id", sorter:"number"},
		    {title:"상품명", field:"name"},
		    {title:"상품수량", field:"product_cnt", hozAlign:"center"},		    
		    {title:"신청일자", field:"order_date", hozAlign:"center"},
		    {title:"지연상태", field:"rating", formatter:"traffic", hozAlign:"center", formatterParams:{ min:0,max:10,color:["green", "orange", "red"] }},	
	    ],
	    layout:"fitColumns",
	    data: data_save,
	    placeholder:"No Data Set"
	    /*[
	    	{id:1, order_id:list[0].order_id, name:list[0].name, product_cnt : "12", rating:"10", order_date: get_DateFormat_MD_HHMMSS(new Date())},
	    	{id:2, order_id:"11234", name:"[한정]조니실버핸드 800ml", product_cnt : "12", rating:"8", order_date: get_DateFormat_MD_HHMMSS(new Date())},
	    	{id:3, order_id:"11234", name:"[한정]조니실버핸드 800ml", product_cnt : "12", rating:"6", order_date: get_DateFormat_MD_HHMMSS(new Date())},
	    	{id:4, order_id:"11234", name:"[한정]조니실버핸드 800ml", product_cnt : "12", rating:"4", order_date: get_DateFormat_MD_HHMMSS(new Date())},
	    	{id:5, order_id:"11234", name:"[한정]조니실버핸드 800ml", product_cnt : "12", rating:"2", order_date: get_DateFormat_MD_HHMMSS(new Date())}
        ]*/
	});
	
	table.on("rowClick", function(e,row){
		//페이지 이동 처리 
	   console.log(row.getData());
		
	   	$('#form_order_id').val(row.getData().order_id);
   		$("#form_name").val(row.getData().name);
		
	   $('#dataForm').submit();
	   //pageContext.forward("/SellerPage/SellerMainPage.jsp");
	});
}

function PageMove_forList(data_struct)
{
	var data = 
	{
		order_id: data_struct.order_id,
		name: data_struct.name,
		product_cnt : data_struct.product_cnt,
		order_date : data_struct.order_date
	};
	
	var result;
	
	var url = url_server + "/SellerController/ListDetail_move.func";
	$.ajax({
		type:"post",
        url:url,
        contentType: 'application/json',
        data: JSON.stringify(data),		       
        success: function(response) 
        {
        	//해당 페이지       	
        	
        	$('#dataForm').submit();
        	//location.replace("/SellerPage/SellerListDetail.jsp");
        },
        error : function(request,status,error){
            alert('code:'+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); //에러 상태에 대한 세부사항 출력
            alert(e);
        }
	});
}

</script>
</body>
</html>