<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
<title>고객 센터</title>
<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.css">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://kit.fontawesome.com/a0b08e370a.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fork-awesome@1.2.0/css/fork-awesome.min.css">
<style type="text/css">

.Main_Title {
	margin-top: 100px;
	font-size: 30px;
	font-weight: 600;
	text-align: center;
	color: rgb(51, 51, 51);
	user-select: none;
}

.black_Line {
	padding-bottom: 10px;
	border-bottom: 2px solid rgb(51, 51, 51);
	margin-bottom: 20px;
	font-size: 12px;
	color: rgb(102, 102, 102);
	line-height: 17px;
	text-align: right;
	display: flex;
	justify-content: right;
}

.line_Style{
	width:100%;
	display:flex; 
	justify-content: center; 
	font-size:15px;
	height:50px;
	border-bottom:1px solid rgb(200, 200, 200);
	align-items: center;
	cursor: pointer;
}

.qna-contentA{
	font-size:12px;
}

.qna-answer {
    display: none;
  	padding: 10px;
    background-color: #f0f0f0;
    width:100%;
}

.qna-content {
    cursor: pointer;
    background-color: #f0f0f0;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
}

.column_Style{
text-align:center;
font-weight:600;
text-align:center;
}

.qna_Item{
font-size:12px;
text-align:center;
user-select:none;
}

</style>
<head>
<meta charset="UTF-8">
<title>자주 묻는 질문</title>
</head>
<body>
<main class="container">
		<div class="row" style="justify-content: center;">
			<div class="col-md-10">
				<div class="Main_Title">자주 묻는 질문</div>
			</div>
		</div>
		<div class="row" style="justify-content: center;">
			<div class="col-md-10" style="justify-content: center;">
				<div class="black_Line">
					<div>
					</div>
				</div>
			</div>
			<div class="col-md-10" style="display:flex; margin-bottom:10px;">
				<div class="col-md-3">
					<div class="column_Style">
					카테고리
					</div>
				</div>
				<div class="col-md-9">
					<div class="column_Style">
					제목
					</div>
				</div>
			</div>
			<div class="col-md-10" style="justify-content: center;">
				<div style="border-bottom:1px solid grey; height:10px;">
					<div>
					</div>
				</div>
			</div>
		</div>
		
		<div class="row" style="justify-content: center;">
		<div class="col-md-10" style="display:flex; margin-bottom:10px;">
			<div class="line_Style" onclick="showAnswer(1)">
				<div class="col-md-3">
					<div class="qna_Item">
					회원
					</div>
				</div>
				<div class="col-md-9">
					<div class="qna_Item">
					회원 정보를 바꾸고 싶습니다.
					</div>
				</div>
			</div>
		</div>
		<div class="col-md-10" style="display:flex;">
		<div class="qna-answer" id="content1">
				<p class="qna-contentA">■ 회원정보 변경 안내<br/>
 				- 아래 경로를 통해 회원정보를 직접 변경하실 수 있습니다.<br/>
 				홈페이지 우측 상단 마이페이지 선택 후 내 정보 수정 <br/>
				- 수정가능 항목 : 비밀번호/이메일주소/휴대폰번호/생년월일/성별<br/>
 				▣ 아이디, 이름은 수정 불가합니다.<br/>
 				▣ 구매 이후, 주문건에 대한 배송지 변경은 고객센터로 문의 바랍니다.</p>
		</div>
		</div>
		</div>
		
		<div class="row" style="justify-content: center;">
		<div class="col-md-10" style="display:flex;">
			<div class="line_Style" onclick="showAnswer(2)">
				<div class="col-md-3">
					<div class="qna_Item">
					취소/교환/환불
					</div>
				</div>
				<div class="col-md-9">
					<div class="qna_Item">
					교환/반품이 안되는 경우가 있나요?
					</div>
				</div>
			</div>
		</div>
		<div class="col-md-10" style="display:flex;">
		<div class="qna-answer" id="content2">
				<p class="qna-contentA">- (공통) 배송완료 후 7일 경과건에 대한 단순변심건<br/>
				- (가전/설치 상품) 실링 포장 된 상품의 개봉, 정품 스티커 훼손 건<br/>
				- (CD/DVD/GAME/서적) 복제가 가능한 상품의 포장 훼손<br/>
				- (식품) 냉장/냉동 식품의 단순변심건</p>
		</div>
		</div>
		</div>
		
		<div class="row" style="justify-content: center;">
		<div class="col-md-10" style="display:flex;">
			<div class="line_Style" onclick="showAnswer(3)">
				<div class="col-md-3">
					<div class="qna_Item">
					회원
					</div>
				</div>
				<div class="col-md-9">
					<div class="qna_Item">
					회원 가입에 제한이 있나요?
					</div>
				</div>
			</div>
		</div>
		<div class="col-md-10" style="display:flex;">
		<div class="qna-answer" id="content3">
				<p class="qna-contentA">
				■ 회원가입 조건<br/><br/>
				14세 이상이라면 누구나 가입하실 수 있습니다. 가입 시 <br/>
				마켓그린만의 특별한 혜택도 받으실 수 있습니다.</p>
				
		</div>
		</div>
		</div>
		
		<div class="row" style="justify-content: center;">
		<div class="col-md-10" style="display:flex;">
			<div class="line_Style" onclick="showAnswer(4)">
				<div class="col-md-3">
					<div class="qna_Item">
					회원
					</div>
				</div>
				<div class="col-md-9">
					<div class="qna_Item">
					회원 탈퇴 후 재가입이 가능한가요?
					</div>
				</div>
			</div>
		</div>
		<div class="col-md-10" style="display:flex;">
		<div class="qna-answer" id="content4">
				<p class="qna-contentA">
				■ 회원 재가입 안내<br/><br/>
				재가입은 가능하나 탈퇴 시 기존 정보는 전부 삭제되고 <br/>
				다시 가입 시 새로 초기화 됩니다.</p>
				
		</div>
		</div>
		</div>
		
		<div class="row" style="justify-content: center;">
		<div class="col-md-10" style="display:flex; margin-bottom:10px;">
			<div class="line_Style" onclick="showAnswer(5)">
				<div class="col-md-3">
					<div class="qna_Item">
					상품
					</div>
				</div>
				<div class="col-md-9">
					<div class="qna_Item">
					(주류) 막걸리가 약간 새어나옵니다
					</div>
				</div>
			</div>
		</div>
		<div class="col-md-10" style="display:flex; margin-bottom:10px;">
		<div class="qna-answer" id="content5">
				<p class="qna-contentA">
				■ 상품 특성 안내<br/><br/>
				막걸리는 발효 상품으로서 숨구멍이 필요하여 100% 밀봉되지 않습니다. <br/>
				이에 따라 약간의 새는 현상이 발생하며 정상적인 부분임을 참고 바랍니다.</p>
		</div>
		</div>
		</div>
		
		
		
		
		<Script>
			function showAnswer(id){
				var content = document.getElementById("content"+id);
				if (content.style.display === "none" || content.style.display === "") {
				        content.style.display = "block";
				   } else {
				        content.style.display = "none";
				  }
			}
		</Script>
</main>
</body>
</html>