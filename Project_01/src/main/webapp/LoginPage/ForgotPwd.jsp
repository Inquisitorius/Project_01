<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>로그인</title>
<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.css">
<script src="/resources/bootstrap/js/jquery-3.7.1.js"></script>

<style type="text/css">
.login_Title {
	margin-top: 100px;
	font-size: 30px;
	font-weight: 600;
	text-align: center;
	color: rgb(51, 51, 51);
	user-select: none;
}

.ban_Select{
    user-select: none;
}

.input_Style{
    width: 100%;
    height: 46px;
    padding: 0 11px 1px 15px;
    border-radius: 4px;
    border: 1px solid #ddd;
    font-weight: 500;
    font-size: 14px;
    line-height: 1.5;
    color: #333;
    outline: none;
    margin-top: 10px;
    margin-bottom: 10px;
    }
  
  .font_Style{
  font-size:14px;
  font-weight:600;
  user-select:none;
  }
  
  .choose_Style{
  background-color:#fff;
  border:0px;
  width:130px;"
  font-size:20px;
  font-weight:600;
  padding:0px;
  color:grey;
  user-select:none;
  }
  
  .red_Color {
	color: red;
	user-select: none;
	font-size:12px;
	margin-bottom: 0px;
}
  
</style>
</head>
<body>
<jsp:include page="/Common/Header.jsp" />
<main class="container">
		<div class="row">
			<div class="login_Title">비밀번호 찾기</div>		
		</div>
	<div class="row" style="justify-content:center; height:40px; margin-top:20px; margin-bottom:20px">
		<div class="col-md-3" style="display:flex; justify-content: space-around; padding:0px;">
			<div class="col-md-6" style="padding-left:10px;">			
			<button type="button" class="choose_Style" onclick="chooseMethod(this.id)" id="phoneCheck" style="color:green; width:100%; height:100%;"  disabled>휴대폰 인증</button>
			</div>
			<div class="col-md-6" style="padding-right:10px;">
			<button type="button" class="choose_Style" onclick="chooseMethod(this.id)" id="emailCheck" style="width:100%; height:100%;">이메일 인증</button>
			</div>
		</div>
		</div>	
		<div class="row" style="justify-content:center;">
			<div class="col-md-3" style="display:flex;">
					<div class="col-md-6" style="border-bottom:5px solid green; margin-bottom:30px;" id="phone_line">
					</div>
					<div class="col-md-6" id="email_line" style="margin-bottom:30px;">
					</div>
			</div>
		</div>
		
				
	<form name ="IdSearch">
		<div class="row" style="justify-content: center;">
			<div class="col-md-3" style="justify-content: center;">
				<div><span class="font_Style">아이디</span></div>
				<input id = "input_id" type="text" class="input_Style" placeholder="아이디을 입력해주세요" oninput="inputid(this.id)" onfocus="this.placeholder=''" onblur="this.placeholder='아이디을 입력해주세요.'" name="input_id" onkeypress="enter(event)">
				<div><span class="font_Style" id="second_content">휴대폰 번호</span></div>
				<input type="text" class="input_Style" placeholder="숫자만 입력해주세요" id="input_second" oninput="inputSecond(this.id)" maxlength="25" 
							onfocus="this.placeholder=''"
							onblur="this.placeholder='숫자만 입력해주세요.'" name="phone" onkeypress="enter(event)">
				<p id="Warning" class="red_Color" ></p>
				<button type="button" class="btn btn-success" id="submit_button" onclick="pwdSearch()" style="margin-top:40px; margin-bottom:40px; height:38px; width:100%;">찾기</button>
				</div>
		</div>
	</form>	
		<script>
		
		function enter(e){
			const key = e.code;
			if(key == 'Enter'){
				$('#submit_button').click(pwdSearch());
			}
		}
		
		function pwdSearch(){
			var id = $("#input_id").val();
            var second = $("#input_second").val();
            $.ajax({
                type: "POST",
                url: "/login/pwdSearch",
                data: { id: id, second: second },
                dataType: "json",
                success: function(response) {
                    if (response.status === "success") {
                	swal({
                    	title: "가입 하신 비밀번호는 '" + response.pwd + "'입니다.'",
                    	icon: "info",
             			button: "확인",
                    }).then((value) => {
       					location.replace("/MainPage/LoginPage.jsp");
                    });
                    } 
                    else{
                    	Warning.textContent = "입력 값을 다시 확인해주세요.";
                    	}
                },
                error: function() {
                    alert('서버 오류가 발생했습니다. 다시 시도해 주세요.');
                }
            });
		}
		
		function inputid(id){
				var id = document.getElementById(id).value;
				const re = /^(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z0-9]{6,16}$/;
				if(re.test(id)){
				Warning.textContent = "";
				inputSecond("input_second");	
				}else{
				Warning.textContent = "6자 이상 16자 이하의 영문 혹은 영문과 숫자";}
				}
		
		function inputSecond(id){
		contents = document.getElementById("second_content").textContent;
		if(contents == "휴대폰 번호"){
			var element = document.getElementById(id);
			element.value = element.value.replace(/[^0-9]/gi, "");
			var phone = element.value;
			if(phone.length < 10){
				Warning.textContent = "핸드폰 번호를 입력해주세요.";
			}else{
				Warning.textContent = "";}
		}else{
			var email = document.getElementById(id).value;
			var email_re = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i;
			if(email_re.test(email)){
				Warning.textContent = "";
			}else{
				Warning.textContent = "이메일 형식이랑 다릅니다.";
			}
			}
		}
		
		function chooseMethod(id){	// 휴대폰 번호 찾기 , 이메일 찾기 누를 시 색깔 변경 및 텍스트 필드 내용 변경.
			var clickbutton = document.getElementById(id);
			var color = getComputedStyle(clickbutton).color;
			var input = document.getElementById('input_second');
			if(id == "emailCheck"){
			var otherbutton = document.getElementById("phoneCheck");
			var line = document.getElementById("email_line");
			var otherline = document.getElementById("phone_line");
			document.getElementById("second_content").textContent = "이메일 주소";
			input.placeholder = '이메일을 입력해주세요.';
			}
			else{
			var otherbutton = document.getElementById("emailCheck");
			document.getElementById("second_content").textContent = "휴대폰 번호";
			input.placeholder = '숫자만 입력해주세요.';
			var line = document.getElementById("phone_line");
			var otherline = document.getElementById("email_line");
			}
			input.value="";
			line.style.borderBottom = "5px solid green";
			otherline.style.borderBottom = "0px"
			clickbutton.style.color = "green";
			clickbutton.disabled = true;
			otherbutton.style.color = "grey";
			otherbutton.disabled = false;
			}
		</script>
	</main>
	<jsp:include page="/Common/Footer.jsp" />
	<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
	<script src="/resources/bootstrap/js/bootstrap.bundle.js"></script>
	<script	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
</body>
</html>