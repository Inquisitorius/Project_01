<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 - sample</title>
<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.css">
<script src="/resources/js/jquery-3.7.1.js"></script>
<script src="https://kit.fontawesome.com/a0b08e370a.js"
	crossorigin="anonymous"></script>
<style type="text/css">
.join-box {
	min-width: 700px;
	margin-top: 50px;
	margin-bottom: 60px;
	background-color: rgb(255, 255, 255);
}

.join-title {
	margin-bottom: 50px;
	font-size: 28px;
	line-height: 35px;
	font-weight: 500;
	text-align: center;
	letter-spacing: -1px;
	color: rgb(51, 51, 51);
}

.head-line {
	padding-bottom: 10px;
	border-bottom: 2px solid rgb(51, 51, 51);
	font-size: 12px;
	color: rgb(102, 102, 102);
	line-height: 17px;
	text-align: right;
}

div {
	display: block;
	unicode-bidi: isolate;
}



.star {
	color: rgb(238, 106, 123);
}

.join-box {
	width: 640px;
	margin: 0px auto;
}

.input-label {
	font-weight: 500;
	color: rgb(51, 51, 51);
	line-height: 20px;
}

.star {
	color: rgb(238, 106, 123);
}

.input-text {
	width: 100%;
	height: 46px;
	padding: 0px 11px 1px 15px;
	border-radius: 4px;
	border: 1px solid rgb(221, 221, 221);
	font-weight: 400;
	font-size: 16px;
	line-height: 1.5;
	color: rgb(51, 51, 51);
	outline: none;
	box-sizing: border-box;
}

.input2 {
	display: inline-flex;
	width: 100%;
	padding: 10px 20px;
	flex-direction: row;
	padding-bottom: 1px;
}

.join-btn {
	display: block;
	padding: 0px 10px;
	text-align: center;
	overflow: hidden;
	width: 100%;
	height: 44px;
	border-radius: 3px;
	color: rgb(95, 0, 128);
	background-color: rgb(255, 255, 255);
	border: 1px solid rgb(95, 0, 128);
	font-weight: 500;
	font-size: 14px;
}

.join-input {
	padding: 0px;
	box-sizing: border-box;
	margin: 0;
}

.btn-container {
	width: 120px;
	margin-left: 8px;
}

.label-container {
	width: 139px;
	padding-top: 12px;
	display: flex;
}

.p-container {
	padding: 10px 0px;
}

.p-label {
	font-size: 10px;
	color: rgb(240, 63, 64);
	margin-top: -4px;
	padding: 10px 0px;
	display: flex;
	height: auto;
}

}
</style>
</head>
<body>
	<jsp:include page="/Common/Header.jsp" />
	<div class="join-box">
		<div class="join-title">회원가입</div>
		<div class="head-line">
			<span class="star">*</span> 필수입력사항
		</div>
		<div class="join-input">
			<div class="input2 id">
				<div class="container text-center" align="center">
					<div class="row">
						<div class="col label-container id">
							<label class="input-label id"> 아이디 <span class="star id">*</span>
							</label>
						</div>

						<div class="col-md-6 input-info id">
							<input type="text" class="form-control input-text id"
								id="memberId" name="memberId" placeholder="아이디를 입력해주세요." maxlength="16">
							<p class="p-label id" id="instruction-id"></p>
						</div>
						<script>
							document.getElementById('memberId').addEventListener('input',function() {
											var input = this.value;
											var instruction = document
														.getElementById('instruction-id');
											var regex = /^(?=.*[a-zA-Z])[a-z0-9]{6,16}$/;
											
											if (regex.test(input)) {
												instruction.style.visibility = 'hidden';
												instruction.style.marginTop = '0';
												instruction.style.height = '0';
											
											}else{
												instruction.textContent = '6자 이상 16자 이하의 영문 혹은 영문과 숫자를 조합';
												instruction.style.visibility = 'visible';
												instruction.style.marginTop = '-4px';
												instruction.style.height = 'auto';
												
											}
										});
						</script>

						<div class="col-md-2 btn-container">
							<button type="button" class="join-btn dup">중복 확인</button>
						</div>
					</div>
				</div>
			</div>
			<div class="input2 pwd" style="padding: 1px 20px;">
				<div class="container text-center" align="center">
					<div class="row">
						<div class="col label-container pwd">
							<label class="input-label pwd">비밀번호 <span
								class="star pwd">*</span>
							</label>
						</div>
						<div class="col-md-6 input-info pwd">
							<input type="password" class="form-control input-text pwd"
								id="memberPwd" name="memberPwd" placeholder="비밀번호를 입력해주세요." maxlength="20">
							<p class="p-label pwd" id="instruction-pwd"></p>
						</div>
						<div class="col-md-2 btn-container"></div>
					</div>
				</div>
			</div>
				<script>
						document.getElementById('memberPwd').addEventListener('input',function() {
											var input = this.value;
											var instruction = document
														.getElementById('instruction-pwd');
											var regex = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{10,15}$/;

											if (regex.test(input)) {
												instruction.style.visibility = 'hidden';
												instruction.style.marginTop = '0';
												instruction.style.height = '0';
												
											}else{
												instruction.textContent = '영문/숫자/특수문자(공백 제외)만 허용하며, 2개 이상 조합';
												instruction.style.visibility = 'visible';
												instruction.style.marginTop = '-4px';
												instruction.style.height = 'auto';
												
											}
											
											if(input.length < 10){
												instruction.textContent = '최소 10자 이상 입력';
												instruction.style.visibility = 'visible';
												instruction.style.marginTop = '-4px';
												instruction.style.height = 'auto';
												
											}
										});
						</script>
				<div class = "input2 pwdCheck">
					<div class="container text-center" align="center">
						<div class="row">
							<div class="col label-container pwdCheck">
								<label class="input-label pwdCheck">비밀번호 확인
									<span class="star pwdCheck">*</span>
								</label>	
							</div>
							<div class="col-md-6 input-info pwdCheck">
								<input type="password" class="form-control input-text pwdCheck" id="pwdCheck" name="pwdCheck" placeholder="비밀번호를 한번 더 입력해주세요." maxlength="20">
								<p class="p-label pwdCheck" id="instruction-pwdChk"></p>
							</div>
							<div class="col-md-2 btn-container"></div>
						</div>
					</div>
				</div>
					<script type="text/javascript">
					document.getElementById('pwdCheck').addEventListener('input', function(){
						var input = this.value;
						var instruction = document.getElementById('instruction-pwdChk');
						var p1 = document.getElementById('memberPwd').value;
						
						if(input != p1){
							instruction.textContent = '동일한 비밀번호를 입력';
							instruction.style.visibility = 'visible';
							instruction.style.marginTop = '-4px';
							instruction.style.height = 'auto';
							
						}else {
							instruction.style.visibility = 'hidden';
							instruction.style.marginTop = '0';
							instruction.style.height = '0';
						}
					});
					</script>
				
				<div class = "input2 name">
					<div class="container text-center" align="center">
						<div class="row">
							<div class="col label-container name">
								<label class="input-label name">이름
									<span class="star name">*</span>
								</label>
							</div>
							<div class="col-md-6 input-info name">
								<input type="text" class="form-control input-text name" id="name" name="name" placeholder="이름을 입력해주세요." maxlength="10">
								<p class="p-label name" id="instruction-name"></p>
							</div>
							<div class="col-md-2 btn-container"></div>
						</div>
					</div>
				</div>
				<script type="text/javascript">
					document.getElementById('name').addEventListener('input', function(){
						var input = this.value;
						var instruction = document.getElementById('instruction-name');
						var regex = /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/;
						
						if(regex.test(input)){
							instruction.style.visibility = 'hidden';
							instruction.style.marginTop = '0';
							instruction.style.height = '0';
						}else {
							instruction.textContent = "이름 형식이 틀립니다.";
							instruction.style.visibility = 'visible';
							instruction.style.marginTop = '-4px';
							instruction.style.height = 'auto';
							
						}
						
						if(input == ""){
							instruction.textContent = "이름을 입력해주세요.";
							instruction.style.visibility = 'visible';
							instruction.style.marginTop = '-4px';
							instruction.style.height = 'auto';
							
						}
					});
					</script>
		</div>
	</div>
</body>
<jsp:include page="/Common/Footer.jsp" />
</html>