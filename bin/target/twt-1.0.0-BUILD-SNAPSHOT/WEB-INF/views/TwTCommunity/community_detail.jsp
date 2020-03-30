<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<!-- 아이콘 -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
	
    <title>TwT - Community</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic' rel='stylesheet' type='text/css'>
    <link rel="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Alex+Brush" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/animate.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/magnific-popup.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/aos.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/ionicons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery.timepicker.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/flaticon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/icomoon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/community/community_detail_css.css">
	<link href = "https://fonts.googleapis.com/css?family= Modak & display = swap"rel = "stylesheet">
    
<script src="https://kit.fontawesome.com/6953482b42.js" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
/* $(function () {
	  // Smooth Scroll
	  $('a[href*=#]').bind('click', function(e){
	    var anchor = $(this);
	    $('html, body').stop().animate({
	      scrollTop: $(anchor.attr('href')).offset().top
	    }, 1000);
	    e.preventDefault();
	  });
	}); */
</script>

<style type="text/css">
.btn.btn-primary:hover {
    border: 1px solid #fc3c3c;
    background: #fc3c3c;
    color: white;
}

.btn.btn-primary {
    background: #fc3c3c;
    border: 1px solid #fc3c3c;
    color: #fff;
}

.tagcloud a:hover {
    border: 1px solid #fc3c3c;
    color: #fc3c3c;
}

.block-21 .text .heading a:hover, .block-21 .text .heading a:active, .block-21 .text .heading a:focus {
    color: #fc3c3c;
}

.block-21 .blog-img {
    display: block;
    height: 100px;
    width: 100px;
}

.comment-list li .comment-body .reply:hover {
    color: #fff;
    background: #ffba00;
}

.p-5 {
    padding: 2rem !important;
}

.subc {
    background: #ffba00 !important;
    border: 1px solid #ffba00 !important;
    color: #fff !important;
}

.subc:hover {
    border: 1px solid #ffba00 !important;
    background: #ffba00 !important;
    color: white !important;
}

.pl-4, .px-4 {
    padding-left: 1rem !important;
    padding-right: 1rem !important;
}

.pb-3, .py-3 {
    padding-bottom: 0.5rem !important;
    padding-top: 0.5rem !important;
}
</style>
</head>
<body id="body">
    
  <!-- 오른쪽 네비게이션 메뉴 DIV 시작 -->
	<div id="sidebar"><%@ include file="/WEB-INF/views/TwTAccount/common/sidebar.jsp" %></div>
	<!-- sidebar end -->
	
  	<!-- header -->
	<%@ include file="../header.jsp" %>
	<!-- header css 적용 -->
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script type="text/javascript">
	    $(document).ready(function() {
	      $("#nav3").addClass("active")
	      $(".hero-wrap").attr('style',"background-image: url('${pageContext.request.contextPath}/resources/images/bg_7.jpg');");
	      $(".bread").text('Community');
	   	});
   	</script>


   <!-- 폼 넣는 위치 -->
   <section class="ftco-section ftco-degree-bg" style="padding: 2em 0;">
      <div class="container">
        <div class="row">
          <div class="col-md-8 ftco-animate">
          <p style="text-align: left; margin-left: 60px; margin-bottom: 30px; font-weight:bold;"><i class="fas fa-user"></i> (아이디)님의 여행일정</p>
          
            <h2 class="mb-3" style="text-align: center; margin-top: 40px; font-weight: bold; ">제목</h2>
            <div class="plan_info" style="float: right; margin-top: 20px; ">
					<div class="plan_info_box" style="margin-top: -25px; margin-right: 50px; ">
						<div class="cnt_spot">
						<i class="fas fa-map-marker-alt"></i>
						</div>
						<div class="cnt_view">
						<i class="far fa-eye"></i>
						</div>
						<div class="cnt_copy">
						<i class="fas fa-heart" style="color:#fc3c3c;"></i>
						</div>
					</div>
				</div>
				
 <main id="home" class="contents">
  <div class="container">
    <h3 class="page-title text-center" style="margin-top: 120px; margin-left: 62px; color: silver; font-size: 17px;"><i class="fas fa-calendar-alt"></i>&nbsp; 2020.02.03 ~ 2020.02.06&nbsp;(여행기간)</h3>
    <ul class="timeline">
      <li class="timeline-line"></li>
      <li class="timeline-group">
        <a href="#" class="btn btn-primary">2020.02.03 <br>DAY1</a>
      </li>
    </ul>
    <ul class="timeline">
      <li class="timeline-line"></li>
      <li class="timeline-item">
        <div class="timeline-badge"><a href="#"></a></div>
        <div class="timeline-panel">
          <div class="timeline-heading">
            	지역 이름
            <div class="timeline-date"><i class="fas fa-tag"></i> 지역 설명 태그</div>
          </div>
          <div class="timeline-content">
            <ul>
              <li><code>CSS</code> added line 205 to 207 for <i>timeline date</i></li>
              <li><code>CSS</code> changed line @ 269 from <i>1199px to 991px</i></li>
              <li><code>HTML</code> + <code>CSS</code> and many more ... </li>
            </ul>
          </div>
          <div class="timeline-footer">
            <small class="text-muted"><i class="far fa-file-alt fas-2x"></i> 메모?</small>
          </div>
        </div>
      </li>
      <li class="timeline-item">
        <div class="timeline-badge"><a href="#"></a></div>
        <div class="timeline-panel">
          <div class="timeline-heading">지역 이름
          <div class="timeline-date"><i class="fas fa-tag"></i> 지역 설명 태그</div>	
          </div>
          <div class="timeline-content">
            <p>Eu pid nunc urna integer, sed, cras tortor scelerisque penatibus facilisis a pulvinar, rhoncus sagittis ut nunc elit! Sociis in et?</p>
          </div>
        </div>
      </li>
      <li class="timeline-item">
        <div class="timeline-badge"><a href="#"></a></div>
        <div class="timeline-panel">
          <div id="about" class="timeline-heading">지역이름
          <div class="timeline-date"><i class="fas fa-tag"></i> 지역 설명 태그</div>
          </div>
          <div class="timeline-content">
            <p>Rubber cheese say cheese bocconcini. Caerphilly cheese and biscuits squirty cheese airedale lancashire cheese and biscuits rubber cheese squirty cheese. Ricotta fromage frais port-salut danish fontina cream cheese queso edam ricotta. Gouda monterey jack blue castello stilton rubber cheese.</p>
          </div>
        </div>
      </li>
      <li class="timeline-item">
        <div class="timeline-badge"><a href="#"></a></div>
        <div class="timeline-panel">
          <div id="services" class="timeline-heading">지역이름
          <div class="timeline-date"><i class="fas fa-tag"></i> 지역 설명 태그</div>
          </div>
          <div class="timeline-content">
            <p>Eu pid nunc urna integer, sed, cras tortor scelerisque penatibus facilisis a pulvinar, rhoncus sagittis ut nunc elit! Sociis in et? Rhoncus, vel dignissim in scelerisque. Dolor lacus pulvinar adipiscing adipiscing montes! Elementum risus adipiscing non, cras scelerisque risus penatibus? Massa vut, habitasse, tincidunt!</p>
            <div class="row services-list">
            </div>
            <p>Cottage cheese rubber cheese everyone loves. Cow monterey jack cheesy grin cauliflower cheese cheesy feet mozzarella emmental blue castello. Lancashire boursin blue castello taleggio babybel bocconcini fondue cheese triangles. Fromage frais cheese strings airedale boursin st. agur blue cheese squirty cheese pecorino.</p>
          </div>
        </div>
      </li>
      <li class="timeline-item">
        <div class="timeline-badge"><a href="#"></a></div>
        <div class="timeline-panel">
          <div class="timeline-heading">지역이름
          <div class="timeline-date"><i class="fas fa-tag"></i> 지역 설명 태그</div>
          </div>
          <div class="timeline-content">
            <p>Eu pid nunc urna integer, sed, cras tortor scelerisque penatibus facilisis a pulvinar, rhoncus sagittis ut nunc elit! Sociis in et? Rhoncus, vel dignissim in scelerisque. Dolor lacus pulvinar adipiscing adipiscing montes! Elementum risus adipiscing non, cras scelerisque risus penatibus? Massa vut, habitasse, tincidunt!</p>
            <div class="timeline-embed">
              <iframe width="478" height="320" src="https://www.youtube.com/embed/G7q07dyIsX8?list=RDEMeI4zMDi6uvY6C8nWWWoZ1A&amp;showinfo=0" frameborder="0" allowfullscreen></iframe>
            </div>
          </div>
        </div>
      </li>
      <li class="timeline-item">
        <div class="timeline-badge"><a href="#"></a></div>
        <div class="timeline-panel">
          <div class="timeline-heading">지역이름
          <div class="timeline-date"><i class="fas fa-tag"></i> 지역 설명 태그</div>
          </div>
          <div class="timeline-content">
            <p>Eu pid nunc urna integer, sed, cras tortor scelerisque penatibus facilisis a pulvinar, rhoncus sagittis ut nunc elit! Sociis in et? Rhoncus, vel dignissim in scelerisque. Dolor lacus pulvinar adipiscing adipiscing montes! Elementum risus adipiscing non, cras scelerisque risus penatibus? Massa vut, habitasse, tincidunt!</p>
            <div class="timeline-embed">
              <iframe src="https://www.google.com/maps/embed?pb=!1m10!1m8!1m3!1d15936.386801163795!2d101.61008935000001!3d3.0688275999999997!3m2!1i1024!2i768!4f13.1!5e0!3m2!1sen!2smy!4v1446881552869" width="478" height="320" frameborder="0" style="border:0" allowfullscreen></iframe>
            </div>
          </div>
        </div>
      </li>
    </ul>
    <ul class="timeline">
      <li class="timeline-line"></li>
      <li class="timeline-group">
        <a href="#" class="btn btn-primary">2020.02.04 <br>DAY2</a>
      </li>
    </ul>
    <ul class="timeline">
      <li class="timeline-line"></li><!-- /.timeline-line -->
       <li class="timeline-item">
        <div class="timeline-badge"><a href="#"></a></div>
        <div class="timeline-panel">
          <div class="timeline-heading">
            	지역 이름
            <div class="timeline-date"><i class="fas fa-tag"></i> 지역 설명 태그</div>
          </div>
          <div class="timeline-content">
            <ul>
              <li><code>CSS</code> added line 205 to 207 for <i>timeline date</i></li>
              <li><code>CSS</code> changed line @ 269 from <i>1199px to 991px</i></li>
              <li><code>HTML</code> + <code>CSS</code> and many more ... </li>
            </ul>
          </div>
          <div class="timeline-footer">
            <small class="text-muted"><i class="far fa-file-alt far-2x"></i> 메모?</small>
          </div>
        </div>
      </li>
    </ul>
  </div>
            
  <!-- 댓글  -->
            
            <div class="pt-5 mt-5">
              <h3 class="mb-5">6 Comments</h3>
              <ul class="comment-list">
                <li class="comment">
                  <div class="vcard bio">
                    <img src="${pageContext.request.contextPath}/resources/images/person_1.jpg" alt="Image placeholder">
                  </div>
                  <div class="comment-body">
                    <h3>John Doe</h3>
                    <div class="meta">June 27, 2018 at 2:21pm</div>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur quidem laborum necessitatibus, ipsam impedit vitae autem, eum officia, fugiat saepe enim sapiente iste iure! Quam voluptas earum impedit necessitatibus, nihil?</p>
                    <p><a href="#" class="reply">Reply</a></p>
                  </div>
                </li>

                <li class="comment">
                  <div class="vcard bio">
                    <img src="${pageContext.request.contextPath}/resources/images/person_1.jpg" alt="Image placeholder">
                  </div>
                  <div class="comment-body">
                    <h3>John Doe</h3>
                    <div class="meta">June 27, 2018 at 2:21pm</div>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur quidem laborum necessitatibus, ipsam impedit vitae autem, eum officia, fugiat saepe enim sapiente iste iure! Quam voluptas earum impedit necessitatibus, nihil?</p>
                    <p><a href="#" class="reply">Reply</a></p>
                  </div>

                  <ul class="children">
                    <li class="comment">
                      <div class="vcard bio">
                        <img src="${pageContext.request.contextPath}/resources/images/person_1.jpg" alt="Image placeholder">
                      </div>
                      <div class="comment-body">
                        <h3>John Doe</h3>
                        <div class="meta">June 27, 2018 at 2:21pm</div>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur quidem laborum necessitatibus, ipsam impedit vitae autem, eum officia, fugiat saepe enim sapiente iste iure! Quam voluptas earum impedit necessitatibus, nihil?</p>
                        <p><a href="#" class="reply">Reply</a></p>
                      </div>


                      <ul class="children">
                        <li class="comment">
                          <div class="vcard bio">
                            <img src="${pageContext.request.contextPath}/resources/images/person_1.jpg" alt="Image placeholder">
                          </div>
                          <div class="comment-body">
                            <h3>John Doe</h3>
                            <div class="meta">June 27, 2018 at 2:21pm</div>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur quidem laborum necessitatibus, ipsam impedit vitae autem, eum officia, fugiat saepe enim sapiente iste iure! Quam voluptas earum impedit necessitatibus, nihil?</p>
                            <p><a href="#" class="reply">Reply</a></p>
                          </div>

                            <ul class="children">
                              <li class="comment">
                                <div class="vcard bio">
                                  <img src="${pageContext.request.contextPath}/resources/images/person_1.jpg" alt="Image placeholder">
                                </div>
                                <div class="comment-body">
                                  <h3>John Doe</h3>
                                  <div class="meta">June 27, 2018 at 2:21pm</div>
                                  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur quidem laborum necessitatibus, ipsam impedit vitae autem, eum officia, fugiat saepe enim sapiente iste iure! Quam voluptas earum impedit necessitatibus, nihil?</p>
                                  <p><a href="#" class="reply">Reply</a></p>
                                </div>
                              </li>
                            </ul>
                        </li>
                      </ul>
                    </li>
                  </ul>
                </li>

                <li class="comment">
                  <div class="vcard bio">
                    <img src="${pageContext.request.contextPath}/resources/images/person_1.jpg" alt="Image placeholder">
                  </div>
                  <div class="comment-body">
                    <h3>John Doe</h3>
                    <div class="meta">June 27, 2018 at 2:21pm</div>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur quidem laborum necessitatibus, ipsam impedit vitae autem, eum officia, fugiat saepe enim sapiente iste iure! Quam voluptas earum impedit necessitatibus, nihil?</p>
                    <p><a href="#" class="reply">Reply</a></p>
                  </div>
                </li>
              </ul>
              <!-- END comment-list -->
              
              <div class="comment-form-wrap pt-5">
                <h3 class="mb-5">Leave a comment</h3>
                <form action="#" class="p-5 bg-light" style="margin-bottom:50px; ">

                  <div class="form-group">
                    <label for="message">Content</label>
                    <textarea name="" id="message" cols="60" rows="5" class="form-control"></textarea>
                  </div>
                  <div class="form-group" style="margin-left: 510px;">
                    <input type="submit" value="Post Comment" class="btn py-3 px-4 btn-primary subc">
                  </div>

                </form>
              </div>
            </div>

          </div> 
          
          <!-- .col-md-8 -->
          <div class="col-md-4 sidebar ftco-animate">

            <div class="sidebar-box ftco-animate">
              <h3><i class="fas fa-clipboard-list"></i> Recent Blog</h3>
              <div class="block-21 mb-4 d-flex">
                <a class="blog-img mr-4" style="background-image: url(${pageContext.request.contextPath}/resources/images/image_1.jpg);"></a>
                <div class="text">
                  <h3 class="heading"><a href="#">Even the all-powerful Pointing</a></h3>
                  <div class="meta">
                    <div><a href="#"><i class="fa fa-calendar"></i> 날짜</a></div>
                    <div><a href="#"><i class="fas fa-user"></i> 아이디</a></div>
                    <div><a href="#"><i class="far fa-eye far-2x"></i> 조회수</a></div>
                  </div>
                </div>
              </div>
              <div class="block-21 mb-4 d-flex">
                <a class="blog-img mr-4" style="background-image: url(${pageContext.request.contextPath}/resources/images/image_2.jpg);"></a>
                <div class="text">
                  <h3 class="heading"><a href="#">Even the all-powerful Pointing</a></h3>
                  <div class="meta">
                    <div><a href="#"><i class="fa fa-calendar"></i> 날짜</a></div>
                    <div><a href="#"><i class="fas fa-user"></i> 아이디</a></div>
                    <div><a href="#"><i class="far fa-eye far-2x"></i> 조회수</a></div>
                  </div>
                </div>
              </div>
              <div class="block-21 mb-4 d-flex">
                <a class="blog-img mr-4" style="background-image: url(${pageContext.request.contextPath}/resources/images/image_3.jpg);"></a>
                <div class="text">
                  <h3 class="heading"><a href="#">Even the all-powerful Pointing</a></h3>
                  <div class="meta">
                    <div><a href="#"><i class="fa fa-calendar"></i> 날짜</a></div>
                    <div><a href="#"><i class="fas fa-user"></i> 아이디</a></div>
                    <div><a href="#"><i class="far fa-eye far-2x"></i> 조회수</a></div>
                  </div>
                </div>
              </div>
            </div>

            <div class="sidebar-box ftco-animate">
              <h3><i class="fas fa-hashtag"></i> Tag</h3>
              <div class="tagcloud">
                <a href="#" class="tag-cloud-link">dish</a>
                <a href="#" class="tag-cloud-link">menu</a>
                <a href="#" class="tag-cloud-link">food</a>
                <a href="#" class="tag-cloud-link">sweet</a>
                <a href="#" class="tag-cloud-link">tasty</a>
                <a href="#" class="tag-cloud-link">delicious</a>
                <a href="#" class="tag-cloud-link">desserts</a>
                <a href="#" class="tag-cloud-link">drinks</a>
              </div>
            </div>

          </div>

        </div>
      </div>
    </section> <!-- .section -->

    <!-- footer -->
	<%@ include file="/WEB-INF/views/footer.jsp" %>
    

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


  <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/jquery-migrate-3.0.1.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/popper.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/jquery.easing.1.3.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/jquery.waypoints.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/jquery.stellar.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/jquery.magnific-popup.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/aos.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/jquery.animateNumber.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/bootstrap-datepicker.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/jquery.timepicker.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/scrollax.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="${pageContext.request.contextPath}/resources/js/google-map.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
    
  </body>
</html>