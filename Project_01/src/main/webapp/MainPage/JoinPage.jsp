<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입</title>
<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.css">
<script src="/resources/bootstrap/js/jquery-3.7.1.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://kit.fontawesome.com/a0b08e370a.js"
	crossorigin="anonymous"></script>
<!-- 	<script>history.scrollRestoration = "manual"</script> -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/fork-awesome@1.2.0/css/fork-awesome.min.css">
<style type="text/css">
.join_Title {
	margin-top: 100px;
	font-size: 30px;
	font-weight: 600;
	text-align: center;
	color: rgb(51, 51, 51);
	user-select: none;
}

.ban_Select {
	user-select: none;
}

.red_Color {
	color: red;
	user-select: none;
	font-size:12px;
	margin-bottom: 0px;
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

.line_Style {
	display: flex;
	justify-content: center;
	align-items: center;
	width: 100%;
	padding-bottom: 5px;
	min-height: 58px;
}

.agree_Style {
	display: flex;
	justify-content: center;
	align-items: center;
	width: 100%;
	padding-bottom: 5px;
	min-height: 48px;
}

.button_Style {
	display: flex;
	max-hegiht: 40px;
	min-width: 130px;
	padding-left: 15px;
}

.field_Name {
	font-weight: 700;
	user-select: none;
}

.input_Style {
	width: 100%;
	height: 38px;
	display: flex;
	border: 1px solid rgb(204, 204, 204);
	border-radius: 3px;
	padding: 0px 15px;
	align-items: center;
}

.mini_Font {
	margin-top: 5px;
	font-size: 10px;
	color: rgb(150, 150, 150);
	font-weight: 500;
}

.birth_Input {
	border: 0px;
	width: 100%;
	outline: none;
	text-align: center;
	padding-left: 10px;
	padding-right: 10px;
}

.gender_Font {
	font-size: 15px;
}

.terms_Style {
	padding-left: 35px;
	font-size: 14px;
	color: green;
	text-decoration: none;
}

.agreeCheck {
	
}

a:visited {
	color: green;
}

a:hover {
	color: green;
}

.gender_radio {
    appearance: none;
    width: 13px;
    height: 13px;
    border: 1px solid green;
    border-radius: 50%;
}

.gender_radio:checked {
	appearance: none;
	width: 13px;
	height: 13px;
	box-shadow: 0 0 0 1px white;
	border: 4px solid green;
}

[type="checkbox"] {
	display: none;
}

[type="checkbox"]+label {
	cursor: pointer;
}

[type="checkbox"]+label>span {
	vertical-align: middle;
	padding-left: 5px;
}

/* label:before에 체크하기 전 상태 CSS */
[type="checkbox"]+label:before {
	content: "";
	display: inline-block;
	width: 30px;
	height: 30px;
	vertical-align: middle;
	border-radius: 100%;
	background-repeat: no-repeat;
	background-image: url('../resources/img/unCheckedIcon.png');
	background-size: 30px;
}

/* label:before에 체크 된 상태 CSS */
[type="checkbox"]:checked+label:before {
	width: 30px;
	height: 30px;
	background-repeat: no-repeat;
	background-image: url('../resources/img/checkIcon.png');
	background-size: 30px;
}
.modal {
  display: none;
  position: fixed;
  z-index: 1;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, 0.5);
}

.modal-content {
  background-color: #fefefe;
  margin: auto;
  padding: 20px;
  border: 1px solid #888;
  width: 700px;
  height: 600px;
  position: relative;
}
	
</style>
</head>
<body>
	<jsp:include page="/Common/Header.jsp" />
	<main class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="join_Title">회원가입</div>
			</div>
		</div>
		<div class="row" style="justify-content: center;">
			<div class="col-md-6" style="justify-content: center;">
				<div class="black_Line">
					<div>
						<span class="red_Color">*</span><span class="ban_Select">
							필수 입력사항</span>
					</div>
				</div>
			</div>
		</div>
	<form name="formJoin" >
		<div class="row" style="justify-content: center;">
			<div class="col-md-6">
				<div class="line_Style">
					<div class="col-md-3">
						<div class="field_Name">
							아이디<span class="red_Color">*</span>
						</div>
					</div>
					<div class="col-md-6">
						<input type="text" class="input_Style" id ="input_id" maxlength="16" oninput="inputId(this.id)" placeholder="아이디를 입력해주세요."
							onfocus="this.placeholder=''"
							onblur="this.placeholder='아이디를 입력해주세요.'" name="memberId" onkeypress="enterId(event)">
					</div>
					<div class="col-md-2">
						<div class="button_Style">
						
							<button type="button" id="repetitionBtn" class="btn btn-success" onclick="repetitionCheck()">중복확인</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<script>
		function enterId(e){
			const key = e.code;
			var repetitionBtn = document.getElementById("repetitionBtn");
			if(key == 'Enter'){
				$('#repetitionBtn').click(repetitionCheck());
			}
		}
			function repetitionCheck(){
				var id = document.getElementById("input_id").value;
				if(id == ""){
					idWarning.textContent = "아이디를 입력해주세요.";
				}
				if(id != "" && idWarning.textContent != "6자 이상 16자 이하의 영문 혹은 영문과 숫자"){
					 $.ajax({
		                    url: '/Join/JoinCheck',
		                    method: 'GET',
		                    data: { id: id },
		                    success: function(response) {
		                        if (response.isDuplicate) {
		                        	idWarning.style.color = "red";
		                            idWarning.textContent = "이미 사용중인 아이디 입니다.";
		                        } else {
		                            idWarning.textContent = "사용 가능한 아이디 입니다.";
		                            idWarning.style.color = "green";
		                            repetitionBtn.className = "btn btn-outline-secondary"
		                            repetitionBtn.disabled = true;
		                        }
		                    },
		                    error: function(error) {
		                        console.error('Error checking ID:', error);
		                        idWarning.textContent = "Error checking ID.";
		                    }
		                });
		            }
		        }

		</script>
		
		<div class="row" style="justify-content: center;">
			<div class="col-md-6" style="display:flex; justify-content: center;">
					<div class="col-md-3">
						<div class="field_Name">
						</div>
					</div>
					<div class="col-md-6" >
					<p id="idWarning" class="red_Color" ></p>
					</div>
					<div class="col-md-2">
						<div class="button_Style">
						</div>
					</div>
				</div>
			</div>
		
		<script> 
				function inputId(id) {
				var id = document.getElementById(id).value;
				const re = /^(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z0-9]{6,16}$/;
				if (!id) {
	                idWarning.textContent = "";
	                return;
	            }
				if(re.test(id)){
					idWarning.textContent = "";
				}else{
				idWarning.style.color="red";
				idWarning.textContent = "6자 이상 16자 이하의 영문 혹은 영문과 숫자";}
				
				reinputId();
				}
				
				function reinputId(){
				var repetitionBtn = document.getElementById("repetitionBtn");
				if(repetitionBtn.classList.contains("btn-outline-secondary")) {
			        repetitionBtn.classList.remove("btn-outline-secondary");
			        repetitionBtn.classList.add("btn-success");
                   	 repetitionBtn.disabled = false;
                   	 
				}
				}
		</script>
		
			<div class="row" style="justify-content: center;">
			<div class="col-md-6">
				<div class="line_Style">
					<div class="col-md-3">
						<div class="field_Name">
							비밀번호<span class="red_Color">*</span>
						</div>
					</div>
					<div class="col-md-6">
						<input type="password" class="input_Style" id="input_pwd" placeholder="비밀번호를 입력해주세요." oninput="inputPwd(this.id)" maxlength="12"
							onfocus="this.placeholder=''" autoComplete="off"
							onblur="this.placeholder='비밀번호를 입력해주세요.'" name="memberPwd">
					</div>
					<div class="col-md-2">
						<div class="button_Style"></div>
					</div>
				</div>
			</div>
		</div>
		
		<div class="row" style="justify-content: center;">
			<div class="col-md-6" style="display:flex; justify-content: center;">
					<div class="col-md-3">
						<div class="field_Name">
						</div>
					</div>
					<div class="col-md-6" >
					<p id="pwdWarning" class="red_Color" ></p>
					</div>
					<div class="col-md-2">
						<div class="button_Style">
						</div>
					</div>
				</div>
			</div>
			
			<script>
			function inputPwd(pwd) {
				var pwd = document.getElementById(pwd).value;
				if (!pwd) {
	                pwdWarning.textContent = "";
	                return;
	            }
				if(pwd.length < 8){
				pwdWarning.textContent = "비밀번호는 8자리 이상으로 설정해주세요."
				}else{
				pwdWarning.textContent = "";
				}
			}
			</script>

		<div class="row" style="justify-content: center;">
			<div class="col-md-6">
				<div class="line_Style">
					<div class="col-md-3">
						<div class="field_Name">
							비밀번호 확인<span class="red_Color">*</span>
						</div>
					</div>
					<div class="col-md-6">
						<input type="password" class="input_Style"	id="input_pwdcheck"	oninput="inputPwdCheck(this.id)" maxlength="12"
							placeholder="비밀번호를 한번 더 입력해주세요" onfocus="this.placeholder=''"
							onblur="this.placeholder='비밀번호를 한번 더 입력해주세요.'" autoComplete="off"
							name="memberPwdCheck">
					</div>
					<div class="col-md-2">
						<div class="button_Style"></div>
					</div>
				</div>
			</div>
		</div>
		
		<div class="row" style="justify-content: center;">
			<div class="col-md-6" style="display:flex; justify-content: center;">
					<div class="col-md-3">
						<div class="field_Name">
						</div>
					</div>
					<div class="col-md-6" >
					<p id="pwdCheckWarning" class="red_Color" ></p>
					</div>
					<div class="col-md-2">
						<div class="button_Style">
						</div>
					</div>
				</div>
			</div>
			
		<script>
		function inputPwdCheck(pwdcheck){
		var pwd = document.getElementById("input_pwd").value;
		var pwdcheck = document.getElementById(pwdcheck).value;
		if (!pwdcheck) {
			pwdCheckWarning.textContent = "";
            return;
        }
		if(pwd == pwdcheck){
			pwdCheckWarning.textContent = "비밀번호가 일치합니다.";
			pwdCheckWarning.style.color = "green";
		}else{
			pwdCheckWarning.textContent = "비밀번호가 일치하지 않습니다.";
			pwdCheckWarning.style.color = "red";
		}
	}
		
		</script>
		

		<div class="row" style="justify-content: center;">
			<div class="col-md-6">
				<div class="line_Style">
					<div class="col-md-3">
						<div class="field_Name">
							이름<span class="red_Color">*</span>
						</div>
					</div>
					<div class="col-md-6">
						<input type="text" class="input_Style" placeholder="이름을 입력해주세요" id="input_name" oninput="inputNameCheck(this.id)" maxlength=10;
							onfocus="this.placeholder=''"
							onblur="this.placeholder='이름을 입력해주세요.'" name="memberName">
					</div>
					<div class="col-md-2">
						<div class="button_Style"></div>
					</div>
				</div>
			</div>
		</div>
		
		<div class="row" style="justify-content: center;">
			<div class="col-md-6" style="display:flex; justify-content: center;">
					<div class="col-md-3">
						<div class="field_Name">
						</div>
					</div>
					<div class="col-md-6" >
					<p id="nameWarning" class="red_Color" ></p>
					</div>
					<div class="col-md-2">
						<div class="button_Style">
						</div>
					</div>
				</div>
			</div>
			
		<script>
		function inputNameCheck(name){
		var name = document.getElementById(name).value;
		var re = /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/;
		if (!name) {
			nameWarning.textContent = "";
            return;
        }
		if(re.test(name)){
			nameWarning.textContent = "";
		}else{
			nameWarning.textContent = "이름이 형식이 틀립니다.";
		}
	}
		</script>

		<div class="row" style="justify-content: center;">
			<div class="col-md-6">
				<div class="line_Style">
					<div class="col-md-3">
						<div class="field_Name">
							이메일<span class="red_Color">*</span>
						</div>
					</div>
					<div class="col-md-6">
						<input type="text" class="input_Style" placeholder="이메일을 입력해주세요" id="input_email" oninput="inputEmailCheck(this.id)" maxlength="25"
							onfocus="this.placeholder=''"
							onblur="this.placeholder='이메일을 입력해주세요.'" name="memberEmail">
					</div>
					<div class="col-md-2">
						<div class="button_Style">
						</div>
					</div>
				</div>
			</div>
		</div>
		
			<div class="row" style="justify-content: center;">
			<div class="col-md-6" style="display:flex; justify-content: center;">
					<div class="col-md-3">
						<div class="field_Name">
						</div>
					</div>
					<div class="col-md-6" >
					<p id="emailWarning" class="red_Color" ></p>
					</div>
					<div class="col-md-2">
						<div class="button_Style">
						</div>
					</div>
				</div>
			</div>
		
		<script>
		function inputEmailCheck(email){
		var email = document.getElementById(email).value;
		var email_re = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i;
		if (!email) {
			emailWarning.textContent = "";
            return;
        }
		if(email_re.test(email)){
			emailWarning.textContent = "";
		}else{
			emailWarning.textContent = "이메일 형식이랑 다릅니다.";
		}
		}
		</script>

		<div class="row" style="justify-content: center;">
			<div class="col-md-6">
				<div class="line_Style">
					<div class="col-md-3">
						<div class="field_Name">
							휴대폰<span class="red_Color">*</span>
						</div>
					</div>
					<div class="col-md-6">
						<input type="text" class="input_Style" placeholder="숫자만 입력해주세요" id="input_phone" oninput="inputPhone(this.id)" maxlength="11" 
							onfocus="this.placeholder=''"
							onblur="this.placeholder='숫자만 입력해주세요.'" name="memberPhone">
					</div>
					<div class="col-md-2">
						<div class="button_Style"></div>
					</div>
				</div>
			</div>
		</div>
		
			<div class="row" style="justify-content: center;">
			<div class="col-md-6" style="display:flex; justify-content: center;">
					<div class="col-md-3">
						<div class="field_Name">
						</div>
					</div>
					<div class="col-md-6" >
					<p id="phoneWarning" class="red_Color" ></p>
					</div>
					<div class="col-md-2">
						<div class="button_Style">
						</div>
					</div>
				</div>
			</div>
		
		<script>
		function inputPhone(id){
		var element = document.getElementById(id);
		element.value = element.value.replace(/[^0-9]/gi, "");
		var phone = element.value;
		if (!phone) {
			phoneWarning.textContent = "";
            return;
        }
		if(phone.length < 10){
			phoneWarning.textContent = "핸드폰 번호를 입력해주세요.";
		}else{
			phoneWarning.textContent = "";
		}
		}
		</script>				

		<div class="row" style="justify-content: center;">
			<div class="col-md-6">
				<div class="line_Style">
					<div class="col-md-3">
						<div class="field_Name">
							주소<span class="red_Color">*</span>
						</div>
					</div>
					<div class="col-md-6">
						<!-- 	<input type="text" class="input_Style" id="sample6_postcode"
								placeholder="우편번호"> -->
						<div class="line_Style" style="display:flex; align-items: flex-end">
						<button type="button" class="btn btn-success" style="width:100%; text-align:center;" id="searchButton"
								onclick="execDaumPostcode()" ><span><img src="/resources/img/joinSearchIcon.png" width=20px;/>주소 검색</span></button>
						
						
							<input type="text" class="input_Style" id="input_addr" name="memberAddr" style="display:none;" oninput="addrCheck(this.id)"
								placeholder="주소">
						</div>
						<input type="text" class="input_Style" id="input_addrsub" name="memberAddrsub" style="display:none;" oninput="addrCheck(this.id)"
							placeholder="상세주소">
						<!-- <input type="text" id="sample6_extraAddress" placeholder="참고항목">	 -->
						<div class="mini_Font">
							<span class="ban_Select" style="display:none;" id="noticeSpan" ><span class="red_Color" id="noticeSpan2">*</span>배송지에
								따라 상품 정보가 달라질 수 있습니다.</span>
						</div>
					</div>
					<div class="col-md-2">
						<div class="button_Style">
							<Button type="button" class="btn btn-success" style="display:none;" id="researchButton"
								onclick="execDaumPostcode()" ><span><img src="/resources/img/joinSearchIcon.png" width=20px;/>재검색</span></Button>
						</div>
						<script
							src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
						<script>
							function execDaumPostcode() {
								var width = 400;
								var height = 500;
								new daum.Postcode(
										{
											oncomplete : function(data) {
												// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
													document.getElementById("searchButton").style.display ="none";
													document.getElementById("input_addr").style.display ="block";
													document.getElementById("input_addrsub").style.display ="block";
													document.getElementById("noticeSpan").style.display ="flex";
													document.getElementById("noticeSpan2").style.display ="block";
													document.getElementById("researchButton").style.display ="block";
												// 각 주소의 노출 규칙에 따라 주소를 조합한다.
												// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
												var addr = ''; // 주소 변수
												var extraAddr = ''; // 참고항목 변수

												//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
												if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
													addr = data.roadAddress;
												} else { // 사용자가 지번 주소를 선택했을 경우(J)
													addr = data.jibunAddress;
												}

												// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
												if (data.userSelectedType === 'R') {
													// 법정동명이 있을 경우 추가한다. (법정리는 제외)
													// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
													if (data.bname !== ''
															&& /[동|로|가]$/g
																	.test(data.bname)) {
														extraAddr += data.bname;
													}
													// 건물명이 있고, 공동주택일 경우 추가한다.
													if (data.buildingName !== ''
															&& data.apartment === 'Y') {
														extraAddr += (extraAddr !== '' ? ', '
																+ data.buildingName
																: data.buildingName);
													}
													/*        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
													         if(extraAddr !== ''){
													             extraAddr = ' (' + extraAddr + ')';
													         }
													         // 조합된 참고항목을 해당 필드에 넣는다.
													         document.getElementById("sample6_extraAddress").value = extraAddr; */
												}/*  else {
												document.getElementById("sample6_extraAddress").value = '';}
												
												// 우편번호와 주소 정보를 해당 필드에 넣는다.
												document.getElementById('sample6_postcode').value = data.zonecode; */
												document.getElementById("input_addr").value = addr;
												addrWarning.textContent ="상세주소를 입력해주세요.";
												// 커서를 상세주소 필드로 이동한다.
												document.getElementById("input_addrsub").focus();}}).open({
													    left: (window.screen.width / 2) - (width / 2),
													    top: (window.screen.height / 2) - (height / 2)
												});
							}
						</script>
					</div>
				</div>
			</div>
		</div>
		
		<script>
			function addrCheck(id){
			var addr = document.getElementById(id).value;
			if(addr == ""){
				addrWarning.textContent = "주소는 필수 입력사항입니다."
			}
			else
				addrWarning.textContent = "";
			}
		</script>
		
			<div class="row" style="justify-content: center;">
			<div class="col-md-6" style="display:flex; justify-content: center;">
					<div class="col-md-3">
						<div class="field_Name">
						</div>
					</div>
					<div class="col-md-6" >
					<p id="addrWarning" class="red_Color" ></p>
					</div>
					<div class="col-md-2">
						<div class="button_Style">
						</div>
					</div>
				</div>
			</div>
		
		

		<div class="row" style="justify-content: center;">
			<div class="col-md-6">
				<div class="line_Style">
					<div class="col-md-3">
						<div class="field_Name">성별</div>
					</div>
					<div class="col-md-6" style="display: flex">
						<div class="col-md-4">
							<div class="ban_Select">
								<input type="radio" class="gender_radio" name="memberGender" value="Man" > <span
									class="gender_Font"> 남자</span>
							</div>
						</div>
						<div class="col-md-4">
							<div class="ban_Select">
								<input type="radio" class="gender_radio" name="memberGender" value="WOMAN" > <span
									class="gender_Font"> 여자</span>
							</div>
						</div>
						<div class="col-md-4">
							<div class="ban_Select">
								<input type="radio" class="gender_radio" name="memberGender" value="NONE" checked>
								<span class="gender_Font"> 선택안함</span>
							</div>
						</div>
					</div>
					<div class="col-md-2">
						<div class="button_Style"></div>
					</div>
				</div>
			</div>
		</div>

		<div class="row" style="justify-content: center;">
			<div class="col-md-6">
				<div class="line_Style" style="padding-bottom: 0px;">
					<div class="col-md-3">
						<div class="field_Name">생년월일</div>
					</div>
					<div class="col-md-6">
						<div class="input_Style">
							<div class="col-md-4">
								<input type="text" maxlength='4' class="birth_Input"
									id="input_birthyear" oninput="inputNum(this.id)"
									placeholder="YYYY" onfocus="this.placeholder=''"
									onblur="this.placeholder='YYYY'" name="memberBirthYear">
							</div>
							<span class="ban_Select" style="color: grey">/</span>

							<div class="col-md-4">
								<input type="text" maxlength='2' class="birth_Input"
									id="input_birthmonth" oninput="inputNum(this.id)"
									placeholder="MM" onfocus="this.placeholder=''"
									onblur="this.placeholder='MM'" name="memberBirthMonth">
							</div>
							<span class="ban_Select" style="color: grey">/</span>

							<div class="col-md-4">
								<input type="text" maxlength='2' class="birth_Input"
									id="input_birthday" oninput="inputNum(this.id)"
									placeholder="DD" onfocus="this.placeholder=''"
									onblur="this.placeholder='DD'" name="memberBirthDay">
							</div>
						</div>
					</div>
					<div class="col-md-2">
						<div class="button_Style"></div>
					</div>
				</div>
			</div>
		</div>
	
		<div class="row" style="display: flex; justify-content: center;">		
			<div class="col-md-6" style="display: flex; justify-content: center;">
				<div class="col-md-5" style="display: flex; justify-content: left;">
					<div style="display: flex; justify-content: center;">
						<p id="birthWarning" class="red_Color"></p>
					</div>
				</div>
			</div>
		</div>

		<script>  										
				function inputNum(id) {
				 	year = document.getElementById("input_birthyear").value;
		            month = document.getElementById("input_birthmonth").value;
		            day = document.getElementById("input_birthday").value;
		            
		            var inputBirthmonth = document.getElementById("input_birthmonth");
		            var inputBirthday = document.getElementById("input_birthday");
		           	currentDate = new Date();
		           	if (!year && !month && !day) {
		                birthWarning.textContent = "";
		                return;
		            }
		           		
		           	if(id == "input_birthyear" || id == "input_birthmonth" || id == "input_birthday" || year == "") {
		                if (year < (currentDate.getFullYear() - 100) || year > currentDate.getFullYear()) {
		                    birthWarning.textContent = "태어난 년도를 4자리로 정확히 입력해주세요.";
		                } else if (month < 1 || month > 12) {
		                    birthWarning.textContent = "태어난 월을 다시 확인해주세요.";
		                } else if (day < 1 || day > 31) {
		                    birthWarning.textContent = "태어난 일을 다시 확인해주세요.";
		                } else {
		                	if(year > (currentDate.getFullYear()-14)){
			           			birthWarning.textContent = "14세 이상만 가입 가능합니다.";
			           			}
		                	else{
		                    birthWarning.textContent = "";}
		                }
		            }
		            inputBirthmonth.addEventListener('blur', function() {
		            	if ((month > 1 || month < 12) && month.length == 1){
		            		document.getElementById("input_birthmonth").value = "0"+month;
		            		}
		            	});

		            inputBirthday.addEventListener('blur', function() {
		            	if ((day > 1 || day < 12) && day.length == 1){
		            		document.getElementById("input_birthday").value = "0"+day;
		            		}
		            });
		        }
			</script>

		<div class="row" style="justify-content: center;">
			<div class="col-md-6">
				<div class="black_Line"></div>
			</div>
		</div>

		<div class="row" style="justify-content: center;">
			<div class="col-md-6">
				<div class="agree_Style">
					<div class="col-md-3">
						<div class="field_Name">
							이용약관 동의<span class="red_Color">*</span>
						</div>
					</div>
					<div class="col-md-8"
						style="user-select: none; display: flex; align-items: center">
						<input type="checkbox" id="check_btn" class="agreeCheck" id = "all_checkedBtn"
							onclick="checkAll(this)" /><label for="check_btn"></label> <span
							class="ban_Select" style="font-weight: 600; font-size: 20px;">
							전체 동의합니다.<br>
						</span>
					</div>
				</div>
			</div>
		</div>
		
		<div class="row" style="justify-content: center;">
			<div class="col-md-6" style="display:flex; justify-content: center;">
					<div class="col-md-3">
						<div class="field_Name"></div>
					</div>
					<div class="col-md-8" style="user-select: none; display: flex; align-items: center">
							<p id="agreeWarning" class="red_Color"></p>
					</div>
				</div>
			</div>
		
		<script>
				function checkAll(el){
					const checkBoxes  = document.querySelectorAll('.agreeCheck');
					  checkBoxes.forEach((row)=>{
					    row.checked = el.checked;
					  })
					}
			</script>


		<div class="row" style="justify-content: center;">
			<div class="col-md-6">
				<div class="agree_Style">
					<div class="col-md-3">
						<div class="field_Name"></div>
					</div>
					<div class="col-md-8"
						style="user-select: none; display: flex; align-items: center">
						<div class="mini_Font">
							<span class="ban_Select">선택 항목에 동의하지 않은 경우도 회원가입 및 일반적인
								서비스를 이용할 수 있습니다.</span>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="row" style="justify-content: center;">
			<div class="col-md-6">
				<div class="agree_Style">
					<div class="col-md-3">
						<div class="field_Name"></div>
					</div>
					<div class="col-md-8"
						style="justify-content: space-between; user-select: none;">
						<input type="checkbox" id="check_btn2" class="agreeCheck" onclick="agreeProcess(this.id)" /><label
							for="check_btn2"></label> <span class="ban_Select"
							style="font-weight: 500; font-size: 15px;">이용약관 동의 <span
							class="mini_Font" style="font-size: 15px;">(필수)</span><br></span> <a
							class="terms_Style" id="terms_firstBtn">약관보기 ></a>
					</div>
				</div>
			</div>
		</div>

		<div class="row" style="justify-content: center;">
			<div class="col-md-6">
				<div class="agree_Style">
					<div class="col-md-3">
						<div class="field_Name"></div>
					</div>
					<div class="col-md-8"
						style="justify-content: space-between; user-select: none;">
						<input type="checkbox" id="check_btn3" class="agreeCheck" /><label
							for="check_btn3"></label> <span class="ban_Select"
							style="font-weight: 500; font-size: 15px;">개인정보 수집 이용 동의 <span
							class="mini_Font" style="font-size: 15px;">(선택)</span><br></span> <a
							class="terms_Style" id="terms_secondBtn">약관보기 ></a>
					</div>
				</div>
			</div>
		</div>

		<div class="row" style="justify-content: center;">
			<div class="col-md-6">
				<div class="agree_Style">
					<div class="col-md-3">
						<div class="field_Name"></div>
					</div>
					<div class="col-md-8"
						style="justify-content: space-between; user-select: none;">
						<input type="checkbox" id="check_btn4" class="agreeCheck" onclick="agreeProcess(this.id)" /><label
							for="check_btn4"></label> <span class="ban_Select"
							style="font-weight: 500; font-size: 15px;">본인은 만 14세
							이상입니다. <span class="mini_Font" style="font-size: 15px;">(필수)</span><br>
						</span>
					</div>
				</div>
			</div>
		</div>
		<!-- 모달 부분  -->
	<div class="modal" id="myModal" tabindex="-1" role="dialog" aria-labelledby="ModalLabel" aria-hidden="true" style="user-select:none">
  				<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document" style="min-width:500px;">
    				<div class="modal-content">
      					<div class="modal-header">
        					<h5 class="modal-title" id="ModalLabel" style="font-size:25px; font-weight:600;">약관 보기</h5>
         					 	<span class="close">&times;</span>
      					</div>
      					<div class="modal-body">
      						<div id="terms_first" style="display:none;">
      							<strong style="font-size:20px; font-weight:600;">제1조 [목적]</strong><br/><br/>
		<span style="font-size:12px; font-weight:500;">
		이 약관은 주식회사 마켓그린(이하 주식회사 마켓그린 또는 주식회사 마켓그린이 운영하는 인터넷사이트를 “마켓그린”이라 함)가 
		운영하는 온라인쇼핑몰에서 제공하는 전자상거래 관련 서비스(이하 “서비스”라 함)를 
		이용함에 있어 마켓그린과 이용자의 권리, 의무 및 책임사항을 규정함을 목적으로 합니다.
      	</span>	<br/><br/>
      <strong style="font-size:20px; font-weight:600;">	제2조 [정의]</strong><br/><br/>	
      	<span style="font-size:12px; font-weight:500;">
		1. “사이버몰”이란 마켓그린의 상품 또는 용역(이하 “상품 등” 이라 함)을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 
		상품 등을 거래할 수 있도록 설정한 가상의 영업장(http://www.kurly.com 등 마켓그린가 운영하는 웹사이트 및 모바일 웹, 앱 등을 모두 포함)을 말합니다.<br/>
		2. "이용자"란 마켓그린에 접속하여 이 약관에 따라 마켓그린이 제공하는 서비스를 이용하는 고객을 말합니다.<br/>
		3. “회원”이란 마켓그린에 회원등록을 한 자로서, 계속적으로 마켓그린이 제공하는 서비스를 이용할 수 있는 자를 말합니다.<br/>
		4. “마켓플레이스 서비스”란 마켓그린이 제공하는 통신판매중개 서비스 및 관련 부가서비스 일체를 말합니다.<br/>
		5. “판매자”란 마켓그린에 판매회원으로 회원등록을 하고 마켓그린이 제공하는 통신판매중개서비스를 통하여 상품 등을 판매하는 자로서 판매자용 이용약관(마켓플레이스 판매자용 이용약관)에 
		동의하고 마켓그린과 마켓플레이스 서비스 이용계약을 체결한 자를 말합니다.</span><br/><br/>
		<strong style="font-size:20px; font-weight:600;">제3조 [약관 등의 명시와 설명 및 개정]</strong><br/><br/>					
		<span style="font-size:12px; font-weight:500;">

		① 마켓그린은 이 약관의 내용과 상호 및 대표자 성명, 영업소 소재지 주소(소비자의 불만을 처리할 수 있는 곳의 주소를 포함), 전화번호/모사전송번호/전자우편주소, 
		사업자등록번호, 통신판매업 신고번호, 개인정보 보호책임자 등을 이용자가 쉽게 알 수 있도록 사이버몰의 초기 서비스화면(전면)에 게시합니다. 
		다만, 약관의 내용은 이용자가 연결화면을 통하여 볼 수 있도록 할 수 있습니다.<br/>
		② 마켓그린은 필요한 경우 관련 법령을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.<br/>
		③ 마켓그린이 이 약관을 개정할 경우에는 적용일자 및 개정 내용을 명시하여 사이버몰에 적용일자 7일 이전부터 적용일자 전일까지 공지합니다. 
		다만, 이용자에게 불리하게 약관내용을 변경하는 경우에는 최소한 30일 이상의 사전 유예 기간을 두고 공지합니다.<br/>
		④ 전항에 따라 공지된 적용일자까지 이용자가 명시적으로 거부의사를 표명하지 않을 경우에는 개정된 약관에 동의하는 것으로 간주하며, 변경된 약관에 동의하지 않는 회원은 회원 탈퇴를 요청할 수 있습니다.<br/>
		</span>  						
      						</div>
      						<div  id="terms_second" style="display:none;">
      						<br/><br/>
      						<strong style="font-size:20px; font-weight:600;">개인정보 수집·이용 동의(선택)</strong><br/><br/><br/>
      						<table class="table table-bordered">
							<colgroup>
								<col width="50%">
								<col width="25%">
								<col width="25%">
							</colgroup>
							<thead>
<tr>
<th class="tit1" scope="row">수집 목적</th>
<th class="tit2" scope="row">수집 항목</th>
<th class="tit3" scope="row">보유 기간</th>
</tr>
</thead>
<tbody>
<tr>
<td>맞춤형 서비스 제공</td>
<td><strong>성별*, 생년월일*</strong></td>
<td class="emph">회원 탈퇴<br> 즉시 파기</td>
</tr>
</tbody>
							</table>
      						</div>
      					</div>
    				</div>
  				</div>
			</div>
		
		<script>
		var modal = document.getElementById('myModal');
		var firstTerm = document.getElementById("terms_first");
		var secondTerm = document.getElementById("terms_second");
		
		$('.terms_Style').on('click', function() {
			modal.style.display = 'block';
			var clickedId = $(this).attr('id');
			if (clickedId == "terms_firstBtn"){
			firstTerm.style.display = 'block';
			secondTerm.style.display = 'none';
			}else{
				firstTerm.style.display = "none";
				secondTerm.style.display = "block";
			}
		});
		
		$('.close').on('click', function() {
		    var modal = document.getElementById('myModal');
		    modal.style.display = 'none';
		});
		
		window.onclick = function(event) {
		    var modal = document.getElementById('myModal');
		    if (event.target == modal) {
		        modal.style.display = 'none';
		    }
		}
		
		function agreeProcess(id){	//전부 동의 체크 후 필수 체크 해제 시 전부 해제
		if(document.getElementById("check_btn").checked){
			if(!document.getElementById(id).checked){
				checkAll("check_btn");
			}
		}	//필수 항목 두개 체크시 전부 동의에 체크
		if(document.getElementById("check_btn2").checked && document.getElementById("check_btn4").checked){	
			document.getElementById("check_btn").checked = true;
			}
		}
		
		</script>
		
		<div class="row" style="justify-content: center;">
			<div class="col-md-6"
				style="display: flex; justify-content: center; padding: 40px 0px;">
				<button type="button" class="btn btn-success" id="joinBtn"
					style="width: 240px; height: 56px; font-size:20px;" name="join" >가입하기</button>
			</div>
		</div>
		
		<script>
		$(document).ready(function()
				{
					$('#joinBtn').click(function()
					{	
						var id = document.getElementById("input_id").value;
						var pass = document.getElementById("input_pwd").value;
						var passcheck = document.getElementById("input_pwdcheck").value;
						var name = document.getElementById("input_name").value;
						var email = document.getElementById("input_email").value;
						var phone = document.getElementById("input_phone").value;
						var address = document.getElementById("input_addr").value;
						var address_sub = document.getElementById("input_addrsub").value;
						var gender = document.querySelector('input[name="memberGender"]:checked').value;
						var year = document.getElementById("input_birthyear").value;
						var month = document.getElementById("input_birthmonth").value;
						var day = document.getElementById("input_birthday").value;
						var repetitionBtn = document.getElementById("repetitionBtn");
						var agreebtn = document.getElementById("check_btn");
						
						const re = /^(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z0-9]{6,16}$/;
						
						if(!re.test(id) && id != ""){
						idWarning.style.color="red";
						idWarning.textContent = "6자 이상 16자 이하의 영문 혹은 영문과 숫자";}
						
						else if(id == ""){
							idWarning.style.color = "red";
							idWarning.textContent = "아이디는 필수 입력사항 입니다.";
						}
						else if (id != "" && idWarning.textContent=="" ){
							idWarning.style.color = "red";
							idWarning.textContent = "아이디 중복 검사를 눌러 주세요.";
						}
						
						else if(pwdWarning.textContent != "" || pass == ""){
							pwdWarning.style.color = "red";
							pwdWarning.textContent = "비밀번호를 다시 확인해주세요";
							pwdWarning.focus();
							if(pass ==""){
								pwdWarning.textContent = "비밀번호는 필수 입력사항 입니다.";
							}
						}
						
						else if((pass != passcheck) || passcheck == ""){
							pwdCheckWarning.style.color = "red";
							pwdCheckWarning.textContent = "비밀번호를 다시 입력해주세요";
							pwdCheckWarning.focus();
							if(passcheck ==""){
								idWarning.style.color = "red";
								pwdCheckWarning.textContent = "비밀번호 확인은 필수 입력사항 입니다.";
							}
						}
						
						else if(nameWarning.textContent != "" || name == ""){
							nameWarning.textContent = "입력한 이름을 다시 확인해주세요";
							nameWarning.focus();
							if(name ==""){
								nameWarning.textContent = "이름은 필수 입력사항 입니다.";
							}
						}
						
						else if(emailWarning.textContent != "" || email == ""){
							emailWarning.textContent = "이메일을 다시 확인해주세요";
							emailWarning.focus();
							if(email ==""){
								emailWarning.textContent = "이메일은 필수 입력사항 입니다.";
							}
						}
						
						else if(phoneWarning.textContent != "" || phone == ""){
							phoneWarning.textContent = "휴대폰 번호를 다시 확인해주세요";
							phoneWarning.focus();
							if(phone ==""){
								phoneWarning.textContent = "휴대폰 번호는 필수 입력사항 입니다.";
							}
						} 
						
						else if(address == "" && address_sub == ""){
							addrWarning.textContent = "주소 검색을 해주세요."
						}
						
						else if(address == "" || address_sub == ""){
							addrWarning.textContent = "주소는 필수 입력사항 입니다."
						}
						
						else if((birthWarning.textContent != "") && (year != "" || month != "" || day != "")){
						}
						
						else if(!agreebtn.checked){
							agreeWarning.textContent = "필수 항목은 모두 동의 하셔야 가입이 가능합니다."
						}
							
						else{ 
							if(repetitionBtn.classList.contains("btn-outline-secondary")) {
								 $.ajax({
						                type: "POST",
						                url: "/Join/JoinTry",
								data: {
									    id: id,
									    pass: pass,
									    name: name,
									    email: email,
									    phone: phone,
									    address: address,
									    address_sub: address_sub,
									    gender : gender,
									    year: year,
									    month: month,
									    day: day
									},
								 dataType: "json",
								 success: function(response) {
					          if (response.status === "success") { 
								swal({
	                  			 title: "회원가입에 성공 했습니다.",
	                 			 icon: "info",
	                 			 button: "확인",
	              				 }).then((value) => {
	              					location.replace("/MainPage/MainPage.jsp");
	          			     });		
	   		         }else{
	                    	Warning.textContent = "입력 값을 다시 확인해주세요.";
                 	} },error: function() {
                        alert('서버 오류가 발생했습니다. 다시 시도해 주세요.');
							}
						});
							}}	
					});
				});
					
		function createFunction()
		{
			formJoin.method = "post";
			formJoin.action = "/Join/JoinTry"; 
			formJoin.submit();
			var repetitionBtn = document.getElementById("repetitionBtn");
		    repetitionBtn.disabled = false;
		}
		</script>
		
	</form>
	</main>
	<jsp:include page="/Common/Footer.jsp" />
	<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
	<script src="/resources/bootstrap/js/bootstrap.bundle.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
</body>
</html>