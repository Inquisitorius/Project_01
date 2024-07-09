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
    background-color: #f0f0f0;
    font-size:12px;
    user-select:none;
    border:none;
    padding:10px;
}

.qna_Item{
	vertical-align: middle;
	cursor: pointer;
	font-size:14px;
	text-align:center;
	user-select:none;
	width:100%;
}
.column_Style{
	text-align:center;
	font-weight:600;
	text-align:center;
	user-select:none;
	
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

.page-link{
	color: green;
	cursor : pointer;
	user-select: none;
}

.page-link:hover{
	color:green;
}

.pagination {
    --bs-pagination-focus-box-shadow: none;
    --bs-pagination-focus-color: black
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
			<div class="row" style="justify-content: center; min-height:550px;">
			<div class="col-md-10">
			<table class="table">
					<thead>
						<tr>
							<!-- <th class="col-md-2 column_Style">번호</th> -->
							<th class="col-md-3 column_Style">카테고리</th>
							<th class="col-md-7 column_Style">제목</th>
						</tr>
					</thead>
				
		<!-- 게시 질문 부분  -->	
				<tbody id="tablebody">
				</tbody>
			</table>	
			</div>
			</div>
			<div class="row" style="justify-content: center;">
			<div class="col-md-7" style="display:flex; justify-content: center;">
				<nav aria-label="Page navigation example">
  					<ul class="pagination" id="pagingbody">
  				</ul>
				</nav>
			</div>	
			</div>
			<script>
			var qlist = [];
			var postsPerPage = 10;
			var totalPosts ;
			var currentPage = 1 ;
			var totalPages;
			var pagingBody = document.getElementById("pagingbody");
			var pagingNum = 0;
			var pagesPerOnece = 5 ;
			
			updateCheck();
			
			function updateCheck(){
			$.ajax({
			    type: "get",
			    url: "/MyPageContent/QuestionShow",
			    dataType: "json",
			    success: function(response) {
			       if (response.status === "success") {
			       qlist = response.qlist;
			       totalPosts = response.count;
			       totalPages = Math.ceil(totalPosts/postsPerPage);
			       
			       if (qlist !== "") {
	                    showQuestion();
	                    addPageBtn();
	                    }
			       }}, error: function() {
			       alert('서버 오류가 발생했습니다. 다시 시도해 주세요.');
			    }
			});
			}
			function changePage(page){
				 var target = page.target; 
				 var page = target.textContent;  
				 
				 if(page != "Previous" && page != "NEXT"){
					 currentPage = page;
				 }
						prevBtn = document.getElementById("prevBtn");
						prevBtn.style.cursor = "pointer";
						nextBtn = document.getElementById("nextBtn");
						nextBtn.style.cursor = "pointer";
					if(page == 'Previous'){
							if(currentPage == 1){
								prevBtn = document.getElementById("prevBtn");
								prevBtn.onclick = null;
								prevBtn.style.cursor = "auto";
							}
							else if(currentPage >= pagesPerOnece && (currentPage -1) % pagesPerOnece == 0){
								pagingNum-=1;
								addPageBtn();
							}	
							if(currentPage > 1 ){
						    currentPage = currentPage - 1;
						    showQuestion();
							}
					}
					else if(page == 'NEXT'){
						if(currentPage == totalPages){
						nextBtn = document.getElementById("nextBtn");
						nextBtn.onclick = null;
						nextBtn.style.cursor = "auto";
						}
						else if(currentPage >= pagesPerOnece && currentPage % pagesPerOnece == 0){
							pagingNum+=1;
							addPageBtn();
						}
						if(currentPage < totalPages){
						currentPage = parseInt(currentPage) + 1; 
						}
						};
				 showQuestion();
			}
			
			function showQuestion() {
				var currentPagePosts = (currentPage == totalPages && totalPosts % postsPerPage != 0) ? (totalPosts % postsPerPage) : postsPerPage;
			    var tableBody = document.getElementById("tablebody");
				        	var lastIndex = qlist.length - 1;
				        	if(lastIndex >= 0){
							    // 기존 테이블 내용 초기화
							    tableBody.innerHTML = "";
							    // 데이터 반복문 처리
							    for (var i = 1; i <= currentPagePosts; i++) {
							        var row = document.createElement("tr");
							        row.classList.add("qna_Item");
							        row.setAttribute("data-target", "#qdx"+i);
							        var currentData = qlist[i];

							        // 각 행에 데이터 추가
							        row.innerHTML = `
							            <td>${'${qlist[(currentPage * postsPerPage)-11+i].que_category}'}</td>
							            <td>${'${qlist[(currentPage * postsPerPage)-11+i].que_title}'}</td>`;
							            tableBody.appendChild(row);
							        var answer = document.createElement("tr");
							        var tdContent = `<td colspan="2" style="padding:0px; border:none; justify-content: center;"
							        >
							        <div class="qna-answer" id="qdx${'${i}'}">
							        ${'${qlist[(currentPage * postsPerPage)-11+i].que_contents}'}
							        </div>
							        </td>
							        `;
							        answer.innerHTML = tdContent;	
							        tableBody.appendChild(answer);
							        // 테이블에 행 추가
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
				        }
			}
			
			function addPageBtn(){
				var currentPageBtns = 0;
				if(totalPages != 0){
					currentPageBtns = (pagingNum+1 == Math.ceil(totalPages / pagesPerOnece)) ? (totalPages -(pagingNum * pagesPerOnece)) : pagesPerOnece;}
				        	pagingBody.innerHTML = "";	
				        	
				        	var pagingPage = document.createElement("li");
				            pagingPage.className = "page-item";

				            var link = document.createElement("a");
				            link.className = "page-link";
				            link.textContent = "Previous";
				            link.id ="prevBtn";
				            link.addEventListener('click', changePage);
				            pagingPage.appendChild(link);
				            pagingBody.appendChild(pagingPage);
				            
				for (var i = 1; i <= currentPageBtns; i++) {
			        var pagingPage = document.createElement("li");
			        pagingPage.className = "page-item";
			        var link = document.createElement("a");
			        link.className = "page-link";
			        link.id ="pagebtn"+i ;
			        link.addEventListener('click', changePage);
			        
			        link.textContent = (pagingNum * pagesPerOnece)+i;

			        pagingPage.appendChild(link); // 링크를 리스트 아이템에 추가
			        pagingBody.appendChild(pagingPage); // 리스트 아이템을 페이지네이션 컨테이너에 추가
			        
			        
				}
			    var pagingPage = document.createElement("li");
	            pagingPage.className = "page-item";

	            var link = document.createElement("a");
	            link.className = "page-link";
	            link.textContent = "NEXT";
	            link.id ="nextBtn";
	            link.addEventListener('click', changePage);
	            pagingPage.appendChild(link);
	            pagingBody.appendChild(pagingPage);
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
          					 	<input type="text" class="form-inputText" id="input_category" placeholder='카테고리를 입력해주세요.(100자 이내)' maxlength="100">
    				    		</div>
          					<div class="form-group">
            					<label for="recipient-name" class="col-form-label">제목</label>
          					 	<input type="text" class="form-inputText" id="input_title" placeholder='제목을 입력해주세요.(100자 이내)'  maxlength="100">
    				    		</div>
         				 <div class="form-group">
           				 <label for="message-text" class="col-form-label">내용</label>
           				 <textarea class="form-inputText" id="input_contents" style="height:150px;" placeholder='내용을 입력해주세요.(500자 이내)'  maxlength="500"></textarea>
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
		var modal = document.getElementById('myModal');
		if("<%= userAuth %>" == 3){			//관리자용 질문 등록
			document.getElementById("addQnaBtn").style.display = "block";
		}
			$('#addQnaBtn').on('click', function() {
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
			});
		
				$('#cancelBtn').on('click',function(){
					 modal.style.display = 'none';
				});
				
				$('#uploadBtn').on('click',function(){
					var que_category = document.getElementById("input_category").value;
					var que_title = document.getElementById("input_title").value;
					var que_contents= document.getElementById("input_contents").value;
					que_contents = que_contents.replace(/\n/g, '<br/>');
					
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
				 		showaddQuestion(dto);
		   		  });		
			 }else{
				 swal({
						title: "내용이 너무 깁니다.",
						icon: "info",
						button: "확인",
					 	}).then((value) => {
			   		  });		
			} },error: function() {
			 alert('서버 오류가 발생했습니다. 다시 시도해 주세요.');
				}
				});
					
					}else{
						swal({
							title: "내용을 전부 작성해주세요.",
							icon: "info",
							button: "확인",
						 	}).then((value) => {
				   		  });		
					}
				});
			 
			function showaddQuestion(dto){
			 var lastIndex = qlist.length;
			 var tableBody = document.getElementById("tablebody");
			 var currentPagePosts = (currentPage == totalPages && totalPosts % postsPerPage != 0) ? (totalPosts % postsPerPage) : postsPerPage;
			 currentPage = 1;
			 totalPosts += 1;
			 currentPagePosts += 1;
			 prevBtn = document.getElementById("prevBtn");
			 prevBtn.style.cursor = "auto";  
			 pagingNum = 0;
			 updateCheck();
			}
		</script>	
</main>
</body>
</html>