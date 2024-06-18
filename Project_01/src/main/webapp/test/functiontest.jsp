<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
.buy_button
{
float: right;
width: 250px;
height: 50px;

}

</style>
</head>
<body>
<jsp:include page="/Common/Header.jsp"/>
<main class="container" >
	<div class="row" style="margin-bottom : 30px;">
			<div class="d-flex justify-content-around texttop_01" >로그인</div> 	
		</div>
	<div class="row">
			<div class= "col-4" style="display:flex;justify-content: space-around;">
			<input type="button" class="buy_button" value=" - " onclick='del();'>
			<input type="button" class="buy_button" value=" + " onclick='add();'>
			</div>
			<div class="row">
			<div class= "col-4">
			<input type='button'onclick='count("plus")'value='+'/>
			<input type='button'onclick='count("minus")'value='-'/>
			<div id='result'>1
			</div>
			</div>
			</div>	
</main>
<script>
function add() {
		document.write( '<p>Hello World!</p>' );
		System.out.println("test ------");
		hm = document.form1.amounts;// name이 amounts인 요소
		sell_price = document.form1.sell_price;// name이 sell_price인 요소
		hm.value++;// hm 값을 1 증가
		var sum_ = parseInt(hm.value) * sell_price.value;// hm을 정수로 변환 * sell_price 금액 계산
		document.getElementById("my_sum")
		document.write('test');
		
	}
function del() {
		document.write( '<p>Hello World!</p>' );
		System.out.println("test ------");
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
	count(type);
	del();
	add();
</script>

</script>

	<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
	<script src="/resources/bootstrap/js/bootstrap.bundle.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
</body>
</html>