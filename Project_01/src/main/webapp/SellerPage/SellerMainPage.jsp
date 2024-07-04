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
</style>
</head>
<body>
<jsp:include page="/Common/Header.jsp"/>
<main>
<div class = "container" style = "max-width: 1050px; min-width: 1050px; padding-left: 0px; padding-right: 0px; padding-top: 40px;">
	<div class = "row" style = "border-bottom: 1px solid #efefef; padding-bottom: 20px;">
		<div class = "col-12" style="display: inline-flex;justify-content: center;">
			<label class = "sellerMainTitle">판매자 관리시스템</label>
		</div>
	</div>
</div>
<div class = "container" style = "max-width: 1050px; min-width: 1050px; padding-left: 0px; padding-right: 0px; padding-top: 40px;">
	<div class= "row d-flex flex-nowrap" style = "justify-content: space-between;">
		<div class = "col-4" style="padding-top : 80px; padding-bottom: 40px;">
			<div class = "row" style="padding-bottom: 4px;">
				<div class = "col-12">
					<button class = "btn btn-navy rounded-1 fontCommon_Option" id = "insertProductsBtn" type = "button" style="width: 100%; height: 55px;">
					판매자 물품 등록
					</button>
				</div>				
			</div>	
			<div class = "row" style="padding-bottom: 4px;">
				<div class = "col-12">
					<button class = "btn btn-navy rounded-1 fontCommon_Option" id = "inqueryListBtn" type = "button" style="width: 100%; height: 55px;">
					판매자 문의사항 확인
					</button>
				</div>				
			</div>	
			<div class = "row" style="padding-bottom: 4px;">
				<div class = "col-12">
					<button class = "btn btn-navy rounded-1 fontCommon_Option" id = "sellerChartBtn" type = "button" style="width: 100%; height: 55px;">
					판매 현황
					</button>
				</div>				
			</div>	
			<div class = "row" style="padding-bottom: 4px;">
				<div class = "col-12">
					<button class = "btn btn-navy rounded-1 fontCommon_Option" id = "orderListBtn" type = "button" style="width: 100%; height: 55px;">
					등록된 환불 요청
					</button>
				</div>				
			</div>
		</div>
		<div class = "col-8">
			<canvas id="myChart" style = "width = 100%; max-height = 400px;"></canvas>
		</div>
	</div>
	<div class= "row d-flex flex-nowrap" style = "justify-content: space-between;">
		<div class = "col-12" style = "padding-bottom : 20px;">
			<label class = "sellerMainTitle_sub">최근 환불 요청</label>
		</div>
	</div>
	<div class= "row d-flex flex-nowrap" style = "justify-content: space-between; padding-bottom: 40px; min-height: 400px;">
		<div class = "col-12">
			<div id="example-table" style = "border-bottom: 4px solid #163020;"></div>
		</div>
	</div>	
</div>
</main>
<div style = "display: none;">
	<form id = "dataForm" name="data" method="post" action = "/SellerPage/SellerListDetail.jsp">
		<input id = "form_order_id" type="hidden" name ="order_id" value="">
		<input id = "form_name" type="hidden" name ="name" value="">
	</form>
</div>
<jsp:include page="/Common/Footer.jsp"/>
<script src="/resources/bootstrap/js/bootstrap.bundle.js"></script>
<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="/resources/bootstrap/Chart.util.js"></script>
<script>
$(document).ready(function()
{
	//ChartInit();
	get_SellerCountData();
	
	//Grid used
	get_SellerListData();
	
	$('#insertProductsBtn').click(function name() {
		location.replace("/SellerPage/ProductsInsert.do");
	});
	
	$('#orderListBtn').click(function()
	{		
		location.replace("/SellerPage/OrderListPage.jsp");
	});
	
	//inqueryListBtn
	$('#inqueryListBtn').click(function()
	{		
		location.replace("/SellerPage/Inquery_Seller.jsp");
	});
	
	$('#sellerChartBtn').click(function()
	{
		location.replace("/SellerPage/SellerChart.jsp");
	});
});

 

function GridInit(list)
{
	var data_save = [];
	
	list.forEach((dto, index) => 
	{
		var nowDate = new Date();
		var oldDate = new Date(dto.order_date);
		
		var differenceInMillis = nowDate - oldDate; //ms
		var differenceInDays = Math.floor(differenceInMillis / (1000 * 60 * 60 *24)); //일단위 변환
		
		data_save.push({id:index, order_id:dto.order_id, name:dto.name, product_cnt : dto.product_cnt , rating: differenceInDays, order_date:dto.order_date });
	});
	
	
	var table = new Tabulator("#example-table", {
	    height:"fitData",	    
	    columns:
	    [
		    {title:"주문번호", field:"order_id", sorter:"number"},
		    {title:"상품명", field:"name"},
		    {title:"상품수량", field:"product_cnt", hozAlign:"center"},		    
		    {title:"신청일자", field:"order_date", hozAlign:"center"},
		    {title:"지연상태", field:"rating", formatter:"traffic", hozAlign:"center", formatterParams:{ min:0,max:10,color:["green", "orange", "red"] }},	
	    ],
	    layout:"fitColumns",
	    data: data_save
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

function get_DateFormat_MD_HHMMSS(date)
{
	var result = "" + (date.getMonth()+1) + "/" + date.getDate() + " " 
	+ date.getHours() + ":" + date.getMinutes() + ":" + date.getSeconds();
	return result;
}

function get_DateFormat_MD(minus)
{
	const nowDate = new Date();
	nowDate.setDate(nowDate.getDate() - minus);
	
	var nowDay = nowDate.getDate();
	var nowMonth = nowDate.getMonth() + 1;
	
	return nowMonth + "/" + nowDay;
}

function get_SellerCountData()
{
	var id = 2;
	var data = 
	{
		seller_id : id
	};
	var url = url_server + "/SellerController/mainCnt.func";
	
	$.ajax({
		type:"post",
        url:url,
        contentType: 'application/json',
        data: JSON.stringify(data),		       
        success: function(response) 
        {
        	//여기서 테이블 초기화
        	console.log(response);
        	ChartInit(response);
        },
        error : function(request,status,error){
            alert('code:'+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); //에러 상태에 대한 세부사항 출력
            alert(e);
        }
	});
}

function get_SellerListData()
{
	//seller id 필요
	var id = 2;
	
	var data = 
	{
		seller_id : id
	};
	
	var result;
	
	var url = url_server + "/SellerController/main.func";
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

function ChartInit(severData)
{	
	//필요한것 
	//데이터 : 날짜 -> 현재 날짜를 기준으로 -7일		
	var temp = 0;
	var date_label = 
		[
			severData[0].dateInfo,
			severData[1].dateInfo,
			severData[2].dateInfo,
			severData[3].dateInfo,
			severData[4].dateInfo,
			severData[5].dateInfo,
			severData[6].dateInfo
		];	
	
	//데이터 : 환불 및 판매건수 
	
	//DB에서 현재 데이터 값이 있다고 가정
	
	//전체 데이터양
	const DATA_COUNT = 7;
	//최대 최소 값 필요
	const NUMBER_CFG = {count: DATA_COUNT, min: 0, max: 100};
	//하부 라벨
	const labels = date_label;//Samples.utils.months({count: 7});	
	
	const data = {
			  labels: labels,
			  datasets: [
				{
				      label: '환불건',
				      data:
				    	  [
				    		  severData[0].refundCnt, 
				    		  severData[1].refundCnt, 
				    		  severData[2].refundCnt, 
				    		  severData[3].refundCnt, 
				    		  severData[4].refundCnt, 
				    		  severData[5].refundCnt, 
				    		  severData[6].refundCnt, 
				    	  ],
				      borderColor: window.chartColors.blue,
				      backgroundColor: Samples.utils.my_transparentize(window.chartColors.blue, 0.4),
				      borderWidth: 1,
				      borderRadius: 5,
				      borderSkipped: false,
				},
			    {
			      label: '판매량',
			      data:
			    	  [
			    		  severData[0].sellCnt, 
			    		  severData[1].sellCnt, 
			    		  severData[2].sellCnt, 
			    		  severData[3].sellCnt, 
			    		  severData[4].sellCnt, 
			    		  severData[5].sellCnt, 
			    		  severData[6].sellCnt, 
			    	  ],
			      borderColor: window.chartColors.red,
			      backgroundColor: Samples.utils.my_transparentize( window.chartColors.red , 0.4),
			      borderWidth: 1,
			      borderRadius: 3,
			      borderSkipped: false,
			    }
			  ]
			};
	
	const config = {
			  type: 'bar',
			  data: data,
			  options: {
			    responsive: true,
			    plugins: {
			      legend: {
			        position: 'top',
			      },
			      title: {
			        display: true,
			        text: '판매현황',
			        font: { size:'25px', family: "Noto Sans KR"},
			        color: '#333333'
			      }
			    }
			  },
			};
	
	const chart = document.getElementById('myChart').getContext('2d');
	new Chart(chart, config);
	const actions = [
		  {
		    name: 'Randomize',
		    handler(chart) {
		      chart.data.datasets.forEach(dataset => {
		        dataset.data = Samples.utils.numbers({count: chart.data.labels.length, min: 0, max: 100});
		      });
		      chart.update();
		    }
		  },
		];
}
</script>
</body>
</html>