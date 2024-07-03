<!DOCTYPE html>
<%@page import="ProductsListController.CategoryMap"%>
<%@page import="Category.CategoryDTO"%>
<%@page import="java.util.List"%>
<%@page import="DTO.ProductDTO"%>
<html lang="ko">
<%@page import="java.io.*"%>
<%@page import="java.util.UUID"%>
<%@page import="java.text.SimpleDateFormat"%>


<head>
    <meta charset="UTF-8">
    <title>상품 등록</title>

    <!-- Bootstrap CSS 로드 -->
    <link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.css">

    <!-- 개발에 필요한 LinkFile 공용 목적(Font 등을 로드) -->
    <jsp:include page="/Common/LinkFile.jsp" />

    <!-- Head, Footer CSS 링크 필수 -->
    <link rel="stylesheet" href="/resources/css/Common.css">
    <link rel="stylesheet" href="/resources/css/ProductsInsertPage.css">
    <link rel="stylesheet" href="/resources/css/MainPage.css">

    <!-- jQuery 사용을 위한 JS 로드 -->
    <script src="/resources/bootstrap/js/jquery-3.7.1.js"></script>
    <script src="/resources/bootstrap/js/bootstrap.bundle.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote.min.js"></script>
	<script src="https://github.com/summernote/summernote/tree/master/lang/summernote-ko-KR.js"></script>
</head>
<body>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <jsp:include page="/Common/Header.jsp" />

<div class = "container" style = "max-width: 1050px; min-width: 1050px; padding-left: 0px; padding-right: 0px; padding-top: 40px;">
	<div class = "row" style = "border-bottom: 1px solid #efefef; padding-bottom: 20px;">
		<div class = "col-12" style="display: inline-flex;justify-content: center;">
			<label class = "ProductsInsertTitle">상품등록</label>
		</div>
	</div>
</div>

    <div class="container" style="max-width: 1050px; padding-top: 50px;">
        <form name="insertProducts" action="/SellerPage/ProductsInsert.do" method="post">
            <div class="form-group row">
                <label for="productname" class="col-sm-2 col-form-label" >상품명</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="productName" name="productName"
                           placeholder="상품명을 입력하세요" aria-label="상품명 입력" aria-describedby="basic-addon1">
                </div>
            </div>
            <div class="form-group row">
            <label for="productcontent" class="col-sm-2 col-form-label" >내용</label>
                <div class="col-sm-10">
                    <textarea name="editorTxt" id="editorTxt" rows="10" class="form-control"
                              placeholder="내용을 입력해주세요" style="width:100%;"></textarea>
                </div>
            </div>
     <div class="form-group row">
    	<div class="col-sm-12 row">
        	<label for="productcountry" class="col-sm-2 col-form-label">원산지</label>
        	<div class="col-sm-3">
            <input type="text" class="form-control" id="origin" name="origin"
                   placeholder="원산지 입력" aria-label="원산지 입력" aria-describedby="basic-addon1">
        	</div>
        	<label for="deliveryType" class="col-sm-1 col-form-label">배송</label>
        	<div class="col-sm-2">
            <select class="form-select" id="deliveryType" name="deliveryType" aria-label="Default select example">
                <option selected>배송타입</option>
                <%
                	List<ProductDTO> delivery = (List<ProductDTO>) request.getAttribute("delivery");
        			if(delivery != null){
        				for(ProductDTO dto : delivery){
        				String delivery_type = dto.getDelivery_type();
                %>
                <option value="<%=delivery_type%>"><%=delivery_type %></option>
                <%
        				}
        				}
                %>
            	</select>
        	</div>
        	<label for="packageType" class="col-sm-2 col-form-label">포장타입</label>
        		<div class="col-sm-3" style="width:236px;">
            		<input type="text" class="form-control" id="packageType" name="packageType"
                   placeholder="포장타입 입력" aria-label="포장타입 입력" aria-describedby="basic-addon1">
        	</div>
    	</div>
	</div>
		<div class="form-group row">
		<label for="productImgLabel" class="sol-sm-2 col-form-label">상품 이미지</label>
		<div class="col-sm-10">
			<div class="input-group mb-3">
  				<input type="file" class="form-control" id="productImg" name="productImg">
  				<label class="input-group-text" for="mainimg">Upload</label>
			</div>
		</div>
		</div>
		<div class="form-group row">
		<label for="productdateinfo" class="sol-sm-2 col-form-label">소비기한 정보</label>
		<div class="col-sm-10">
		<div class="form-floating">
  			<textarea class="form-control"  id="dateinfo" name="dateinfo" style="height: 100px"></textarea>
			</div>
		</div>
		</div>
		<div class="form-group row">
		<label for="productdateinfo" class="sol-sm-2 col-form-label">안내사항</label>
		<div class="col-sm-10">
		<div class="form-floating">
  			<textarea class="form-control"  id="notifi" name="notifi" style="height: 100px"></textarea>
			</div>
		</div>
		</div>
		<div class="form-group row">
			<label for="productsub_textlabel" class="sol-sm-2 col-form-label">상품 설명</label>
			<div class="col-sm-10">
                    <input type="text" class="form-control" id="subtext" name="subtext"
                           placeholder="상품설명을 입력하세요" aria-label="상품설명 입력" aria-describedby="basic-addon1">
                </div>
		</div>
		<div class="form-group row">
			<div class="col-sm-12 row">
				<label for="productUnitlabel" class="sol-sm-2 col-form-label">판매단위</label>
				<div class="col-sm-3" style="width:236px;">
            		<input type="text" class="form-control" id="unit" name="unit"
                   placeholder="판매단위 입력" aria-label="판매단위 입력" aria-describedby="basic-addon1">
        		</div>
        		<label for="productweightlabel" class="sol-sm-2 col-form-label">중량</label>
				<div class="col-sm-3" style="width:236px;">
            		<input type="text" class="form-control" id="weight" name="weight"
                   placeholder="중량 입력" aria-label="중량 입력" aria-describedby="basic-addon1">
        		</div>
			</div>
		<div class="form-group row">
			<div class="col-sm-12 row">
				<label for="productpricelabel" class="sol-sm-2 col-form-label">가격</label>
				<div class="col-sm-3" style="width:236px;">
            		<input type="text" class="form-control" id="price" name="price"
                   placeholder="가격 입력" aria-label="가격 입력" aria-describedby="basic-addon1">
        		</div>
        		<label for="productpricelabel" class="sol-sm-2 col-form-label">할인율</label>
				<div class="col-sm-3" style="width:236px;">
            		<input type="text" class="form-control" id="saleper" name="saleper"
                   placeholder="할인율 입력" aria-label="할인율 입력" aria-describedby="basic-addon1">
        		</div>
			</div>
		</div>
		<div class="form-group row">
			<div class="col-sm-12 row">
				<label for="productcategorylabel" class="sol-sm-2 col-form-label">카테고리</label>
        		<div class="col-sm-3">
            	<select class="form-select" id="category" name="category">
                <option selected>카테고리</option>
                <%List<CategoryDTO> cate = (List<CategoryDTO>) request.getAttribute("cate");
				  if(cate != null){
					  for(CategoryDTO dto : cate){
						String CateName = dto.getCategory_Name();	  
						%>
                <option value="<%=CateName%>"><%=CateName %></option>
                <%
					  }
				  }
                %>
            	</select>
        	</div>
        	<label for="productsubcategory" class="col-sm-2 col-form-label" id="subcategoryLabel" style="display: none;">하위 카테고리</label>
        	<div class="col-sm-3" id="subcategoryContainer" style="display: none;">
                    <select class="form-select" id="subcategory" name="subcategory" aria-label="Default select example">
                        <option selected>하위 카테고리</option>
                      
                    </select>
                </div>
			</div>
		</div>
		</div>
		<div class = "row" style = "margin-top: 10px;">
			<div class = "col-12" style = "display: inline-flex;">
				<button class="btn btn-navy rounded-1 fontCommon_Option" id = "submitbtn" name="submitbtn" type = "submit" style = "width: 100%; height: 36px;">등록</button>
			</div>
		</div>	
        </form>
    </div>
    


    <jsp:include page="/Common/Footer.jsp" />

 <script type="text/javascript">
        $(document).ready(function() {
        	 $('#editorTxt').summernote({
        	        placeholder: '내용을 입력하세요.',
        	        tabsize: 3,
        	        height: 300,
        	        toolbar: [
        	          ['style', ['style']],
        	          ['font', ['bold', 'underline', 'clear']],
        	          ['color', ['color']],
        	          ['para', ['ul', 'ol', 'paragraph']],
        	          ['table', ['table']],
        	          ['insert', ['link', 'picture', 'video']],
        	          ['view', ['fullscreen', 'codeview', 'help']]
        	        ]
        	      });

            $("#submitbtn").click(function() {
                
                // 폼 데이터를 직접 객체로 생성합니다.
                var formData = {
                    ProductName: $("#productName").val(),
                    subText: $("#subtext").val(),
                    origin: $("#origin").val(),
                    weight: $("#weight").val(),
                    dateInfo: $("#dateinfo").val(),
                    notifi: $("#notifi").val(),
                    price: $("#price").val(),
                    saleper: $("#saleper").val(),
                    unit: $("#unit").val(),
                    packagingType: $("#packagingType").val(),
                    deliveryType: $("#deliveryType").val(),
                    productImg: $("#mainimg").val(),
                    subcategory: $("#subcategory").val(),
                    editorTxt: $("#editorTxt").val() 
                };

                
                $.ajax({
                    type: "POST",
                    url: "/SellerPage/ProductsInsert.do",
                    data: formData, 
                    success: function(response) {

                        alert("상품이 등록되었습니다.");
                        window.location.href = "/ProductsList/ProductList.do";
                    },
                    error: function(xhr, status, error) {
                        // 오류 발생 시 실행할 코드
                        console.error("Error:", error);
                        alert("상품 등록 중 오류.");
                    }
                });
            });

            $("#category").change(function() {
                var selectedCategory = $(this).val();

                // Ajax 요청
                $.ajax({
                    type: "GET",
                    url: "/SellerPage/ProductsInsert.do",
                    data: { category: selectedCategory },
                    dataType: "html",
                    success: function(htmlResponse) {
                        // 서브카테고리 셀렉트 박스 업데이트
                        var subcategorySelect = $("#subcategory");
                        subcategorySelect.empty();
                        subcategorySelect.append(htmlResponse);

                        // 보이기
                        $("#subcategoryContainer").show();
                        $("#subcategoryLabel").show();
                        
                        // 카테고리가 선택되지 않았을 때 숨기기
                        if (selectedCategory === "카테고리") {
                            $("#subcategoryContainer").hide();
                            $("#subcategoryLabel").hide();
                        }
                    },
                    error: function(xhr, status, error) {
                        console.error("Failed to load subcategories", error);
                        // 에러 처리
                    }
                });

               
            });
        });
    </script>

</body>
</html>