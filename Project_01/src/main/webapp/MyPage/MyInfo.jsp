<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
<title>내 정보 확인</title>
<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.css">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://kit.fontawesome.com/a0b08e370a.js" crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/fork-awesome@1.2.0/css/fork-awesome.min.css">
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

.input_Style {
	width: 100%;
	height: 38px;
	display: flex;
	border: 1px solid rgb(204, 204, 204);
	border-radius: 3px;
	padding: 0px 15px;
	align-items: center;
}

.field_Name {
	font-weight: 700;
	user-select: none;
	height:100%;
	align-items: center
}

.red_Color {
	color: red;
	user-select: none;
	font-size:12px;
	margin-bottom: 0px;
}

.line_Style {
	display: flex;
	justify-content: center;
	align-items: center;
	width: 100%;
	padding-bottom: 5px;
	min-height: 58px;
	margin:5px;
}

.gender_Font {
	font-size: 15px;
}

.ban_Select {
	user-select: none;
}

.birth_Input {
	border: 0px;
	width: 100%;
	outline: none;
	text-align: center;
	padding-left: 10px;
	padding-right: 10px;
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
</style>
</head>
<body>
<% 
   String userId = (String)session.getAttribute("id"); 
   String userPass = (String)session.getAttribute("pass"); 
   String userName = (String)session.getAttribute("name");
   String userEmail = (String)session.getAttribute("email");
   String userPhone = (String)session.getAttribute("phone");
   String userGender = (String)session.getAttribute("gender");
   String userDate = (String)session.getAttribute("birthdate");
   userDate = userDate.replaceAll("(\\d{4})(\\d{2})(\\d{2})", "$1-$2-$3");
   
   String year = null;
   String month = null;
   String day = null;
   
   if(userDate != null){
   year = userDate.substring(0,4);
   month = userDate.substring(5,7);
   day = userDate.substring(8,10);
   }
   
   if(month != null && month.length() < 2){
	   month = "0"+month;
   }
   if(month != null && day.length() < 2){
	   day = "0"+day;
   }
%>

	
<main class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="Main_Title">내 정보</div>
			</div>
		</div>
		<div class="row" style="justify-content: center;">
			<div class="col-md-10" style="justify-content: center;">
				<div class="black_Line">
					<div>
						<span class="red_Color">*</span><span class="ban_Select">
							필수 입력사항</span>
					</div>
				</div>
			</div>
		</div>
		
		<div class="row" style="justify-content: center;">
		<div class="line_Style">
				<div class="col-md-3">
						<div class="field_Name" style = "display:flex;">
							아이디
						</div>
				</div>
				<div class="col-md-6">
					<input class="form-control" id="input_id" type="text" placeholder="<%= userId %>" aria-label="<%= userId %>" disabled>
				</div>
		</div>
		</div>
		
		<div class="row" style="justify-content: center;">
		<div class="line_Style">
				<div class="col-md-3">
						<div class="field_Name" style = "display:flex;">
							비밀번호<span class="red_Color">*</span>
						</div>
				</div>
				<div class="col-md-6">
					<input type="password" class="input_Style" id="input_pwd" placeholder="비밀번호 변경 시 입력해주세요." oninput="inputPwd(this.id)" maxlength="12"
							onfocus="this.placeholder=''" autoComplete="off"
							onblur="this.placeholder='비밀번호 변경 시 입력해주세요.'" name="memberPwd">
				</div>
		</div>
		</div>
		
		<div class="row" style="justify-content: center;">
				<div class="col-md-3">
				</div>
				<div class="col-md-6">
				<p id="pwdWarning" class="red_Color" ></p>
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
				}else if(pwd == "<%= userPass %>") {
					pwdWarning.textContent = "기존 비밀번호와 동일합니다."
				}
				else{
				pwdWarning.textContent = "";
				}
			}
		</script>
		
		<div class="row" style="justify-content: center;">
		<div class="line_Style">
				<div class="col-md-3">
						<div class="field_Name" style = "display:flex;">
							비밀번호 확인<span class="red_Color">*</span>
						</div>
				</div>
				<div class="col-md-6">
					<input type="password" class="input_Style"	id="input_pwdcheck"	oninput="inputPwdCheck(this.id)" maxlength="12"
							placeholder="비밀번호를 한번 더 입력해주세요" onfocus="this.placeholder=''"
							onblur="this.placeholder='비밀번호를 한번 더 입력해주세요.'" autoComplete="off"
							name="memberPwdCheck">
		</div>
		</div>
		
		<div class="row" style="justify-content: center;">
				<div class="col-md-3">
				</div>
				<div class="col-md-6">
				<p id="pwdCheckWarning" class="red_Color" ></p>
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
		<div class="line_Style">
				<div class="col-md-3">
						<div class="field_Name" style = "display:flex;">
							이름
						</div>
				</div>
				<div class="col-md-6">
				<input class="form-control" id="input_name" type="text" placeholder="<%= userName %>" aria-label="<%= userName %>" disabled>
				</div>
		</div>
		</div>
		
		<div class="row" style="justify-content: center;">
		<div class="line_Style">
				<div class="col-md-3">
						<div class="field_Name" style = "display:flex;">
							이메일<span class="red_Color">*</span>
						</div>
				</div>
				<div class="col-md-6">
						<input type="text" class="input_Style" placeholder="<%= userEmail %>" id="input_email" oninput="inputEmailCheck(this.id)" maxlength="25"
							onfocus="this.placeholder=''"
							onblur="this.placeholder='<%= userEmail %>'" name="memberEmail">
				</div>
		</div>
		</div>
		
		<div class="row" style="justify-content: center;">
				<div class="col-md-3">
				</div>
				<div class="col-md-6">
				<p id="emailWarning" class="red_Color" ></p>
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
		if(email == "<%= userEmail %>") {
			emailWarning.textContent = "기존 이메일 주소와 동일합니다."
		}
		}
		</script>
		
		<div class="row" style="justify-content: center;">
		<div class="line_Style">
				<div class="col-md-3">
						<div class="field_Name" style = "display:flex;">
							휴대폰<span class="red_Color">*</span>
						</div>
				</div>
				<div class="col-md-6">
						<input type="text" class="input_Style" placeholder="<%= userPhone %>" id="input_phone" oninput="inputPhone(this.id)" maxlength="11"
							onfocus="this.placeholder=''"
							onblur="this.placeholder='<%= userPhone %>'" name="memberPhone">
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
			phoneWarning.textContent = "변경 할 핸드폰 번호를 정확히 입력해주세요.";
		}else if(phone == "<%= userPhone %>") {
			phoneWarning.textContent = "기존 번호와 동일합니다."
		} 
		else{
			phoneWarning.textContent = "";
		}
		}
		</script>
		
		<div class="row" style="justify-content: center;">
				<div class="col-md-3">
				</div>
				<div class="col-md-6">
				<p id="phoneWarning" class="red_Color" ></p>
				</div>
		</div>
		
		<div class="row" style="justify-content: center;">
		<div class="line_Style">
				<div class="col-md-3">
						<div class="field_Name" style = "display:flex;">
							성별
						</div>
				</div>
				<div class="col-md-6" style="display: flex">
				<div class="col-md-4">
							<div class="ban_Select">
								<input type="radio" class="gender_radio" name="memberGender" value="MAN" id = "MAN" > <span
									class="gender_Font"> 남자</span>
							</div>
						</div>
						<div class="col-md-4">
							<div class="ban_Select">
								<input type="radio" class="gender_radio" name="memberGender" value="WOMAN" id="WOMAN"> <span
									class="gender_Font"> 여자</span>
							</div>
						</div>
						<div class="col-md-4">
							<div class="ban_Select">
								<input type="radio" class="gender_radio" name="memberGender" value="NONE" id="NONE" >
								<span class="gender_Font"> 선택안함</span>
							</div>
						</div>
				</div>
		</div>
		</div>
		
		<script>
        var gender = "<%= userGender %>";
        document.getElementById(gender).checked = true;
    	</script>
		
			<div class="row" style="justify-content: center;">
		<div class="line_Style">
				<div class="col-md-3">
						<div class="field_Name" style = "display:flex;">
							생년월일
						</div>
				</div>
				<div class="col-md-6" style="display: flex">
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
		</div>
		</div>
		
		<script>
		var inputyear = document.getElementById("input_birthyear");
		var inputmonth = document.getElementById("input_birthmonth");
		var inputday = document.getElementById("input_birthday");
		
		if("<%= year %>" != ""){
			inputyear.placeholder = "<%= year %>";
			inputyear.onblur = function() {
			    this.placeholder = "<%= year %>";
			};
		}
		if("<%= month %>" != ""){
			inputmonth.placeholder = "<%= month %>";
			inputmonth.onblur = function() {
			    this.placeholder = "<%= month %>";
			};
		}
		
		if("<%= day %>" != ""){
			inputday.placeholder = "<%= day %>";
			inputday.onblur = function() {
			    this.placeholder = "<%= day %>";
			};
		}
		</script>
		
				<div class="row" style="justify-content: center;">
				<div class="col-md-3">
				</div>
				<div class="col-md-6">
				<p id="birthWarning" class="red_Color" ></p>
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
		                    birthWarning.textContent = "";
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
		            
		         	if(year == "<%= year %>" && month == "<%= month %>" && day == "<%= day %>" ){
		           		birthWarning.textContent = "기존에 입혁한 생년월일과 일치합니다.";
		           	}
		        }
			</script>
		
		
		<div class="row" style="justify-content: center;">
			<div class="col-md-6"
				style="display: flex; justify-content: center; padding: 40px 0px;">
				<button type="button" class="btn btn-success" id="joinBtn" onclick="changeCheck()"
					style="width: 220px; height: 50px; font-size:20px;" name="join" >정보수정</button>
			</div>
		</div>	
		<script>
		function changeCheck(){
		var id = "<%= (String)session.getAttribute("id") %>";
		var pass = document.getElementById("input_pwd").value;
		var pwdcheck = document.getElementById("input_pwdcheck").value;	
		var email = document.getElementById("input_email").value;
		var phone = document.getElementById("input_phone").value;
		var gender = document.querySelector('input[name="memberGender"]:checked').value;
		var year = document.getElementById("input_birthyear").value;
		var month = document.getElementById("input_birthmonth").value;
		var day = document.getElementById("input_birthday").value;
		var birthdate = year+month+day;
		var userDate = "<%= year %>"+"<%= month %>"+"<%= day %>";
		
		var changedData = {id:id};

		if (pass != "" && pass !== "<%= userPass %>") {
			changedData.pass = pass;
		}
		if (email != "" && email !== "<%= userEmail %>") {
		    changedData.email = email;
		}
		if (phone != "" && phone !== "<%= userPhone %>") {
		    changedData.phone = phone;
		}
		if (gender != "" && gender !== "<%= userGender %>") {
		    changedData.gender = gender;
		}
		if (birthdate != "" && birthdate !== "<%= userDate %>") {
		    changedData.birthdate = birthdate;
		}
		
		if(pass != "" || email != "" || phone != "" || gender != "<%= userGender %>" || birthdate != ""){
			if(pwdWarning.textContent != ""){}
			else if(pwdCheckWarning.textContent != ""){}
			else if(emailWarning.textContent != ""){}
			else if(phoneWarning.textContent != ""){}
			else if(birthWarning.textContent != ""){}
			
			else{
				Swal.fire({
         			 title: "변경 사항을 저장하시겠습니까?",
        			 icon: "info",
	        		 confirmButtonColor: 'green',
        			 showCancelButton: true,
        			 confirmButtonText: "확인",
        			 cancelButtonText: '취소'
     				 }).then((result) => {
     					if (result.isConfirmed) {
     						$.ajax({
     			             	type: "POST",
     			                url: "/MyPageContent/UpdateTry",
     							data: changedData,
     						 	dataType: "json",
     					 		success: function(response) {
     		      	 	if (response.status === "success") { 
     						swal({
     						title: "회원정보 수정에 성공 했습니다.",
     						icon: "info",
     						button: "확인",
     					 	}).then((changedData) => {
     					 		
     			   		  });		
     				 }else{
     				} },error: function() {
     				 alert('서버 오류가 발생했습니다. 다시 시도해 주세요.');
     					}
     					});
                        } else if (result.dismiss === Swal.DismissReason.cancel) {
                        }
 			   		 });		
				}
			} 
		}
		</script>
</main>	
</body>
</html>