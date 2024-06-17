<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입</title>
<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.css">
<script src="/resources/bootstrap/js/jquery-3.7.1.js"></script>
<script src="https://kit.fontawesome.com/a0b08e370a.js"
	crossorigin="anonymous"></script>
<!-- 	<script>history.scrollRestoration = "manual"</script> -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/fork-awesome@1.2.0/css/fork-awesome.min.css">
<style type="text/css">
.testArea_00 {
	background-color: #47702e;
	border: 1px solid gray;
	color: white;
}

.join-title {
	margin-top: 50px;
	font-size: 50px;
	font-weight: 500;
	text-align: center;
	color: rgb(51, 51, 51);
	user-select: none;
}

.ban_Select {
	-ms-user-select: none;
	user-select: none;
}

.red_Color {
	color: rgb(238, 106, 123);
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

.line_Style {
	display: flex;
	justify-content: center;
	align-items: center;
	width: 100%;
	padding-bottom: 20px;
	min-height: 58px;
}

.button_Style {
	display: flex;
	max-hegiht: 40px;
	min-width: 130px;
	padding-left: 15px;
}

.field_Name {
	font-weight: 700;
	-ms-user-select: none;
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

.mini_Font{	
	margin-top: 5px;
	font-size: 10px;
	color: rgb(102, 102, 102);
	font-weight: 500;
}

.birth_Input{
	border: 0px;
	width: 100%;
	outline:none;
	text-align: center;
	padding-left:10px;
	padding-right:10px;
}

.gender_Font{
	font-size: 15px;
}

[type="radio"] {
        appearance: none;
        width: 13px;
        height: 13px;
        border: 1px solid green;
        border-radius: 50%;
      }

[type="radio"]:checked {
 		appearance: none;
        width: 13px;
        height: 13px;
        box-shadow: 0 0 0 1px white;
        border: 4px solid green;
      }
      
</style>
</head>
<body>
	<jsp:include page="/Common/Header.jsp" />

	<main class="container"style="min-width:1050px;">
		<div class="row">
			<div class="col-md-12 testArea_00">중간제목</div>
		</div>

		<div class="row">
		<div class="col-md-12">
				<div class="join-title">회원가입</div>
			</div>
	</div>
		<div class="row" style="justify-content: center;">	
			<div class="col-md-6" style="justify-content: center;">
				<div class="black_Line">
					<div>
						<span class="red_Color">*</span><span class="ban_Select"> 필수 입력사항</span>
					</div>
				</div>
			</div>
		</div>

		<div class="row" style="justify-content: center;">
			<div class="col-md-6">
				<div class="line_Style">
					<div class="col-md-3">
						<div class="field_Name">
							아이디<span class="red_Color">*</span>
						</div>
					</div>
					<div class="col-md-6">
						<input type="text" class="input_Style" placeholder="아이디를 입력해주세요"
							onfocus="this.placeholder=''"
							onblur="this.placeholder='아이디를 입력해주세요.'" name="memberId">
					</div>
					<div class="col-md-2">
						<div class="button_Style">
							<button type="button" class="btn btn-success">중복확인</button>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="row" style="justify-content: center;">
			<div class="col-md-6">
				<div class="line_Style">
					<div class="col-md-3">
						<div class="field_Name">
							비밀번호<span class="red_Color">*</span>
						</div>
					</div>
					<div class="col-md-6">
						<input type="text" class="input_Style" placeholder="비밀번호를 입력해주세요."
							onfocus="this.placeholder=''"
							onblur="this.placeholder='비밀번호를 입력해주세요.'" name="memberPwd">
					</div>
					<div class="col-md-2">
						<div class="button_Style"></div>
					</div>
				</div>
			</div>
		</div>

		<div class="row" style="justify-content: center;">
			<div class="col-md-6">
				<div class="line_Style">
					<div class="col-md-3">
						<div class="field_Name">
							비밀번호 확인<span class="red_Color">*</span>
						</div>
					</div>
					<div class="col-md-6">
						<input type="text" class="input_Style"
							placeholder="비밀번호를 한번 더 입력해주세요" onfocus="this.placeholder=''"
							onblur="this.placeholder='비밀번호를 한번 더 입력해주세요.'"
							name="memberPwdCheck">
					</div>
					<div class="col-md-2">
						<div class="button_Style"></div>
					</div>
				</div>
			</div>
		</div>

		<div class="row" style="justify-content: center;">
			<div class="col-md-6">
				<div class="line_Style">
					<div class="col-md-3">
						<div class="field_Name">
							이름<span class="red_Color">*</span>
						</div>
					</div>
					<div class="col-md-6">
						<input type="text" class="input_Style" placeholder="이름을 입력해주세요"
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
			<div class="col-md-6">
				<div class="line_Style">
					<div class="col-md-3">
						<div class="field_Name">
							이메일<span class="red_Color">*</span>
						</div>
					</div>
					<div class="col-md-6">
						<input type="text" class="input_Style" placeholder="이메일을 입력해주세요"
							onfocus="this.placeholder=''"
							onblur="this.placeholder='이메일을 입력해주세요.'" name="memberEmail">
					</div>
					<div class="col-md-2">
						<div class="button_Style">
							<button type="button" class="btn btn-success">중복확인</button>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="row" style="justify-content: center;">
			<div class="col-md-6">
				<div class="line_Style">
					<div class="col-md-3">
						<div class="field_Name">
							휴대폰<span class="red_Color">*</span>
						</div>
					</div>
					<div class="col-md-6">
						<input type="text" class="input_Style" placeholder="숫자만 입력해주세요"
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
								<div class="line_Style">
							<input type="text" class="input_Style" id="memberAddr" placeholder="주소"></div> 
							<input type="text" class="input_Style" id="detailAddr" placeholder="상세주소">
					   <!-- <input type="text" id="sample6_extraAddress" placeholder="참고항목">	 -->
						<div class="mini_Font">
						<span class="ban_Select"><span class="red_Color">*</span>배송지에 따라 상품 정보가 달라질 수 있습니다.</span></div>
					</div>
					<div class="col-md-2">
						<div class="button_Style">
						<input type="button" class="btn btn-success" onclick="execDaumPostcode()" value="우편번호 찾기"></div>
						<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
						<script>
							function execDaumPostcode() {
								new daum.Postcode(
										{
											oncomplete : function(data) {
												// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

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
												document.getElementById("memberAddr").value = addr;
												// 커서를 상세주소 필드로 이동한다.
												document.getElementById("detailAddr").focus();}}).open();}
						</script>
					</div>
				</div>
			</div>
		</div>

				<div class="row" style="justify-content: center;">
			<div class="col-md-6">
				<div class="line_Style">
					<div class="col-md-3">
						<div class="field_Name">
							성별
						</div>
					</div>
					<div class="col-md-6" style="display:flex">
						<div class="col-md-4">
						<div class="ban_Select">
					<input type="radio" name="memberGender" value="man">
					<span class="gender_Font"> 남자</span>
					</div>
					</div>
					<div class="col-md-4">
					<div class="ban_Select">
					<input type="radio" name="memberGender" value="woman">
					<span class="gender_Font"> 여자</span>
					</div>
					</div>
					<div class="col-md-4">
					<div class="ban_Select">
					<input type="radio" name="memberGender" value="noSelect" checked>
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
				<div class="line_Style">
					<div class="col-md-3">
						<div class="field_Name">
							생년월일
						</div>
					</div>
					<div class="col-md-6">
						<div class="input_Style">
							<div class="col-md-4">
								<input type="text" class="birth_Input" placeholder="YYYY"
							onfocus="this.placeholder=''"
							onblur="this.placeholder='YYYY'" name="memberBirthYear">
							</div><span class="ban_Select" style="color:grey">/</span>
							<div class="col-md-4">
								<input type="text" class="birth_Input" placeholder="MM"
							onfocus="this.placeholder=''"
							onblur="this.placeholder='MM'" name="memberBirthMonth">
							</div><span class="ban_Select" style="color:grey">/</span>
							<div class="col-md-4">
								<input type="text" class="birth_Input" placeholder="DD"
							onfocus="this.placeholder=''"
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
		
			<div class="row" style="justify-content: center;">
				<div class="col-md-6">
					<div class="black_Line">
				</div>
			</div>
		</div>
		
			<div class="row" style="justify-content: center;">
			<div class="col-md-6">
				<div class="line_Style">
					<div class="col-md-3">
						<div class="field_Name">
							이용약관 동의<span class="red_Color">*</span>
						</div>
					</div>
					<div class="col-md-8">
						<input type="checkbox"><span class="ban_Select" style="font-weight:500; font-size:25px;"> 전체 동의합니다.<br></span>
						<div class="mini_Font">
						<span class="ban_Select">선택 항목에 동의하지 않은 경우도 회원가입 및 일반적인 서비스를 이용할 수 있습니다.</span>
					</div>
					</div>
				</div>
			</div>
		</div>
		
	</main>
	<jsp:include page="/Common/Footer.jsp" />
	<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
	<script src="/resources/bootstrap/js/bootstrap.bundle.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
</body>
</html>