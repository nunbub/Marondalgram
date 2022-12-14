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
					<textarea class="form-control border-0" rows="4" id="contentInput"></textarea>
					
					<div class="d-flex justify-content-between mt-3">
						<a href="#" id="imageIcon" class="ml-3"> <i class="bi bi-image image-icon"></i> </a>
						<input type="file" id="fileInput" class="d-none">
						<button type="button" class="btn btn-primary" id="uploadBtn">업로드</button>
					</div>
				
				</div>
				<!-- / 입력 상자 -->
				
				<!-- 피드들 -->
				<div class="mt-3">
					
					<c:forEach var="postDetail" items="${postList }" >
					
					<!-- 카드 -->					
						<div class="border rounded mt-3">
							
							<div class="d-flex justify-content-between p-2">
								<div><b>${postDetail.user.name}</b></div>
								
								<%-- 해당 게시글이 로그인한 사용자의 게시글인 경우 more 버튼 노출 --%>
								<c:if test="${userId eq postDetail.user.id }" >
									<a href="#" class="more-btn" data-post-id="${postDetail.post.id }" data-toggle="modal" data-target="#moreModal"><i class="bi bi-three-dots"></i></a>
								</c:if>
							</div>
							
							<!-- 이미지 -->
							<div>
								<img class="w-100" src="${postDetail.post.imagePath }">
							</div>
							<!-- / 이미지 -->
							
							<!-- 좋아요 -->
							<div class="p-2">
							
								<c:choose>
									<%-- 로그인한 사용자가 좋아요한 게시물 --%>
									<c:when test="${postDetail.like}">
										<a href="#" class="unlike-btn" data-post-id="${postDetail.post.id }"><i class="bi bi-heart-fill text-danger"></i></a>
									</c:when>
									
									<%-- 로그인한 사용자가 좋아요를 하지 않은 게시물 --%>
									<c:otherwise>
										<a href="#" class="like-btn" data-post-id="${postDetail.post.id }"><i class="bi bi-heart"></i></a>
									</c:otherwise>
								</c:choose>
								
								 좋아요 ${postDetail.likeCount }개
								
							</div>
							<!-- / 좋아요 -->
							
							<div class="p-2">
								<b>${postDetail.user.name}</b> ${postDetail.post.content}
							</div>
							
							<!-- 댓글 -->
							<div class="p-2">
								<div class="small">댓글</div>
								<hr>
								<!-- 댓글 리스트 -->
								<c:forEach var="commentDetail" items="${postDetail.commentList }">
									<div><b>${commentDetail.user.name}</b> <small>${commentDetail.comment.content }</small></div>
								</c:forEach>
								<!-- / 댓글 리스트 -->
								
								<!-- 댓글 입력 -->
								<div class="d-flex mt-3">
									<input type="text" class="form-control" id="commentInput${postDetail.post.id }">
									<button type="button" class="btn btn-primary comment-btn" data-post-id="${postDetail.post.id }">게시</button>
								</div>
								<!-- / 댓글 입력 -->
								
							</div>
							<!-- / 댓글 -->
							
						</div>					
					<!-- / 카드 -->
					
					</c:forEach>
					
				</div>
				<!-- / 피드들 -->
				
			</div>
			<!-- / timeline -->
			
		</section>
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	
	</div>
	
	<!-- 삭제하기 Modal -->
	<div class="modal fade" id="moreModal" tabindex="-1" role="dialog">
	  <div class="modal-dialog modal-dialog-centered" role="document">
	    <div class="modal-content">
	      
	      <div class="modal-body text-center">
	        <a href="#" id="deleteBtn"> 삭제하기 </a>
	      </div>
	      
	    </div>
	  </div>
	</div>
	<!-- / 삭제하기 Modal -->
	
	<script>
		$(document).ready(function() {
			
			$("#deleteBtn").on("click", function(e) {
				
				e.preventDefault();
				
				let postId = $(this).data("post-id");
				
				$.ajax({
					type:"get"
					, url:"/post/delete"
					, data:{"postId":postId}
					, success:function(data) {
						if(data.result == "success") {
							location.reload();
						}else {
							alert("삭제 실패");
						}
					}
					, error:function() {
						alert("삭제 에러");
					}
				});
				
			});
			
			
			// - ...에 이벤트 등록
			$(".more-btn").on("click", function() {
				
				// 모달의 삭제하기 a 태그에 data-post-id 속성에,
				// 현재 more-btn이 포함된 postId 를 저장한다
				let postId = $(this).data("post-id");
				
				$("#deleteBtn").data("post-id", postId);
				
				
			});
			
			// - 댓글 쓰기
			$(".comment-btn").on("click", function(e) {
				
				let postId = $(this).data("post-id");
				
				// $("#commentInput6")
				let comment = $("#commentInput" + postId).val();
				
				$.ajax({
					type:"post"
					, url:"/post/comment/create"
					, data:{"postId":postId, "content":comment}
					, success:function(data) {
						
						if(data.result == "success") {
							location.reload();
						} else {
							alert("댓글 쓰기 실패");
						}
					}
					, error:function() {
						alert("댓글 에러");
					}
				});
				
			});
			
			// - 좋아요 취소
			$(".unlike-btn").on("click", function(e) {
				
				e.preventDefault();
				
				let postId = $(this).data("post-id");
				
				$.ajax({
					type:"get"
					, url:"/post/unlike"
					, data:{"postId":postId}
					, success:function(data) {
						
						if(data.result == "success") {
							location.reload();
						}else {
							alert("좋아요 취소 실패");
						}
					}
					, error:function() {
						alert("좋아요 취소 에러");
					}
				});
			});
			
			// - 좋아요 
			$(".like-btn").on("click", function(e) {
				
				e.preventDefault(); 
				
				let postId = $(this).data("post-id");
				
				$.ajax({
					type:"get"
					, url:"/post/like"
					, data:{"postId":postId}
					, success:function(data) {
						
						if(data.result == "success") {
							location.reload();
						} else {
							alert("좋아요 실패");
						}
						
					}
					, error:function() {
						alert("좋아요 에러");
					}
				});
				
			});
			
			// - 유효성 검사 & 게시물 업로드
			$("#uploadBtn").on("click", function() {
				
				let content = $("#contentInput").val();
				
				if(content == "") {
					alert("내용을 입력하세요.");
					return ;
				}
				
				// 파일에 대한 유효성 검사
				if($("#fileInput")[0].files.length == 0) {
					alert("이미지를 선택해주세요.");
					return ;
				}
				
				let formData = new FormData();
				formData.append("content", content);
				formData.append("file", $("#fileInput")[0].files[0]);
				
				$.ajax({
					type:"post"
					, url:"/post/create"
					, data:formData
					, enctype:"multipart/form-data"
					, processData:false
					, contentType:false
					, success:function(data) {
						if(data.result == "success") {
							location.reload();
						} else {
							alert("업로드 실패");
						}
					}
					, error:function() {
						alert("업로드 에러");
					}
				});
				
			});
			
			
			
			$("#imageIcon").on("click", function() {
				
				// 파일인풋을 클릭한 효과
				$("#fileInput").click();
				
			});
			
		});
	
	
	
	
	
	
	
	</script>

</body>
</html>