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

<link rel="stylesheet" href="/resources/css/MainPage.css">
<link href="https://cdn.jsdelivr.net/npm/gridjs/dist/theme/mermaid.min.css" rel="stylesheet" />

<script src="/resources/bootstrap/js/jquery-3.7.1.js"></script>
<script src="/resources/bootstrap/js/jQueryRotate.js"></script>
<script src="https://cdn.jsdelivr.net/npm/gridjs/dist/gridjs.umd.js"></script>
<style>

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
					<button class = "btn btn-navy rounded-1 fontCommon_Option" type = "button" style="width: 100%; height: 55px;">
					판매자 물품 등록
					</button>
				</div>				
			</div>	
			<div class = "row" style="padding-bottom: 4px;">
				<div class = "col-12">
					<button class = "btn btn-navy rounded-1 fontCommon_Option" type = "button" style="width: 100%; height: 55px;">
					판매자 문의사항 확인
					</button>
				</div>				
			</div>	
			<div class = "row" style="padding-bottom: 4px;">
				<div class = "col-12">
					<button class = "btn btn-navy rounded-1 fontCommon_Option" type = "button" style="width: 100%; height: 55px;">
					등록 및 판매현황
					</button>
				</div>				
			</div>	
			<div class = "row" style="padding-bottom: 4px;">
				<div class = "col-12">
					<button class = "btn btn-navy rounded-1 fontCommon_Option" type = "button" style="width: 100%; height: 55px;">
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
			<label class = "sellerMainTitle_sub">환불 요청 내역</label>
		</div>
	</div>
	<div class= "row d-flex flex-nowrap" style = "justify-content: space-between;">
		<div class = "col-12">
			<div id="wrapper" style = "width: 100%;"></div>
		</div>
	</div>
</div>
</main>
<jsp:include page="/Common/Footer.jsp"/>
<script src="/resources/bootstrap/js/bootstrap.bundle.js"></script>
<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="/resources/bootstrap/Chart.util.js"></script>
<script>
$(document).ready(function()
{
	ChartInit();
	
	//Grid used
	GridInit();
});

function GridInit()
{
	var date = new Date();
	new gridjs.Grid({
		  columns: ["주문번호", "제품", "수량", "신청 날짜"],
		  data: [
		    ["112312", "제품 머시기", "3", get_DateFormat_MD_HHMMSS(date)],
		    ["112312", "제품 머시기", "2", get_DateFormat_MD_HHMMSS(date)],
		    ["112312", "제품 머시기", "1", get_DateFormat_MD_HHMMSS(date)],
		    ["112312", "sarahcdd@gmail.com", "3",  get_DateFormat_MD_HHMMSS(date)],
		    ["112312", "afshin@mail.com", "2", get_DateFormat_MD_HHMMSS(date)]
		  ],
		  style: {
			    table: {
			      border : '1px solid #ccc'
			    },
			    th: {
			      'background-color': 'rgba(0, 0, 0, 0.1)',
			      color: '#000',
			      'border': '1px solid #ccc',			      
			      'text-align': 'center'
			    },
			    td: {
			      'text-align': 'center'
			    }
			  },
			className: {
	                table: 'custom-gridjs-table'}
		}).render(document.getElementById("wrapper"));
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

function ChartInit()
{	
	//필요한것 
	//데이터 : 날짜 -> 현재 날짜를 기준으로 -7일		
	var minus = 6;
	var date_label = 
		[
			get_DateFormat_MD(minus--),
			get_DateFormat_MD(minus--),
			get_DateFormat_MD(minus--),
			get_DateFormat_MD(minus--),
			get_DateFormat_MD(minus--),
			get_DateFormat_MD(minus--),
			get_DateFormat_MD(minus--)
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
				      data: Samples.utils.numbers(NUMBER_CFG),
				      borderColor: window.chartColors.blue,
				      backgroundColor: Samples.utils.my_transparentize(window.chartColors.blue, 0.4),
				      borderWidth: 1,
				      borderRadius: 5,
				      borderSkipped: false,
				},
			    {
			      label: '판매량',
			      data: Samples.utils.numbers(NUMBER_CFG),
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