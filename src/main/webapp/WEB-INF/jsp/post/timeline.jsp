<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Marondalgram - timeline</title>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  	
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
  	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
  	
</head>
<body>

	<div class="container">
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
		<section class="d-flex justify-content-center">
		
			<!-- timeline -->
			<div class="col-5">
			
				<!-- 입력 상자 -->
				<div class="border rounded">
					<textarea class="form-control border-0" rows="4"></textarea>
					
					<div class="d-flex justify-content-between mt-3">
						<a href="#" id="imageIcon" class="ml-3"> <i class="bi bi-image image-icon"></i> </a>
						<input type="file" id="fileInput" class="d-none">
						<button type="button" class="btn btn-primary">업로드</button>
					</div>
				
				</div>
				<!-- / 입력 상자 -->
				
				<!-- 피드들 -->
				<div class="mt-3">
				
					<!-- 카드 -->
					
						<div class="border rounded">
							
							<div class="d-flex justify-content-between p-2">
								<div>김인규</div>
								<i class="bi bi-three-dots"></i>
							</div>
							
							<!-- 이미지 -->
							<div>
								<img class="w-100" src="https://media.istockphoto.com/photos/cup-of-coffee-on-green-background-top-view-copy-space-picture-id1323429553?b=1&k=20&m=1323429553&s=170667a&w=0&h=1ubEn7sx3ml6Dx8bZEBiqKi1AJLR6xNwLSEIpvffvdg=">
							</div>
							<!-- / 이미지 -->
							
							<!-- 좋아요 -->
							<div class="p-2">
								<i class="bi bi-heart"></i>좋아요 10개
							</div>
							<!-- / 좋아요 -->
							
							<div class="p-2">
								<b>김인규</b> 커피가 맛있네요 !
							</div>
							
							<!-- 댓글 -->
							<div class="p-2">
								<div class="small">댓글</div>
								<hr>
								<div><b>유재석</b> <small>저도 커피한잔 하고싶네요</small></div>
								<div><b>바다</b> <small>여기 카페이름좀 알려주세요</small></div>
								
								<!-- 댓글 입력 -->
								<div class="d-flex mt-3">
									<input type="text" class="form-control">
									<button type="button" class="btn btn-primary">게시</button>
								</div>
								<!-- / 댓글 입력 -->
								
							</div>
							<!-- / 댓글 -->
							
						</div>
					
					<!-- / 카드 -->
					
				</div>
				<!-- / 피드들 -->
				
			</div>
			<!-- / timeline -->
			
		</section>
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	
	</div>
	
	<script>
		$(document).ready(function() {
			
			$("#imageIcon").on("click", function() {
				
				// 파일인풋을 클릭한 효과
				$("#fileInput").click();
				
			});
			
		});
	
	
	
	
	
	
	
	</script>

</body>
</html>