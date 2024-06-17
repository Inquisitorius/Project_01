<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
function add() {
		hm = document.form1.amounts;// name이 amounts인 요소
		sell_price = document.form1.sell_price;// name이 sell_price인 요소
		hm.value++;// hm 값을 1 증가
		var sum_ = parseInt(hm.value) * sell_price.value;// hm을 정수로 변환 * sell_price 금액 계산
		document.getElementById("my_sum")
		document.write('test');
	}
function del() {
		hm = document.form1.amounts;
		sell_price = document.form1.sell_price;
		if (hm.value > 1) {// hm(amounts에서 가져온 값)가 1보다 크면
			hm.value--;// hm 값 1 감소
			var sum_ = parseInt(hm.value) * sell_price.value;
			document.getElementById("my_sum")	
			document.write('test2');
		}
	}
	function count(type)  {
		  // 결과를 표시할 element
		  const resultElement = document.getElementById('result');
		  
		  // 현재 화면에 표시된 값
		  let number = resultElement.innerText;
		  
		  // 더하기/빼기
		  if(type === 'plus') {
		    number = parseInt(number) + 1;
		  }else if(type === 'minus')  {
		    number = parseInt(number) - 1;
		  }
		  // 결과 출력
		  resultElement.innerText = number;
		}
</script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>

<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="/resources/css/Common.css">
<script src="/resources/js/jquery-3.7.1.js"></script>
<script src="https://kit.fontawesome.com/a0b08e370a.js" crossorigin="anonymous"></script>
<style type="text/css">

.texttop_01
{
background-color :white ;
color :black;
font-weight: bold;
font-size: 30px;
}
.product_01
{
/* background-image: url("../resources/img/melon.jpg"); */
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
.fontCommon_nomal
{
font-family: "Noto Sans KR", serif;
font-optical-sizing: auto;
font-style: normal;
color: #333333;
margin-bottom:10px
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
/* background-color: skyblue;
  color: white;
  border: none; */
width: 250px;
height: auto;
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
</style>
</head>
<body>
<jsp:include page="/Common/Header.jsp"/>
<main>
<div class="container"style = "max-width: 1050px; min-width:1050px; padding-left: 0px;padding-top: 20px;" >
<div class="row d-flex flex-nowrap">	
		 <div class="col-5">
		 	<img src = "../resources/img/melon.jpg" style = "width: 400px; height: auto; border-radius: 2%;
		 	overflow: hidden; margin-right: 300px;"/>
		 </div>
		 <div class = "col-7">
		 	<div class= "row">
				<div class = "col-md-12 fontgray">
					샛별배송
				</div>
			</div>
		 	<div class = "row">
					<div class = "col-md-12 fontCommon_Option" style = "font-size: 24px; font-weight: 700; color: #333;">
						[쉘퍼] 머스크멜론 1.6kg
					</div>
			</div>
			<div class= "row">
				<div class = "col-md-12 fontgray">
					촉촉하게 머금은 달콤함
				</div>
			</div>	
			<div class= "row">
				<div class = "col-md-12 fontCommon_nomal">
					9900 원
				</div>
			</div>	
			<div class= "row">
				<div class = "col-md-12 fontCommon_nomal">
					원산지 국산
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
					샛별배송
				</div>
			</div>
			<hr style="height:1px;border:none;background-color:gray;">
			<div class= "row">
				<div class = "col-md-3 fontgray">
					판매자
				</div>
				<div class = "col-md-4 fontgray">
					컬리
				</div>
			</div>	
			<hr style="height:1px;border:none;background-color:gray;">
			<div class= "row">
				<div class = "col-md-3 fontgray">
					포장타입
				</div>
				<div class = "col-md-4 fontgray">
					냉장(종이포장)
				</div>
			</div>	
			<hr style="height:1px;border:none;background-color:gray;">
			<div class= "row">
				<div class = "col-md-3 fontgray">
					판매단위
				</div>
				<div class = "col-md-4 fontgray">
					1통
				</div>
			</div>
			<hr style="height:1px;border:none;background-color:gray;">
			<div class= "row">
				<div class = "col-md-3 fontgray">
					중량
				</div>
				<div class = "col-md-4 fontgray">
					1.6kg 내외
				</div>
			</div>
			<hr style="height:1px;border:none;background-color:gray;">
			<div class= "row">
				<div class = "col-md-3 fontgray">
					소비기한정보
				</div>
				<div class = "col-md-8 fontgray">
					농산물로 소비기한은 없으나 빠르게
					섭취하시는 것을 권장드립니다.
				</div>
			</div>
			<hr style="height:1px;border:none;background-color:gray;">
			<div class= "row">
				<div class = "col-md-3 fontgray">
					안내사항
				</div>
				<div class = "col-md-8 fontgray">
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
					<input type="button" class="button_style2" value=" - " onclick="del();">
			<input type="hidden" class="button_style2" name="sell_price" style="width:30px;" value="${dto.p_price}" >
			<input type="text" class="button_style2" name="amounts" value="1" size="3">
			<input type="button" class="button_style2"value=" + " onclick="add();">
			<input type="hidden" name="sum" size="11" readonly>
			<div>
  			<fmt:formatNumber value="${dto.p_price}" pattern="#,###" /></span></div>
			<input type="hidden" name="m_id" id="m_id" value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}">
				</div>
				
			</div>
			<div class= "row">
				<div class = "col-md-12 fontgray right" style="display:inline-flex;align-items: center;">
				총 상품 금액:<label style="font-weight:bold;font-size:25px">9900</label>원</div>
				
			</div>
			<div class="row">
				<div class= "col -4">
				<button type="button" class="btn btn-success buy_button">장바구니 담기</button>
			</div>
			</div>
		 </div>
		 </div>
		 </div>
		 <div class="container" style = "max-width: 1050px; min-width:1050px; padding-left: 0px; padding-top: 100px;" >
		 <div class="row">
		 		<div class= "col-3">
				<button type="button" class="btn btn-outline-success button_style">상품설명</button>
				</div>
				<div class= "col-3">
				<button type="button" class="btn btn-outline-success button_style">상세정보</button>
				</div>
				<div class= "col-3">
				<button type="button" class="btn btn-outline-success button_style">후기</button>
				</div>
				<div class= "col-3">
				<button type="button" class="btn btn-outline-success button_style">문의</button>
				</div>
			</div>
		 </div>
</main>
<jsp:include page="/Common/Footer.jsp"/>

	<script>
	$(document).ready(function())
	{
		alert("Clicked");
		$('.inputtest')
		add();
		del();
	});
	
	</script>
	
	<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
	<script src="/resources/bootstrap/js/bootstrap.bundle.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
</body>
</html>