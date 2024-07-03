<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>마이페이지</title>
<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.css">
<script src="/resources/bootstrap/js/jquery-3.7.1.js"></script>
<script src="https://kit.fontawesome.com/a0b08e370a.js"
	crossorigin="anonymous"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/fork-awesome@1.2.0/css/fork-awesome.min.css">
<style type="text/css">

.menu_Title{
font-size:25px;
font-weight:600;
border-bottom:1px solid green;
justify-content: center;
width:50%;
text-align:center;
padding:20px;
user-select:none;
}

.detail_Menu{
justify-content: center;
text-align:center;
margin:20px;
font-size:15px;
font-weight:600;
width:50%;
user-select:none;
}
.detail_Astyle{
text-decoration: none;
color:black;
}
.detail_Astyle:visited{
visited-color: black;
text-decoration: none;
}

.detail_Astyle:hover {
  color: green;
  cursor:pointer;
}

}
</style>
</head>
<body>
<% 
	HttpSession session2 = request.getSession(); 
	String userName= (String)session.getAttribute("name");
%>
<jsp:include page="/Common/Header.jsp" />
<main class="container" style="width:1050px;" >
		<div class="row" style="display:block; min-height:50px; "></div>
		<div class="row" style="justify-content: center;">
				<div class="col-md-5" style="padding-left:0px;">
				<div style="width: 100%; height:200px; padding:40px; border: 1px solid green;">
					<span style="font-size:25px; font-weight:600"><%= userName %> 님</span>
			</div>
			
			<div style="display:flex; justify-content: center">
			<hr style="width:90%;">
			</div>
		
			<div class="row" style= "justify-content: center">
			<div class="col-md-12" style="display:flex; flex-direction: column; align-items: center;">
				<div class="menu_Title">	
					MY 쇼핑
				</div>
				<div class="detail_Menu">
				주문 목록 확인
				</div>
				<div class="detail_Menu">
				세부 메뉴 2
				</div>
				<div class="detail_Menu">
				세부 메뉴 3
				</div>
			</div>
			</div>
			
			<div class="row" style= "justify-content: center">
				<div class="col-md-12" style="display:flex; flex-direction: column; align-items: center;">
				<div class="menu_Title">	
					My 활동
				</div>
				<div class="detail_Menu">
				<a class="detail_Astyle" onclick="changeInclude('MyInfo.jsp')">내 정보 확인/수정</a>
				</div>
				<div class="detail_Menu">
				<a class="detail_Astyle" onclick="changeInclude('ChangeAddr.jsp')">배송지 정보 변경</a>
				</div>
				<div class="detail_Menu">
				<a class="detail_Astyle" onclick="changeInclude('DeleteAccount.jsp')">회원 탈퇴</a>
				</div>
			</div>
			</div>
			
			<div class="row" style= "justify-content: center">
			<div class="col-md-12" style="display:flex; flex-direction: column; align-items: center;">
				<div class="menu_Title">	
					고객 센터
				</div>
				<div class="detail_Menu">
				1:1 문의
				</div>
			</div>
			</div>
			</div>
				
				<div class="col-md-7" style="border: 1px solid green;">
					<div class="includedContent">
				아아아아아아아앙아ㅏ
					</div>
				</div>
			
			<script>
				function changeInclude(clickPage){
				    var xhr = new XMLHttpRequest();
				    xhr.onreadystatechange = function() {
				        if (xhr.readyState === XMLHttpRequest.DONE) {
				            if (xhr.status === 200) {
				                var includedContent = document.querySelector('.includedContent');
				                includedContent.innerHTML = xhr.responseText;
				                executeScripts(includedContent);
				            } else {
				                console.error('요청에 실패했습니다.');
				            }
				        }
				    };
				    xhr.open('GET', '/MyPage/'+clickPage, true);
				    xhr.send();
				}
				function executeScripts(element) {		// include 된 파일 스크립트 실행
				     var scripts = element.getElementsByTagName('script');
				     for (var i = 0; i < scripts.length; i++) {
				     var script = document.createElement('script');
				     script.text = scripts[i].text;
				     document.head.appendChild(script).parentNode.removeChild(script);
				       }
				    }
			</script>
	</div>		
	</main>		
<jsp:include page="/Common/Footer.jsp" />
<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
<script src="/resources/bootstrap/js/bootstrap.bundle.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
</body>
</html>