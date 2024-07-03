<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
<title>배송지 변경</title>
<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.css">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://kit.fontawesome.com/a0b08e370a.js" crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/fork-awesome@1.2.0/css/fork-awesome.min.css">
<style type="text/css">
.Main_Title {
	margin-top: 100px;
	margin-bottom:100px;
	font-size: 30px;
	font-weight: 600;
	text-align: center;
	color: rgb(51, 51, 51);
	user-select: none;
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
	min-height: 58px;
	margin:15px;
}

.input_Style {
	width: 100%;
	height: 40px;
	display: flex;
	border: 1px solid rgb(204, 204, 204);
	border-radius: 3px;
	align-items: center;
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
<% String addr = (String)session.getAttribute("address"); 
	String addr_sub = (String)session.getAttribute("address_sub");
%>

<main class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="Main_Title">배송지 정보</div>
			</div>
		</div>
		
		<div class="row" style="justify-content: center;">
		<div class="line_Style">
				<div class="col-md-8">
				<input class="form-control" type="text" id="input_addr" name="memberAddr" oninput="addrCheck(this.id)"
					placeholder= "<%= addr %>" value="<%= addr %>"  disabled>
				</div>
		</div>
		</div>
		
		<div class="row" style="justify-content: center;">
		<div class="line_Style">
				<div class="col-md-8">
				<input type="text" class="input_Style" id="input_addrsub" name="memberAddrsub" oninput="addrCheck(this.id)"
								placeholder="<%= addr_sub %>">
				</div>
		</div>
		</div>
		
		<div class="row" style="justify-content: center;">
				<div class="col-md-8">
				<p id="addrWarning" class="red_Color" ></p>
				</div>
		</div>
		
		<script>
			function addrCheck(id){
			var addr = document.getElementById(id).value;
			if(addr == ""){
				addrWarning.textContent = "상세주소는 필수 입력사항입니다."
			}
			else
				addrWarning.textContent = "";
			}
		</script>
		
		
		<div class="row" style="justify-content: center;">
		<div class="line_Style">
				<div class="col-md-8">
				<button type="button" class="btn btn-success" style="width:100%; text-align:center;" id="searchButton"
								onclick="execDaumPostcode()" ><span><img src="/resources/img/joinSearchIcon.png" width=20px;/>주소 검색</span></button>
				</div>
		</div>
		</div>
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
						<script>
							function execDaumPostcode() {
								var width = 400;
								var height = 500;
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
												document.getElementById("input_addr").value = addr;
												addrWarning.textContent ="상세주소를 입력해주세요.";
												// 커서를 상세주소 필드로 이동한다.
												document.getElementById("input_addrsub").focus();}}).open({
													    left: (window.screen.width / 2) - (width / 2),
													    top: (window.screen.height / 2) - (height / 2)
												});
							}
							
			</script>
			
		<div class="row" style="justify-content: center;">
		<div class="line_Style" style="margin:0px;">
				<div class="col-md-8">
				<button type="button" class="btn btn-success" style="width:100%;" id="confirmBtn" onclick="changeAddr()">확인</button>
				</div>
		</div>
		</div>
		
		<script>
			function changeAddr(){
				var id = "<%= (String)session.getAttribute("id") %>";
				var address = document.getElementById("input_addr").value;
				var address_sub = document.getElementById("input_addrsub").value;
				var changedData = {id:id};
				
				if(address == "<%= addr %>" && address_sub == "<%= addr_sub %>"){
					addrWarning.textContent = "기존 주소와 동일합니다."
				}
				
				if(address_sub != "" ){
				if (address != "<%= addr %>" || address_sub != "<%= addr_sub %>"){
					changedData.address = address;
					changedData.address_sub = address_sub;
					Swal.fire({
	         			 title: "변경 사항을 저장하시겠습니까?",
	        			 icon: "info",
	        			 confirmButtonColor: 'green	',
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
	     						title: "배송지 수정에 성공 했습니다.",
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