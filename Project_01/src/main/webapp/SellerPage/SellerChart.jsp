<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MainPage</title>
<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.css">
<jsp:include page="/Common/LinkFile.jsp"/>

<link rel="stylesheet" href="/resources/css/MainPage.css">
<script src="/resources/bootstrap/js/jquery-3.7.1.js"></script>

<style type="text/css">


</style>
</head>
<body>
<jsp:include page="/Common/Header.jsp"/>
<main>
<div class = "container" style = "max-width: 1050px; min-width: 1050px; padding-left: 0px; padding-right: 0px; padding-top: 40px;">
	<div class = "row" style = "border-bottom: 1px solid #efefef; padding-bottom: 20px;">
		<div class = "col-12" style="display: inline-flex;justify-content: center;">
			<label class = "sellerMainTitle">판매 현황</label>
		</div>
	</div>
</div>
<div class = "container" style = "max-width: 1050px; min-width: 1050px; padding-left: 0px; padding-right: 0px; padding-top: 40px;">
	<div class= "row d-flex flex-nowrap" style = "justify-content: space-between;">
		<div class = "col-12">			
				<canvas id="myChart" style = "width = 100%; max-height = 400px;"></canvas>
		</div>
	</div>
	<div class= "row d-flex flex-nowrap" style = "justify-content: space-between; display: inline-flex; justify-content: flex-end;">
		<div class = "col-4">			
			<div class="input-group" style = "margin-top: 40px;">
			  <input id = "dayInfoValue" 
			  type="text" class="form-control" placeholder="" style = "text-align: center;"
			  aria-label="Recipient's username" aria-describedby="basic-addon2" value = "30">
			  <span class="input-group-text" id="chartUpdateBtn">일 전까지의 현황</span>
			</div>
		</div>
	</div>
</div>

</main>
<jsp:include page="/Common/Footer.jsp"/>
<script src="/resources/bootstrap/js/bootstrap.bundle.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="/resources/bootstrap/Chart.util.js"></script>
<script>
var chart_save = null;

$(document).ready(function()
{
	$('#chartUpdateBtn').css("cursor", "pointer");
	$('#chartUpdateBtn').click(function()
	{
		get_SellerCountData();
	});
	
	//cursor:pointer;
	get_SellerCountData();	
});

function get_SellerCountData()
{
	var id = 2;
	var datevalue = $('#dayInfoValue').val();
	console.log(Number(datevalue) + 1);
	
	var data = 
	{
		seller_id : id,
		intData_00 : Number(datevalue) + 1
	};
	var url = "http://localhost:8080/SellerController/Get_SellerChartData";
	
	$.ajax({
		type:"post",
        url:url,
        contentType: 'application/json',
        data: JSON.stringify(data),		       
        success: function(response) 
        {
        	ChartInit(response);
        },
        error : function(request,status,error){
            alert('code:'+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); //에러 상태에 대한 세부사항 출력
            alert(e);
        }
	});
}

function ChartInit(severData)
{
	if (chart_save) {
		chart_save.destroy();
      }
	
	var dateLength = 30;
	//전체 데이터양
	const DATA_COUNT = dateLength;
	//최대 최소 값 필요
	const NUMBER_CFG = {count: DATA_COUNT, min: 0, max: 100};
	
	var date_label = [];	
	
	var data_contain_sell = [];
	var data_contain_refund = [];
	
	severData.forEach(function(element, index, array) 
	{
		date_label.push(element.dateInfo);
		data_contain_sell.push(element.sellCnt);
		data_contain_refund.push(element.refundCnt);
	});
	
	const data_info = {
			  labels: date_label,
			  datasets: [
				{
				      label: '환불건',
				      data:data_contain_refund,
				      borderColor: window.chartColors.blue,
				      backgroundColor: Samples.utils.my_transparentize(window.chartColors.blue, 0.4),
				      borderWidth: 1,
				      borderRadius: 5,
				      borderSkipped: false,
				},
			    {
			      label: '판매량',
			      data: data_contain_sell,
			      borderColor: 'rgb(250,25,0)',
			      backgroundColor: Samples.utils.my_transparentize( 'rgb(250,15,0)' , 0.4),
			      borderWidth: 1,
			      borderRadius: 3,
			      borderSkipped: false,
			    }
			  ]
			};
	
	
	const config = 
	{
		type: 'line',
		data: data_info,
		options: 
		{
			responsive: true,
			plugins: 
			{
				legend:
				{
					position: 'top',
				},
				title: 
				{
					display: false,
					text: '',
					font: { size:'25px', family: "Noto Sans KR"},
					color: '#333333'
				}
			}
		},
	};
	
	const chart = document.getElementById('myChart').getContext('2d');
	chart_save = new Chart(chart, config);
}
</script>
</body>
</html>