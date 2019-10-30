<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
<title>views/file/list.jsp</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
 <script type="text/javascript" src="http://maps.google.com/maps/api/js?key=AIzaSyBNZX-6kv1qXqu1MCEdfqZPNiAYu9hyKOE" ></script>
<!-- Bootstrap core CSS -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" >

  <!-- Custom fonts for this template -->
  <link rel="stylesheet" type="text/css"  href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css">
  <link rel="stylesheet" type="text/css"  href="https://fonts.googleapis.com/css?family=Montserrat:400,700" >
  <link rel="stylesheet" type="text/css"  href='https://fonts.googleapis.com/css?family=Kaushan+Script' >
  <link rel="stylesheet" type="text/css"  href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' >
  <link rel="stylesheet" type="text/css"  href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' >

  <!-- Custom styles for this template -->
  <link rel="stylesheet"  href="${pageContext.request.contextPath}/resources/css/agency.min.css">

  <style>
		.breadcrumb{
			border: 1px solid red;
		
			font-weight: bold;
			color: white;
		}
		
		#map_ma {
			width:100%; 
			height:400px; 
			clear:both; 
			border:solid 1px red;
		}
</style>
</head>
<body id="page-top" onload=init();>
    <!--사이드메뉴-->
    <div style="position: fixed; bottom: 106px; right: 15px; ">
    <a href="${pageContext.request.contextPath }/home.do"><img src="${pageContext.request.contextPath}/resources/sidemenu/home.png" title="홈으로"></a>
    </div>
    <div style="position: fixed; bottom: 74px; right: 15px; ">
    <a href="${pageContext.request.contextPath}/users/signup_form.do?url=${pageContext.request.contextPath}/home.do"><img src="${pageContext.request.contextPath}/resources/sidemenu/key.png" title="로그인"></a>
    </div>
    <div style="position: fixed; bottom: 42px; right: 15px; ">
    <a href="#page-top"><img src="${pageContext.request.contextPath}/resources/sidemenu/up.png" title="위로 가기"></a>
    </div>
    <div style="position: fixed; bottom: 10px; right:  15px;">
    <a href="#page-down"><img src="${pageContext.request.contextPath}/resources/sidemenu/down.png" title="아래로 가기"></a>
    </div>
    <!--사이드메뉴-->
   <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
    <div class="container" >
      <a class="navbar-brand js-scroll-trigger" href="#page-top">Start Mall</a>
      <button class="navbar-toggler navbar-toggler-right" type="button" style="color:yellow" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        Menu
        <i class="fas fa-bars"></i>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav text-uppercase ml-auto">
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="#services" style="color:yellow">Services</a>
          </li>
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="#portfolio" style="color:yellow">Category</a>
          </li>
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="#about" style="color:yellow">Stories</a>
          </li>
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="#team" style="color:yellow">Team</a>
          </li>
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="#contact" style="color:yellow">Contact</a>
          </li>
         <c:choose>
			<c:when test="${not empty id }">
				
				<p class="navbar-text pull-right"><a class="navbar-link" href="${pageContext.request.contextPath }/users/info.do" style="color:yellow">
				<strong>${id }</strong></a>님   <a class="navbar-btn pull-right" href="${pageContext.request.contextPath}/users/logout.do" style="color:yellow">로그아웃</a></p>
				
			</c:when>
			<c:otherwise> 
				<p class="navbar-text pull-right"><a class="navbar-link" href="${pageContext.request.contextPath }/users/loginform.do?url=${pageContext.request.contextPath}/home.do" style="color:yellow">로그인   /</a>
				<a class="navbar-link pull-right" href="${pageContext.request.contextPath}/users/signup_form.do?url=${pageContext.request.contextPath}/home.do" style="color:yellow">회원가입</a></p>
				
			</c:otherwise>
		</c:choose>
        </ul>
      </div>
    </div>
  </nav>

  <!-- Header -->
  <header class="masthead">
    <div class="container">
      <div class="intro-text">
        <div class="intro-lead-in">SALE</div>
        <div class="intro-heading text-uppercase"></div>
        <a class="btn btn-primary btn-xl text-uppercase js-scroll-trigger" href="#stories">Click Me</a>
      </div>
    </div>
  </header>
<!-- Services -->
  <section class="page-section" >
	 <div class="container">
 	<div class="row">
	<div class="col-sm-12 col-sm-offset-4">
	<ol class="breadcrumb">
			<li><a href="list.do">찾아오시는 길</a></li>
	</ol>
			<div>
				<img src="${pageContext.request.contextPath }/resources/images/n1.jpg" />
				<img src="${pageContext.request.contextPath }/resources/images/logo.jpg" />
			</div>
			<div>
				<img src="${pageContext.request.contextPath}/resources/img/logos/envato.jpg"  />
				<img src="${pageContext.request.contextPath}/resources/img/logos/designmodo.jpg"  />
				<img src="${pageContext.request.contextPath}/resources/img/logos/themeforest.jpg"  />
				<img src="${pageContext.request.contextPath}/resources/img/logos/creative-market.jpg"  />
			</div>
			<div id="map_ma"></div>
		</div>
	</div>
</section>


<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.js"></script>
<script src="${pageContext.request.contextPath}/resources/css/bootstrap.css"></script>
<script src="${pageContext.request.contextPath }/resources/js/jquery.smooth-scroll.js"></script>

<script type="text/javascript">
	//스크롤
	var  scrollDistance=$(".breadcrumb").offset().top;
	$.smoothScroll(scrollDistance);

	//지도
	$(document).ready(function() {
		var myLatlng = new google.maps.LatLng(37.405775, 127.120946); // 위치값 위도 경도
		var Y_point			= 37.405775;		// Y 좌표
		var X_point			= 127.120946;		// X 좌표
		var zoomLevel		= 18;				// 지도의 확대 레벨 : 숫자가 클수록 확대정도가 큼
		var markerTitle		= "성남시";		// 현재 위치 마커에 마우스를 오버을때 나타나는 정보
		var markerMaxWidth	= 300;				// 마커를 클릭했을때 나타나는 말풍선의 최대 크기
	
	// 말풍선 내용
		var contentString	= '<div>' +
		'<h2>성남시</h2>'+
		'<p>안녕하세요. 구글지도입니다.</p>' +
		
		'</div>';
		var myLatlng = new google.maps.LatLng(Y_point, X_point);
		var mapOptions = {
							zoom: zoomLevel,
							center: myLatlng,
							mapTypeId: google.maps.MapTypeId.ROADMAP
						}
		var map = new google.maps.Map(document.getElementById('map_ma'), mapOptions);
		var marker = new google.maps.Marker({
												position: myLatlng,
												map: map,
												title: markerTitle
		});
		var infowindow = new google.maps.InfoWindow(
													{
														content: contentString,
														maxWizzzdth: markerMaxWidth
													}
				);
		google.maps.event.addListener(marker, 'click', function() {
			infowindow.open(map, marker);
		});
	});
 </script>
</body>
</html>
















