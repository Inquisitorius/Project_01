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
	user-select: none;
}

.black_Line {
	padding-bottom: 10px;
	border-bottom: 2px solid rgb(51, 51, 51);
	margin-bottom: 10px;
}

.qna-answer {
    display: none;
  	padding: 10px;
    background-color: #f0f0f0;
    width:100%;
    font-size:12px;
    user-select:none;
    border:none;
}

.qna-content {
    cursor: pointer;
    background-color: #f0f0f0;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    font-size:12px;
}

.column_Style{
	text-align:center;
	font-weight:600;
	text-align:center;
	user-select:none;
}

.qna_Item{
	font-size:12px;
	text-align:center;
	user-select:none;
	width:100%;
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

.close {
  color: #aaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: black;
  text-decoration: none;
  cursor: pointer;
}

.form-inputText {
    width: 100%;
    padding: 10px;
    font-size: 14px;
    border: 1px solid #ced4da;
    border-radius: 3;
    box-shadow: none;
    resize: none; 
    
  }
 .form-inputText:focus {
    box-shadow: none;
    outline: none;
    border: 1px solid #ced4da;
}

</style>
<head>
<meta charset="UTF-8">
<title>자주 묻는 질문</title>
</head>
<body>
<% 
int userAuth = 0;;
	if(session.getAttribute("auth_type") != null){
  	userAuth = (int)session.getAttribute("auth_type"); }
%>
<main class="container">
		<div class="row" style="justify-content: center;">
			<div class="col-md-12">
			<div class="row" style="justify-content: center;">
			<div class="col-md-10">
				<div class="Main_Title">자주 묻는 질문</div>
			</div>
		</div>
		</div>
			<div class="col-md-10" style="justify-content: center;">
				<div class="black_Line">
					<div></div>
				</div>
			</div>
		</div>
		<!-- 상단 내용 부분  -->	
			<div class="row" style="justify-content: center; height:600px;">
			<div class="col-md-10">
			<table class="table">
					<thead>
						<tr>
							<th class="col-md-2 column_Style">번호</th>
							<th class="col-md-3 column_Style">카테고리</th>
							<th class="col-md-7 column_Style">제목</th>
						</tr>
					</thead>
				
		<!-- 게시 질문 부분  -->	
				<tbody id="tablebody">
					<tr class="qna_Item" data-target="#content1">
							<td class="col-md-2">1</td>
							<td class="col-md-3">회원</td>
							<td class="col-md-7">회원 정보를 바꾸고 싶습니다.</td>
					</tr>
					<tr>
						<td colspan="3" style="border:none;">
						<div class="col-md-12" style="display:flex;">
						<div class="qna-answer" id="content1">
							■ 회원정보 변경 안내<br/>
 							- 아래 경로를 통해 회원정보를 직접 변경하실 수 있습니다.<br/>
 							홈페이지 우측 상단 마이페이지 선택 후 내 정보 수정 <br/>
							- 수정가능 항목 : 비밀번호/이메일주소/휴대폰번호/생년월일/성별<br/>
 							▣ 아이디, 이름은 수정 불가합니다.<br/>
 							▣ 구매 이후, 주문건에 대한 배송지 변경은 고객센터로 문의 바랍니다.
						</div>
						</div>
						</td>
					</tr>
				</tbody>
			</table>	
			</div>
			</div>
			<script>
			var qlist;
			$.ajax({
			    type: "get",
			    url: "/MyPageContent/QuestionShow",
			    dataType: "json",
			    success: function(response) {
			        if (response.status === "success") {
			        	qlist = response.qlist;
			            showQuestion();
			           
			        } else {
			            // 실패 시 처리
			        }
			    },
			    error: function() {
			        alert('서버 오류가 발생했습니다. 다시 시도해 주세요.');
			    }
			});

			function showQuestion() {
			    var tableBody = document.getElementById("tablebody");
			    // 기존 테이블 내용 초기화
			    tableBody.innerHTML = "";
			    // 데이터 반복문 처리
			    for (var i = 0; i < qlist.length; i++) {
			        var row = document.createElement("tr");
			        // 각 행에 데이터 추가
			        row.innerHTML = `
			            <td>${qlist[i].qdx}</td>
			            <td>${qlist[i].que_category}</td>
			            <td>${qlist[i].que_title}</td>
			            <td>${qlist[i].que_contents}</td>
			        `;
			        // 테이블에 행 추가
			        tableBody.appendChild(row);
			    }
			}
			</script>
			
			<!-- 모달 부분  -->
			<div class="row" style="justify-content: center;">
				<div class="col-md-6" style="justify-content: center;">
					<button type="button" class="btn btn-success" id="addQnaBtn" style="width:100%; display:none;"> 질문 등록 </button>
				</div>
			</div>
			
  			<div class="modal" id="myModal" tabindex="-1" role="dialog" aria-labelledby="ModalLabel" aria-hidden="true" style="user-select:none">
  				<div class="modal-dialog modal-dialog-centered" role="document" style="min-width:700px;">
    				<div class="modal-content">
      					<div class="modal-header">
        					<h5 class="modal-title" id="ModalLabel" style="font-size:25px; font-weight:600;">질문 등록</h5>
         					 	<span class="close">&times;</span>
      					</div>
      					<div class="modal-body">
        				<form>
        					<div class="form-group">
        						<label for="recipient-name" class="col-form-label">카테고리</label>
          					 	<input type="text" class="form-inputText" id="input_category" placeholder='카테고리를 입력해주세요.'>
    				    		</div>
          					<div class="form-group">
            					<label for="recipient-name" class="col-form-label">제목</label>
          					 	<input type="text" class="form-inputText" id="input_title" placeholder='제목을 입력해주세요.'>
    				    		</div>
         				 <div class="form-group">
           				 <label for="message-text" class="col-form-label">내용</label>
           				 <textarea class="form-inputText" id="input_contents" style="height:150px;" placeholder='내용을 입력해주세요.'></textarea>
         			 </div>
       					 </form>
      				</div>
      					<div class="modal-footer">
       						 <button type="button" class="btn btn-success" data-dismiss="modal" id="uploadBtn">등록</button>
        					<button type="button" class="btn btn-secondary" id="cancelBtn">취소</button>
     					</div>
    				</div>
  				</div>
			</div>
			
		<script>
		if("<%= userAuth %>" == 3){			//관리자용 질문 등록
			document.getElementById("addQnaBtn").style.display = "block";
			$('#addQnaBtn').on('click', function() {
				var modal = document.getElementById('myModal');

				
				modal.style.display = 'block';
				$('.close').on('click', function() {
				    var modal = document.getElementById('myModal');
				    modal.style.display = 'none';
				});
				
			/* 모달 밖 부분 클릭시 닫기, 오클릭 가능성때문에 주석 	window.onclick = function(event) {
				    var modal = document.getElementById('myModal');
				    if (event.target == modal) {
				        modal.style.display = 'none';
				    }
				} */
				$('#cancelBtn').on('click',function(){
					 modal.style.display = 'none';
				});
				
				$('#uploadBtn').on('click',function(){
					var que_category = document.getElementById("input_category").value;
					var que_title = document.getElementById("input_title").value;
					var que_contents= document.getElementById("input_contents").value;
					
					if(que_category != "" && que_title != "" && que_contents != ""){
					$.ajax({
		             	type: "POST",
		                url: "/MyPageContent/QuestionUpload",
						data: {que_category:que_category , 
							   que_title : que_title,
							   que_contents : que_contents
						},
					 	dataType: "json",
				 		success: function(response) {
	      	 		if (response.status === "success") { 
					swal({
					title: "질문등록에 성공했습니다.",
					icon: "info",
					button: "확인",
				 	}).then((value) => {
				 		var dto = response.dto;
				 		
				 		modal.style.display = "none";
		   		  });		
			 }else{
				
			} },error: function() {
			 alert('서버 오류가 발생했습니다. 다시 시도해 주세요.');
				}
				});
					
					}
				});
			});
		}
		
		
		
		$('.qna_Item').on('click', function() {
         var target = $(this).data('target'); // Get the target content ID
         var $content = $(target); // Find the content to slide
         
         if ($content.is(':visible')) {
            $content.slideUp(); // Hide the content if it is visible
         } else {
            // Optionally: Close other open items if single open item behavior is needed
            $('.qna-answer').slideUp(); // Hide all other open contents

            // Show the clicked content
            $content.slideDown();
         }
      });   
		</script>	
</main>
</body>
</html>