<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@ page import="Board.BoardDAO"%>
<%@ page import="Board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page import="Main.JDBConnect"%>
<%@ page import="Main.TestDBPool"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>목록</title>
<script>
	function validateForm(form) {
		if (form.name.value == "") {
			alert("이름을 입력하세요.");
			form.content.focus();
			return false;
		}
		if (form.title.value == "") {
			alert("제목을 입력하세요.");
			form.title.focus();
			return false;
		}
		if (form.content.value == "") {
			alert("내용을 입력하세요.");
			form.content.focus();
			return false;
		}
	}
</script>
<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="/resources/css/Common.css">
<script src="/resources/bootstrap/js/jquery-3.7.1.js"></script>
<script src="https://kit.fontawesome.com/a0b08e370a.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" >
<style>a{text-decoration:none;}</style>
<style type="text/css">
.buy_button {
	float: right;
	width: 250px;
	height: 50px;
	background-color: white;
}

.button_style {
	background-color: #fff;
	width: 330px;
	height: auto;
	top: 0px;
	z-index: 10;
	position: sticky;
}

table {
	border-collapse: collapse;
	border-spacing: 0;
}

section.notice {
	padding: 80px 0;
}

.page-title {
	margin-bottom: 60px;
}

.page-title h3 {
	font-size: 28px;
	color: #333333;
	font-weight: 400;
	text-align: center;
}

.page-title h2 {
	font-size: 35px;
	color: #333333;
	font-weight: 400;
	text-align: center;
}

/* .board-table {
	font-size: 13px;
	border-top: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
} */

.board-table a {
	color: #333;
	display: inline-block;
	line-height: 1.4;
	word-break: break-all;
	vertical-align: middle;
}
/* .board-table a:hover {
  text-decoration: underline;
} */
.board-table th {
	text-align: center;
}

.board-table .th-num {
	width: 100 px;
	text-align: center;
}

.board-table .th-date {
	width: 200px;
}

.board-table tbody td {
	border-top: 1px solid #e7e7e7;
	text-align: center;
	background-color:white;
}

.board-table tbody th {
	padding-left: 28px;
	padding-right: 14px;
	border-top: 1px solid #e7e7e7;
	text-align: left;
}

.board-table tbody th p {
	display: none;
}

/* .btn {
  display: inline-block;
  padding: 0 30px;
  font-size: 15px;
  font-weight: 400;
  background: transparent;
  text-align: center;
  white-space: nowrap;
  vertical-align: middle;
  -ms-touch-action: manipulation;
  touch-action: manipulation;
  cursor: pointer;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
  border: 1px solid transparent;
  text-transform: uppercase;
  -webkit-border-radius: 0;
  -moz-border-radius: 0;
  border-radius: 0;
  -webkit-transition: all 0.3s;
  -moz-transition: all 0.3s;
  -ms-transition: all 0.3s;
  -o-transition: all 0.3s;
  transition: all 0.3s;
} */
.btn-dark {
	background: #555;
	color: #fff;
}

.btn-dark {
	background: #555;
	color: #fff;
}

.btn-dark:hover, .btn-dark:focus {
	background: #373737;
	border-color: #373737;
	color: #fff;
}

/* reset */
* {
	list-style: none;
	text-decoration: none;
	padding: 0;
	margin: 0;
	box-sizing: border-box;
}

.clearfix:after {
	content: '';
	display: block;
	clear: both;
}

.container {
	width: 1100px;
	margin: 0 auto;
}

.blind {
	position: absolute;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	margin: -1px;
	width: 1px;
	height: 1px;
}

.board-table .hidden-content {
	display: none; /* Hide content initially */
	padding: 10px;
	background-color: #f9f9f9;
}

.board-table tr {
	cursor: pointer; /* Change cursor to indicate clickable rows */
}

hr {
	border: 1px solid gray;
}

.texttop_01 {
	background-color: white;
	color: black;
	font-weight: bold;
	font-size: 30px;
}
</style>
</head>
<body>

      <section class="notice"style="min-width:1050px; height:1000px; display:flex; justify-content: space-around;">
  <div class="page-title">
  <h2>상품 문의</h2>
        <div class="container"style="min-width:1050px; height:auto; display:flex; justify-content: flex-end;">

	<div class="row">
	<div class="col" style="display:flex;justify-content:flex-end;padding-bottom:10px;">
	<button type="button" class="btn btn-outline-success" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="제목을 입력하시오.">문의하기</button>
</div>
</div>
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" data-bs-backdrop="static">
  <div class="modal-dialog modal-dialog-centered modal-dialog modal-dialog-scrollable modal-dialog modal-lg">>
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title texttop_01" id="exampleModalLabel">상품 문의하기</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div class="row"style="padding-bottom:5px;padding-top:5px;">
        <div class="col-3">
        <img src="../resources/img/melon.jpg" style="width:100px; padding-bottom:10px;">
        </div>
        <div class="col-6">	
        <div class="col" style="font-size:20px;display:flex;align-items: center;height:100%;">
        [쉘퍼] 머스크멜론 1.6kg
        </div>
        </div>
        
		<div>
		<hr style="width:100%; margin: auto;">
		<form action="../test/List.do"  method="post" enctype="multpart/form-data"
		 onsubmit="return validateForm(this);"id="ModalWriteForm">
        <div class="form-group-mb-3">
            <label for="recipient-title" class="col-form-label">이름</label>
            <input type="text" class="form-control" name="name">
          </div>
          <div class="form-group-mb-3">
            <label for="recipient-name" class="col-form-label">제목</label>
            <input type="text" class="form-control" name="title">
          </div>
          <div class="form-group-mb-3">
            <label for="message-text" class="col-form-label">내용</label>
            <textarea class="form-control" name="content" rows="4">메시지를 입력하시오.</textarea>
          </div>
        </form>
      </div>
      <div class="modal-footer"style="display:flex;justify-content:center;">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal"style="width:100px;height:40px;">취소</button>
        <button type="submit" class="btn btn-outline-success" id="submitFormButton"style="width:100px;height:40px;">등록</button>
      </div>
    </div>
  </div>	
</div>
</div>
</div></div>
  <!-- board list area -->
    <div id="board-list">
        <div class="panel-faq-container"style="min-width: 1050px;height:auto; display:flex; justify-content: space-around;">
            <table class="board-table table">
            	    <thead>
            	    <tr>
                    <th scope="col" class="th-num">번호</th>
                    <th scope="col" class="th-title">제목</th>
                    <th scope="col" class="th-writer">이름</th>
                    <th scope="col" class="th-date">날짜</th>
                </tr>
                </thead>
                <c:forEach var="BoardDTO" items="${boardLists}">
                <tbody style="border:none;">
                 <tr class="board-row" data-target="#content${ BoardDTO.idx }"style="border:none;">
                    <td>${ BoardDTO.idx }</td>
                    <th>
                      <a href="#!">${ BoardDTO.title }</a>
                      <p>${ BoardDTO.name }</p>
                    </th>	
                    <td>${ BoardDTO.name }</td>
                    <td>${ BoardDTO.postdate }</td>
                     <tr id="content${ BoardDTO.idx }" class="hidden-content-row"style="width:150px;hegiht:300px;"> 
                        <td colspan="4"style="padding : 0px;border:none;">
                        <div class="hidden-content">
                            <div style="display:flex;padding-left:30px;font-size:15px;width:1000px;hegiht:100%;"> 
                             &nbsp;&nbsp;&nbsp;
                             문의내용 :
                             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                              ${ BoardDTO.content }
                           </div>
                           </div>
                        </td>
                </tr>
                </tbody>  
                </c:forEach>
            </table>   
        </div>	
      </table>
    </div> 
</section>
<script>
	$(document).ready(function() {
		console.log("ready");
		$('#submitFormButton').click(function() {
			console.log("hit!;");
			$('#ModalWriteForm').submit();
		});

		$('.board-row').on('click', function() {
			var target = $(this).data('target'); // Get the target content ID
			var $content = $(target).find('.hidden-content'); // Find the content to slide

			if ($content.is(':visible')) {
				$content.slideUp(); // Hide the content if it is visible
			} else {
				// Optionally: Close other open items if single open item behavior is needed
				$('.hidden-content').slideUp(); // Hide all other open contents

				// Show the clicked content
				$content.slideDown();
			}
		});
	});

	var exampleModal = document.getElementById('exampleModal')
	exampleModal.addEventListener('show.bs.modal', function(event) {
		// Button that triggered the modal
		var button = event.relatedTarget
		// Extract info from data-bs-* attributes
		var recipient = button.getAttribute('data-bs-whatever')
		// If necessary, you could initiate an AJAX request here
		// and then do the updating in a callback.
		// Update the modal's content.	
		var modalTitle = exampleModal.querySelector('.modal-title')
		var modalBodyInput = exampleModal.querySelector('.modal-body input')

		var myModalEl = document.getElementById('myModal')
		var modal = bootstrap.Modal.getInstance(myModalEl)

		modalTitle.textContent = ' 상품 문의하기 '
		modalBodyInput.value = recipient
	});
</script>


	<script src="/resources/bootstrap/js/bootstrap.bundle.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
	 <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
</body>
</html>