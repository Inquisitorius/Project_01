<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마켓 신상품 - 그린</title>

<!-- Bootstrap CSS 로드 -->
<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.css">

<!-- 개발에 필요한 LinkFile 공용 목적(Font 등을 로드) -->
<jsp:include page="/Common/LinkFile.jsp" />

<!-- Head, Footer CSS 링크 필수 -->
<link rel="stylesheet" href="/resources/css/Common.css">
<link rel="stylesheet" href="/resources/css/ProductList.css">

<!-- jQuery 사용을 위한 JS 로드 -->
<script src="/resources/bootstrap/js/jquery-3.7.1.js"></script>
</head>
<body>
	<jsp:include page="/Common/Header.jsp" />
	<div class="listbody">
		<div class="container mt-5">
			<h3 class="text-center listheader">상품 목록</h3>
			<ul class="justify-content-center itemnav">
				<li class="item"><a class="link" href="#">인기신상랭킹</a></li>
				<li class="item"><a class="link" href="2">입점특가</a></li>
				<li class="item"><a class="link" href="3">간편한끼</a></li>
				<li class="item"><a class="link" href="4">요즘간식</a></li>
				<li class="item"><a class="link" href="5">주방·리빙</a></li>
				<li class="item"><a class="link" href="6">뷰티</a></li>
				<li class="item"><a class="link" href="7">패션·잡화</a></li>
			</ul>
		</div>
		<div class="listcontainer">
			<div class="maincontent">
				<div class="sticky-sidebar">
					<div class="sidebar-title">
						<span class="titlespan">필터</span>
					</div>
					<div class="sticky-menu">
						<form method="get" action="filterResults.jsp">
							<div class="filter-group">
								<div class="toggle-btn">
									<h5 class="title">카테고리</h5>
									<span class="arrow">▲</span>
								</div>
								<div class="filter-content">
									<div>
										<input type="checkbox" id="category1" name="category"
											value="인기신상랭킹"> <label for="category1">인기신상랭킹</label>
									</div>
									<div>
										<input type="checkbox" id="category2" name="category"
											value="입점특가"> <label for="category2">입점특가</label>
									</div>
									<div>
										<input type="checkbox" id="category3" name="category"
											value="간편한끼"> <label for="category3">간편한끼</label>
									</div>
									<div>
										<input type="checkbox" id="category4" name="category"
											value="요즘간식"> <label for="category4">요즘간식</label>
									</div>
									<div>
										<input type="checkbox" id="category5" name="category"
											value="주방·리빙"> <label for="category5">주방·리빙</label>
									</div>
									<div>
										<input type="checkbox" id="category6" name="category"
											value="뷰티"> <label for="category6">뷰티</label>
									</div>
									<div>
										<input type="checkbox" id="category7" name="category"
											value="패션·잡화"> <label for="category7">패션·잡화</label>
									</div>
								</div>
							</div>
							<div class="filter-group">
								<div class="toggle-btn">
									<h5 class="title">가격</h5>
									<span class="arrow">▲</span>
								</div>
								<div class="filter-content">
									<div>
										<input type="radio" id="price1" name="price" value="8499">
										<label for="price1">8,500원 미만</label>
									</div>
									<div>
										<input type="radio" id="price2" name="price"
											value="8500-16900"> <label for="price2">8,500원
											~ 16,900원</label>
									</div>
									<div>
										<input type="radio" id="price3" name="price"
											value="16900-35000"> <label for="price3">16,900원
											~ 35,000원</label>
									</div>
									<div>
										<input type="radio" id="price4" name="price" value="35000">
										<label for="price4">35,000원 이상</label>
									</div>
								</div>
								<div class="filter-group">
									<div class="toggle-btn">
										<h5 class="title">배송</h5>
										<span class="arrow">▲</span>
									</div>
									<div class="filter-content">
										<div>
											<input type="checkbox" id="morning" name="category"
												value="샛별배송"> <label for="morning">샛별배송</label>
										</div>
										<div>
											<input type="checkbox" id="nomal" name="category"
												value="판매자배송"> <label for="nomal">판매자배송</label>
										</div>
									</div>
								</div>
							</div>
							<div class="filter-group">
								<button type="submit" class="btn btn-primary">적용</button>
							</div>
						</form>
					</div>
				</div>
				<div class="products">
					<div class="productsortcontainer">
						<div class="productscnt">총 400건</div>
						<ul class="productsort">
							<li class="sort-li"><a href="#" class="sort-a">추천순</a></li>
							<li class="sort-li"><a href="#" class="sort-a">신상품순</a></li>
							<li class="sort-li"><a href="#" class="sort-a">판매량순</a></li>
							<li class="sort-li"><a href="#" class="sort-a">혜택순</a></li>
							<li class="sort-li"><a href="#" class="sort-a">낮은 가격순</a></li>
							<li class="sort-li"><a href="#" class="sort-a">높은 가격순</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/Common/Footer.jsp" />
	<script>
		$(document).ready(function() {
			$('.toggle-btn').click(function() {
				$(this).next('.filter-content').slideToggle();
				$(this).find('.arrow').text(function(_, value) {
					return value == '▲' ? '▼' : '▲';
				});
			});
		});

		$(function() {
			var beforeChecked = -1;

			$("input[type='radio'][name='price']").on("click", function(e) {
				var index = $(this).index("input[type='radio'][name='price']");

				if (beforeChecked == index) {
					// 이미 체크된 라디오 버튼을 클릭한 경우
					beforeChecked = -1; // beforeChecked 초기화
					$(this).prop("checked", false); // 체크 해제
				} else {
					// 새로운 라디오 버튼을 클릭한 경우
					beforeChecked = index; // 현재 index를 저장
				}
			});
		});
	</script>
</body>
</html>
