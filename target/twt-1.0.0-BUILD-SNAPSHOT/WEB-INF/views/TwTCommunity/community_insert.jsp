<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TWT - Community</title>

<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css">
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>

<link rel="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/scss/bootstrap/bootstrap.scss">
<!-- <link rel="stylesheet" href="css/style.css"> -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/form.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/community/community_insert_css.css">

<script type="text/javascript">
	$(document).ready(function() {
		$("#sidebar").load("common/sidebar.jsp")
	});

	$(".hover").mouseleave(function() {
		$(this).removeClass("hover");
	});
	
	$(document).ready(function() {
		  $("#summernote").summernote({
		        minHeight: 600,
		        maxHeight: null,
		        focus: true, 
		        lang : "ko-KR",
				callbacks: {	//여기 부분이 이미지를 첨부하는 부분
					onImageUpload : function(files) {
						uploadImageFile(files[0], this);
					}
				}
		  });
		});
	  
		function uploadImageFile(file, editor) {
			data = new FormData();
			data.append("file", file);
			$.ajax({
				data : data,
				type : "POST",
				url : "uploadImageFile.do",
				contentType : false,
				processData : false,
				enctype: "multipart/form-data",
				success : function(data) {
	            	//항상 업로드된 파일의 url이 있어야 한다.
					$(editor).summernote("insertImage", data.url);
				},
				error : function(){
					alert("실패");
				}
			});
		}
</script>
<style type="text/css">
body {
	background-image: url("${pageContext.request.contextPath}/resources/images/account/mypage_bg.jpg");
	background-repeat: no-repeat;
	background-size: cover;
}
.btns.btns-primary.btns-outline-primary:hover {
    border: 1px solid #fc3c3c;
    background: #fc3c3c;
    color: #fff;
}
.btns.btns-primary.btns-outline-primary {
    border: 1px solid #fc3c3c;
    background: transparent;
    color: #fc3c3c;
}

</style>
</head>
<body>
	<form id="" method="post" action="" enctype="multipart/form-data">
	<div class="col-sm-9" id="container">
		<div class="col-sm-12" style="float: left; margin-top: 30px;">
			<div class="title">
				<input type="text" placeholder="제목"/>
			</div>
			<br> <br> <br> <br>

			<div class="row row-cols-1 row-cols-md-3">
				<div class="col mb-4">
					<div class="card h-100">
						<textarea id="summernote" name="content" class="card-img-top" alt="..."></textarea>
					</div>
				</div>
			</div>
		</div>
		<div align="center">
			<input type="submit" style="width: 60px;" class="btns btns-primary btns-outline-primary mt-4 px-4 py-3" value="등록" />
			&nbsp;&nbsp;&nbsp;
			<input type="button" style="width: 60px;" class="btns btns-primary btns-outline-primary mt-4 px-4 py-3" value="취소" />
		</div>
	</div>
	</form>
</body>
</html>