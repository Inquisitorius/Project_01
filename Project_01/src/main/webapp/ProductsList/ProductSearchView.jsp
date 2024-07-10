<%@page import="DTO.ProductDTO"%>
<%@page import="ProductsListController.CategoryMap"%>
<%@page import="ProductsListController.ChildCategoryMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="Category.CategoryDTO"%>
<%@page import="ProductsListController.ListDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% 
    int currentPage = (Integer) request.getAttribute("currentPage");
    int totalPages = (Integer) request.getAttribute("totalPages");
    String price = request.getParameter("price");
    String[] delivery = request.getParameterValues("delivery");
    String type = request.getParameter("type");
	String search = request.getParameter("search");

    // 현재 페이지가 0 이하이면 1페이지로 설정
    if (currentPage <= 0) {
        currentPage = 1;
    }
	
	if (price == null) {
		price = "";
	}


    String deliveryStr = "";
    if (delivery != null && delivery.length > 0) {
        deliveryStr = String.join(",", delivery); 
    }
	

    int startPage = Math.max(1, currentPage - 2);
    int endPage = Math.min(totalPages, startPage + 4);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마켓 신상품 - 그린</title>
<link rel="stylesheet" href="/resources/css/ProductList.css?after">
<!-- Bootstrap CSS 로드 -->
<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.css">

<!-- 개발에 필요한 LinkFile 공용 목적(Font 등을 로드) -->
<jsp:include page="/Common/LinkFile.jsp" />

<!-- Head, Footer CSS 링크 필수 -->
<link rel="stylesheet" href="/resources/css/Common.css">


<!-- jQuery 사용을 위한 JS 로드 -->
<script src="/resources/bootstrap/js/jquery-3.7.1.js"></script>
<script src="/resources/bootstrap/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<jsp:include page="/Common/Header.jsp" />
	<div class="listbody">
		<div class="container mt-5">
			<h3 class="text-center listheader">상품 목록</h3>
			<div class = "container mt-5" style="margin-top: 50px; text-align: center;">
			<h1 style="font-size: 28px;line-height: 35px; letter-spacing: -0.5px;font-family: Noto Sans KR;">'<span style="color: green;"><%= search %></span>'에 대한 검색결과</h1>
			</div>
			
		</div>
		<%
List<ProductDTO> list1 = (List<ProductDTO>) request.getAttribute("list");
boolean isEmptyList = (list1 == null || list1.isEmpty());
%>
		<div class="listcontainer" style="<%= isEmptyList ? "display: none;" : "" %>">
			<div class="maincontent">
			
				<div class="sticky-sidebar">
					<div class="sidebar-title">
						<span class="titlespan">필터</span>
					</div>
					<div class="sticky-menu">
						<form id="filterForm" method="GET" action="<%= request.getContextPath() %>/search" accept-charset="utf-8">
							<div class="filter-group">
								<div class="toggle-btn">
									<h5 class="title">카테고리</h5>
									<span class="arrow">▲</span>
								</div>

							</div>
							<div class="filter-group">
								<div class="toggle-btn">
									<h5 class="title">가격</h5>
									<span class="arrow">▲</span>
								</div>
								<div class="filter-content" id="price-filter">
									<div>
										<input type="checkbox" id="price1" name="price" value="8500">
										<label for="price1">8,500원 미만</label>
									</div>
									<div>
										<input type="checkbox" id="price2" name="price"
											value="8500-16900"> <label for="price2">8,500원
											~ 16,900원</label>
									</div>
									<div>
										<input type="checkbox" id="price3" name="price"
											value="16900-35000"> <label for="price3">16,900원
											~ 35,000원</label>
									</div>
									<div>
										<input type="checkbox" id="price4" name="price" value="35000">
										<label for="price4">35,000원 이상</label>
									</div>
								</div>
								<div class="filter-group" id="delivery-filter">
									<div class="toggle-btn">
										<h5 class="title">배송</h5>
										<span class="arrow">▲</span>
									</div>
									<div class="filter-content" id="delivery_Type">
									<% Map<String, String> deliverymap = CategoryMap.GetdeliveryMap();
									   List<ProductDTO> delivery_Type = (List<ProductDTO>) request.getAttribute("delivery_type");
												if(delivery_Type != null){
													for(ProductDTO dto : delivery_Type){
													
													String getDelivery_Type = dto.getDelivery_type();
													String engDelivery = deliverymap.getOrDefault(getDelivery_Type, getDelivery_Type);
													
									%>
										<div>
											<input type="checkbox" id="<%=engDelivery %>" name="delivery"
												value="<%=engDelivery %>"> <label for="<%=engDelivery %>"><%=getDelivery_Type %></label>
										</div>
										<%
													}
												}
										%>
										
									</div>
								</div>
							</div>
							
						</form>
						

					</div>
				</div>
				<div class="products">
					<div class="productsortcontainer">
						<div class="productscnt" id="productcnt">
							총 <%=request.getAttribute("cnt")%>건
						</div>
						<ul class="productsort">
							<li class="sort-li"><a class="sort-link" href="#" data-type="new" class="sort-a">신상품순</a></li>
							<li class="sort-li"><a class="sort-link" href="#" data-type="saleprice" class="sort-a">혜택순</a></li>
							<li class="sort-li"><a class="sort-link" href="#" data-type="lowprice" class="sort-a">낮은 가격순</a></li>
							<li class="sort-li"><a class="sort-link" href="#" data-type="highprice" class="sort-a">높은 가격순</a></li>
						</ul>
					</div>
					<div class="container list" id="productList" style="text-decoration-line: none;">
						<%
    List<ProductDTO> list = (List<ProductDTO>) request.getAttribute("list");
    
    if (list != null && !list.isEmpty()) {
        for (ProductDTO dto : list) {
%>
<div class="row">
    <a href="/test/ProductInfo.do?product_id=<%=dto.getProduct_id() %>" style="text-decoration-line: none;">
        <img src="<%=dto.getProduct_img() %>"
            style="padding: 0px; width: 249px; height: 320px; border-radius: 2%; overflow: hidden;">
        <button class="btn btn-navy rounded-1 fontCommon_Option" type="button"
            style="width: 249px; height: 36px; margin-top: 5px;">구매</button>
        <div class="delivery" style="text-align: left; margin-top: 5px;"><%=dto.getDelivery_type()%></div>
        <div class="list_Itemtitle" style="width: 249px; text-align: left;"><%=dto.getName()%></div>
        <div class="row" style="margin-top: 5px;">
            <div class="explation" style="text-align: left;"><%=dto.getSub_text()%></div>
            <div class="col-12">
                <span class="OripriceText" style="width: 249px;"><%= String.format("%,d", dto.getPrice_ori()) %>원</span>
            </div>
        </div>
        <div class="row" style="margin-top: 5px;">
            <div class="col-2" style="display: inline-flex;">
                <span class="SalePercentText" style="text-align: left"><%=dto.getPrice_percent()%>%</span>
            </div>
            <div class="col" style="display: inline-flex;">
                <span class="SalePriceText" style="text-align: left"><%= String.format("%,d", dto.getPrice_discount()) %>원</span>
            </div>
        </div>
    </a>
</div>
<%
        }
    } 
%>	
					</div>	
				</div>
			</div>
			<div class="pagebtn">
    <nav aria-label="Page navigation example">
        <ul class="pagination justify-content-center">
        	<li class="page-item">
        		
                <a class="page-link" href="<%= request.getContextPath() %>/ProductList?search=<%=search %>&page=<%= 1 %>&price=<%=price %>&delivery=<%=deliveryStr %>&type=<%=type %>"style="font-weight: bold" aria-label="Previous">
                    <span aria-hidden="true"><img src=/resources/img/firstbtn.png></span>
                </a>
            </li>
            <li class="page-item">
                <a class="page-link" href="<%= request.getContextPath() %>/search?search=<%=search %>&page=<%= Math.max(1, currentPage - 1) %>&price=<%=price %>&delivery=<%=deliveryStr %>&type=<%=type %>"style="font-weight: bold" aria-label="Previous">
                    <span aria-hidden="true"><img src=/resources/img/prevbtn.png></span>
                </a>
            </li>
            <%  

            if (startPage <= 1) {
                endPage = Math.min(totalPages, 5);
            }
            
            for (int i = startPage; i <= endPage; i++) {
                String activeClass = (currentPage == i) ? "active" : "";
            %>
            <li class="page-item <%= activeClass %>">
                <a class="page-link" href="<%= request.getContextPath() %>/search?search=<%=search %>&page=<%= i %>&price=<%=price %>&delivery=<%=deliveryStr %>&type=<%=type %>"style=""><%= i %></a>
            </li>
            <% } %>
            <li class="page-item">
                <a class="page-link" href="<%= request.getContextPath() %>/search?search=<%=search %>&page=<%= Math.min(totalPages, currentPage + 1) %>&price=<%=price %>&delivery=<%=deliveryStr %>&type=<%=type %>"style="font-weight: bold" aria-label="Next">
                    <span aria-hidden="true"><img src=/resources/img/nextbtn.png></span>
                </a>
            </li>
            <li class="page-item">
                <a class="page-link" href="<%= request.getContextPath() %>/search?search=<%=search %>&page=<%= totalPages %>&price=<%=price %>&delivery=<%=deliveryStr %>&type=<%=type %>"style="font-weight: bold" aria-label="Next">
                    <span aria-hidden="true"><img src=/resources/img/lastbtn.png></span>
                </a>
            </li>
        </ul>
    </nav>
</div>
		</div>
		<% if (isEmptyList) { %>
		<div class="serarchresult" style="width:100%;">
			<div class="spanclass">
				<img src="/resources/img/search.svg" style=" width: 48px; height: 48px;">
				<span class="searchspan">
				검색된 상품이없습니다.
				<br>
				다른 검색어를 입력해주세요.
				</span>
			</div>
		</div>		
</div>
		<% } %>
	
	<jsp:include page="/Common/Footer.jsp" />
	

<script>
    $(document).ready(function() {
        let currentPage = '<%= currentPage %>';
        let price = '<%= price %>';
        let delivery = '<%= deliveryStr %>';
        let selectedPrice = getParameterByName('price');
        let selectedDelivery = getParameterByName('delivery') ? getParameterByName('delivery').split(',') : [];
        let search = '<%= search %>';
        let type = sessionStorage.getItem('type');
        if (!type) {
            type = '<%= type %>'; // 초기 설정 값 사용
            sessionStorage.setItem('type', type); // 세션 스토리지에 저장
        }
        
        updateFilterState(selectedPrice, selectedDelivery);
        
        $('.link').on('click', function () {
        	sessionStorage.removeItem('type');
		});
        
        
     // 링크 클릭 시
        $('.sort-link').on('click', function(event) {
            event.preventDefault(); // 기본 클릭 동작 방지
            
            let clickedType = $(this).data('type');

            // 필터 값 업데이트
            selectedPrice = getParameterByName('price');
            
            
            selectedDelivery = getParameterByName('delivery') ? getParameterByName('delivery').split(',') : [];
			currentPage = 1;
         
			sessionStorage.setItem('type', clickedType);
            handleFilterFormSubmit(selectedPrice, selectedDelivery, clickedType);
            updateProductSortNavigationStyle(clickedType);
            
        });
        
        
        function getParameterByName(name, url = window.location.href) {
            name = name.replace(/[\[\]]/g, '\\$&');
            let regex = new RegExp('[?&]' + name + '(=([^&#]*)|&|#|$)');
            let results = regex.exec(url);
            if (!results) return null;
            if (!results[2]) return '';
            return decodeURIComponent(results[2].replace(/\+/g, ' '));
        }
       
        // 초기 이벤트 핸들러 설정
        function initializeEventHandlers() {
            console.log("이벤트 핸들러 초기화");

            // 토글 버튼 클릭 이벤트 핸들러
            $('.toggle-btn').off('click').on('click', function() {
                let $arrow = $(this).find('.arrow');
                let $filterContent = $(this).next('.filter-content');

                $filterContent.stop().slideToggle(50, function() {
                    if ($filterContent.is(':visible')) {
                        $arrow.text('▲');
                    } else {
                        $arrow.text('▼');
                    }
                });
            });

            // 체크박스 클릭 이벤트 핸들러
            $("input[type='checkbox'][name='price']").on("click", function() {
                // 현재 클릭된 체크박스의 값
                let currentValue = $(this).val();

                // 다른 체크박스들의 체크 상태를 관리
                $("input[type='checkbox'][name='price']").each(function() {
                    if ($(this).val() !== currentValue) {
                        $(this).prop("checked", false); // 다른 체크박스들의 체크 해제
                    }
                });
            });
        }
       	
     // URL에 특정 파라미터 추가 또는 업데이트 함수
        function updateUrlParameter(parameter, value) {
            var url = new URL(window.location.href);
            // 값이 존재하는 경우 파라미터를 추가하거나 업데이트
            if (value) {
                url.searchParams.set(parameter, value);
            } else {
                // 값이 없는 경우 파라미터를 삭제
                url.searchParams.delete(parameter);  
            }
            // URL 업데이트
            history.pushState(null, '', url);
           
        }

 
       

        
        function updateProductSortNavigationStyle(currentType){
        	 console.log("현재 타입:", currentType);
     	   $('.sort-link').each(function () {
				let clickedType = $(this).data('type');
				
				if(clickedType == currentType) {
					$(this).css({
						
						'color': 'rgb(51, 51, 51)',
                        'font-weight': 'bold'
                        	
					});
				}else {
					$(this).css({
						'color' : '',
					    'font-weight' : ''
						});
				}
				console.log("현재 타입:", clickedType);
			});
      }
        

         
        

        // 초기 URL 설정 및 스타일 적용
       
        
        
        updateProductSortNavigationStyle(type);
        
     // 다음 버튼 클릭 이벤트 핸들러
        $('.itemnav .link .pagination').off('click').on('click', function(event) {
            event.preventDefault();
           
			let clickedType = $(this).data('type');

            // handleFilterFormSubmit 함수 호출
            handleFilterFormSubmit(selectedPrice, selectedDelivery, clickedType);
        });

        // 필터 폼 제출 이벤트 핸들러
        $('#filterForm').change(function(event) {
            event.preventDefault();
			
            let clickedType = sessionStorage.getItem('type');
            console.log("필터폼 : " + clickedType);
            // 현재 선택된 필터, 가격, 배송 옵션 가져오기
            let selectedFilters = [];
            $('input[name="filters"]:checked').each(function() {
                selectedFilters.push($(this).val());
            });
			
            let selectedPrice = $('input[name="price"]:checked').val();
            let selectedDelivery = $('input[name="delivery"]:checked').map(function() {
                return $(this).val();
            }).get();
            
            
            // handleFilterFormSubmit 함수 호출
            handleFilterFormSubmit(selectedPrice, selectedDelivery, clickedType);
            // 필터링된 결과를 반영한 콘텐츠에 이벤트 핸들러 재설정
            initializeEventHandlers();
            
        });
        
        // 페이지네비게이션 갱신
     	function updatePagination(){
     		$('.pagination').load(window.location.href + ' .pagination')
     	}
        
		
        function handleFilterFormSubmit( selectedPrice, selectedDelivery, clickedType) {
            // 가격이 undefined인 경우 빈 문자열로 처리
            let priceParam = selectedPrice ? '&price=' + selectedPrice : '';
			
            $.ajax({
                type: 'GET',
                url: window.location.origin + '/search',
                data: {
                    page: 1,
                    search: search,
                    price: selectedPrice,
                    delivery: selectedDelivery.join(','),
                    type: clickedType
                },
                success: function(data) {
                	
                    console.log("AJAX 요청 성공");
                    
                    let productListHtml = $(data).find('#productList').html();
                    let productcntHtml = $(data).find('#productcnt').html();
                    let categoryFiltersHtml = $(data).find('#categoryFilters').html();
                    let delivery_type = $(data).find('delivery_Type').html();
                    
                    if (!productListHtml || productListHtml.trim() === '') {
                        console.log('productListHtml null');
                        swal({
                            title: "상품이 없습니다.",
                            icon: "error",
                            button: "확인",
                        }).then((value) => {
                            let newUrl = '/search?search=' + search
                            		   + '&page=' + currentPage
                                       + '&price='
                                       + '&delivery=' + delivery
                                       + '&type=' + type;
                            location.replace(newUrl);
                        });
                    }else{
                    
                    // 제품 목록과 개수 업데이트
                    $('#productList').html(productListHtml);
                    $('#productcnt').html(productcntHtml);
                    $('#delivery_Type').html(delivery_type);
                    updateFilterState( selectedPrice, selectedDelivery);

                    // 브라우저 URL 업데이트하여 현재 상태 반영
                    let newUrl = window.location.origin + '/search?search='+search
                    			 + '&page='+1
                                 + priceParam
                                 + '&delivery=' + selectedDelivery
                    			 + '&type=' + clickedType;
                    history.pushState({search:search, page: 1,  price: selectedPrice, delivery: selectedDelivery, type: clickedType }, null, newUrl);
					console.log(clickedType);
                  
                    
                    // 필터링된 결과를 반영한 콘텐츠에 이벤트 핸들러 재설정
                    
                    
                    updateProductSortNavigationStyle(clickedType);
                    retainFilterState(selectedPrice, selectedDelivery);
                    updatePagination();
                    
                   
                }
                },
                error: function(xhr, status, error) {
                    console.error("AJAX 요청 실패", status, error);
                }
            });
        }
       
        // 필터 상태 유지 함수
        function retainFilterState( selectedPrice, selectedDelivery) {
            
          

            // 가격 라디오 버튼 상태 유지
            $('input[name="price"]').each(function() {
                if ($(this).val() === selectedPrice) {
                    $(this).prop('checked', true);
                } else {
                    $(this).prop('checked', false);
                }
            });

            // 배송 옵션 체크박스 상태 유지
            $('input[name="delivery"]').each(function() {
                if (selectedDelivery.includes($(this).val())) {
                    $(this).prop('checked', true);
                } else {
                    $(this).prop('checked', false);
                }
            });
        }
       
        function updateFilterState(selectedPrice, selectedDelivery) {
          

            // 가격 라디오 버튼 선택
            if (selectedPrice) {
                $('input[name="price"]').prop('checked', false); // 모든 가격 라디오 버튼 초기화
                $('input[name="price"][value="' + selectedPrice + '"]').prop('checked', true); // 선택된 가격 라디오 버튼 체크
            }

            // 선택된 배송 옵션 체크박스 선택
            $('input[name="delivery"]').prop('checked', false); // 모든 배송 옵션 체크박스 초기화
            selectedDelivery.forEach(function(deliveryOption) {
                $('input[name="delivery"][value="' + deliveryOption + '"]').prop('checked', true);
            });
        }

       
     // 초기 이벤트 핸들러 설정 호출
        initializeEventHandlers();
    });

    

</script>
   


</body>
</html>
