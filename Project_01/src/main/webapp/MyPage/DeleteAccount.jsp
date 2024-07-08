<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원 탈퇴</title>
<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.css">
<script src="/resources/bootstrap/js/jquery-3.7.1.js"></script>
<script src="https://kit.fontawesome.com/a0b08e370a.js"
	crossorigin="anonymous"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/fork-awesome@1.2.0/css/fork-awesome.min.css">
<style type="text/css">
.Main_Title {
	margin-top: 100px;
	margin-bottom:40px;
	font-size: 30px;
	font-weight: 600;
	text-align: center;
	color: rgb(51, 51, 51);
	user-select: none;
}

.line_Style {
	display:flex;
	font-size:12px;
	margin-bottom:10px;
}

.field_Name {
	font-weight: 700;
	user-select: none;
	height:100%;
	align-items: center
}

.form-select:focus {
    box-shadow: none;
    outline: none;
    border: 1px solid #ced4da;
}

.form-control:focus{
 	box-shadow: none;
    outline: none;
    border: 1px solid #ced4da;
}

</style>
</head>
<body>
<% String userId = (String)session.getAttribute("id"); %>
<main class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="Main_Title">회원 탈퇴</div>
			</div>
		</div>
		
		<div class="row" style="justify-content: center; margin-bottom:15px;">
				<div class="col-md-10">
					<div style="font-size:12px;">
							<h2 style="font-size: 25px; margin-bottom:15px;">탈퇴 안내</h2>
							<p>회원탈퇴를 신청하기 전에 안내 사항을 꼭 확인해주세요.</p>
					</div>		
		
				<div class="line_Style">
							<p style="font-weight:600">사용하고 계신 아이디(<p>
							<p style="color:green; font-weight:600"><%= userId %></p>
							<p style="font-weight:600;">)는 탈퇴할 경우</p> &nbsp; <p style="font-weight:600; color:red">복구가 불가능합니다.</p>
				</div>
		
				<div class="line_Style">
							<p style="color : red; font-weight:600">탈퇴한 아이디는 본인과 타인 모두 복구가 불가<p>
							<p>하오니 신중하게 선택하시기 바랍니다. </p>
				</div>

				<div class="line_Style">
							<p style="font-weight:600">탈퇴 후 회원정보 모두 삭제됩니다.</p>
				</div>
		
			</div>
		</div>
		
		<div class="row" style="justify-content: center;">
				<div class="col-md-10" style="font-size:12px;">
							<h2 style="font-size: 25px; margin-bottom:15px;">탈퇴 사유</h2>
							<p>탈퇴를 생각하신 이유를 알려주세요.</p>
		<select class="form-select" aria-label="ReseachSelect" style="box-shadow: none; margin-bottom:10px;">
  			<option selected>다른 사이트를 더 자주 이용함</option>
 		    <option value="1">웹사이트나 앱의 사용이 불편함</option>	
  			<option value="2">개인적인 사정으로 인해 사용하지 않음</option>
  			<option value="3">고객 서비스의 응대나 처리 속도에 불만족</option>
  			<option value="4">개인 정보 보호</option>
		</select>		
			<p>앞으로의 사이트 운영을 위해 개선사항이 있으시면 알려주시기 바랍니다.(선택)</p>
  			<textarea class="form-control" placeholder="이곳에 남겨주세요." id="suggestions_Field" style="height: 100px; resize: none;"></textarea>
			</div>		
		</div>		
		
		<div class="row" style="justify-content: center;">
			<div class="col-md-6"
				style="display: flex; justify-content: center; padding: 40px 0px;">
				<button type="button" class="btn btn-success" id="joinBtn" onclick="DeleteTry()"
					style="width: 220px; height: 40px; font-size:20px;" name="join" >회원 탈퇴</button>
			</div>
		</div>	
		
		<script>
			function DeleteTry(){
				var id = "<%= (String)session.getAttribute("id") %>";
				var Data = {id:id};
				
				Swal.fire({
        			 title: "정말로 탈퇴하시겠습니까?",
       			 icon: "info",
       			 confirmButtonColor: 'red',
       			 showCancelButton: true,
       			 confirmButtonText: "확인",
       			 cancelButtonText: '취소'
    				 }).then((result) => {
    					if (result.isConfirmed) {
    						$.ajax({
    			             	type: "POST",
    			                url: "/MyPageContent/DeleteTry",
    							data: Data,
    						 	dataType: "json",
    					 		success: function(response) {
    		      	 	if (response.status === "success") { 
    						swal({
    						title: "회원 탈퇴에 성공했습니다.",
    						icon: "info",
    						button: "확인",
    					 	}).then((value) => {
    					 		location.replace("/MainPage/MainPage.jsp");
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
		</script>
</main>
</body>
</html>