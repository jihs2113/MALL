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
<title>home.jsp</title>
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
        <div class="intro-lead-in">Welcome To Start Mall!</div>
        <div class="intro-heading text-uppercase"></div>
        <a class="btn btn-primary btn-xl text-uppercase js-scroll-trigger" href="#stories">Tell Me More</a>
      </div>
    </div>
  </header>
<!-- Services -->
  <section class="page-section" >
	 <div class="container">
 	<div class="row">
	<div class="col-sm-12 col-sm-offset-4">
	<ol class="breadcrumb">
			<li><a href="list.do">회원가입 폼</a></li>
	</ol>
	<!-- novalidate 는 웹브라우저의 기본 validate 를 막는다 -->
	<form action="signup.do" method="post" id="signupForm" novalidate>
		<div class="form-group has-success has-feedback">
			<label class="control-label" for="id">아이디</label>
			<input type="text" class="form-control" name="id" id="id"/>
			<button id="checkBtn"  class="btn btn-primary">중복확인</button>
			<span id="checkResult"></span>
		</div>
		<br/>
		<div class="form-group has-error has-feedback">
			<label class="control-label" for="pwd">비밀번호</label>
			<input type="password" class="form-control" name="pwd" id="pwd"/><br/>
		</div>
		<div class="form-group has-error has-feedback">
			<label class="control-label" for="email">이메일</label>
			<input type="email" class="form-control" name="email" id="email" /><br/>
		</div>
		<button type="submit" class="btn btn-primary">가입</button>
		<button type="reset" class="btn btn-warning">취소</button>
		
	</form>
</div>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/jquery.smooth-scroll.js"></script>

<script>
	//폼의 유효성 여부 
	var formValid=false;
	//플러그인 동작 시키기 
	var  scrollDistance=$(".breadcrumb").offset().top - 80;
	$.smoothScroll(scrollDistance);
	
	$("#id").focus();
	
	//아이디 중복 확인 버튼을 눌렀을때 실행할 함수 등록
	$("#checkBtn").click(function(){
		//입력한 아이디를 읽어와서 
		var inputId=$("#id").val();
		//ajax 요청을 통해서 서버에 보내서 사용가능 여부를 json 으로 응답받기
		$.ajax({
			url:"${pageContext.request.contextPath }/users/checkid.do",
			method:"get",
			data:{inputId:inputId},
			success:function(responseData){
				if(responseData.canUse){//사용 가능한 아이디라면
					$("#checkResult").text("사용가능");
					formValid=true;
				}else{
					$("#checkResult").text("사용불가");
					formValid=false;
				}
			}
		});
		return false;// 폼 제출 막기 
	});
	//폼에 submit 이벤트가 일어났을때 실행할 함수 등록
	$("#signupForm").on("submit", function(){
		if(!formValid){//폼이 유효 하지 않다면
			return false; //폼 전송 막기
		}
	});
</script>
</body>
</html>








