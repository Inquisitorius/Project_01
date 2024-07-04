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
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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
    margin-top: 20px;
    }
  
  .button_Style{
  margin-top:10px;
  }  
  
  .mini_Font{	
	margin-top: 5px;
	font-size: 10px;
	color: rgb(102, 102, 102);
	font-weight: 600;
	text-decoration: none;
	
}

a:visited {
  color: black;
}

a:hover {
  color: green;
}

</style>
</head>
<body>
    
	<jsp:include page="/Common/Header.jsp" />
	<main class="container">
		<div class="row">
			<div class="login_Title">로그인</div>		
		</div>
		<form action="/login.do" method="post">
		<div class="row" style="justify-content: center;">
			<div class="col-md-3" style="justify-content: center;">
				<input id = "input_id" type="text" class="input_Style" placeholder="아이디를 입력해주세요" onfocus="this.placeholder=''" onblur="this.placeholder='아이디를 입력해주세요.'" name="id" onkeypress="enter(event)">
				<input id = "input_pw" type="password" class="input_Style" placeholder="비밀번호를 입력해주세요" onfocus="this.placeholder=''" autoComplete="off" onblur="this.placeholder='비밀번호를 입력해주세요.'" name="pass" onkeypress="enter(event)">
				</div>
		</div>
		<div class="row" style="justify-content: center;">
			<div class="col-md-3" style="display:flex; align-items: center; height:40px; padding:15px;">
				<div class="col-md-7"><p id="loginWarning" style="margin:0px; font-size:10px; color:red; user-select:none;"></p></div>
				<div class="col-md-5"  style="display:flex; justify-content: flex-end; user-select:none;">		
				<a class="mini_Font" onclick="location.href='/LoginPage/ForgotId.jsp';">아이디 찾기</a> <span>|</span>
				<a class="mini_Font" onclick="location.href='/LoginPage/ForgotPwd.jsp';">비밀번호 찾기</a>
				</div>
			</div>
		</div>
		
		<div class="row" style="justify-content: center;">
			<div class="col-md-3" style="justify-content: center;">
				<div class="button_Style">
					<button type="button" class="btn btn-success" id = "loginBtn" style="width:100%;" >로그인</button>
				</div>
			</div>
		</div>
		</form>
		
		<div class="row" style="justify-content: center;">
			<div class="col-md-3" style="justify-content: center;">
				<div class="button_Style" style="margin-bottom: 80px; ">
					<button type="button" class="btn btn-success" style="width:100%;" onclick="location.href='/MainPage/JoinPage.jsp';">회원가입</button>
				</div>
			</div>
		</div>
	</main>
	<jsp:include page="/Common/Footer.jsp" />
	<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
	<script src="/resources/bootstrap/js/bootstrap.bundle.js"></script>
	<script	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
	<script>	
	
		function enter(e){
			const key = e.code;
			if(key == 'Enter'){
				$('#loginBtn').click();
			}
		}
		$(document).ready(function()
		{
			$('#loginBtn').click(function()
			{	
				if($('#input_id').val() == ""){
					$('#loginWarning').html("아이디를 입력해주세요.");
					$('#input_id').focus();
				}
				else if($('#input_pw').val() == ""){
					$('#loginWarning').html("비밀번호를 입력해주세요.");
					$('#input_pw').focus();
				}else{
					LoginFunction();	
				}
			});
		});
		
		function LoginFunction()
		{
			var input_id = $('#input_id').val();
			var input_pw = $('#input_pw').val();
			
			var url = url_server + "/login/loginTry";
			
			var data = 
			{
				id : input_id,
				pass : input_pw
            };
			
			 $.ajax
			 ({
				 type:"post",
				 url:url,
				 contentType: 'application/json',
				 data: JSON.stringify(data),
		         success: function(response)
		         {
		        	if(response.stringData_00 == 'false')
		        	{
		        		//실패 안내문.
		        		$('#loginWarning').html("아이디 비밀번호를 다시 확인해주세요.");
		        	}
		        	else
		        	{
		        		//메인으로? 요청 한 페이지?
		        		swal({
               			 title: "로그인 되었습니다.",
              			 icon: "info",
              			 button: "확인",
           				 }).then((value) => {
           					location.replace("/MainPage/MainPage.jsp");
       			     });		
		        		
		        	}
		         },
		         error : function(request,status,error)
		         {
		        	 alert('code:'+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); //에러 상태에 대한 세부사항 출력
				     alert(e);
				 }
			 });
		}
	</script>
</body>
</html>
