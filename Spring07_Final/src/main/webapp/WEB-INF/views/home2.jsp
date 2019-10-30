<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8"/>
<title>Insert title here</title>
</head>
<body>
<c:choose>
	<c:when test="${empty id }">
		<a href="users/loginform.do">로그인</a>
		<a href="users/signup_form.do">회원가입</a>
	</c:when>
	<c:otherwise>
	<p>
		<a href="users/info.do">  ${id }</a>님 로그인중...
		<a href="users/logout.do">로그아웃</a>
	</p>
	</c:otherwise>
</c:choose>
<h3>김지환님 페이지다.</h3>
<ul>
	<li><a href="play.do"></a></li>
	<li><a href="cafe/list.do"></a></li>
	<li><a href="file/list.do"></a></li>
</ul>
<h4>공지사항이요~~~</h4>
	<ul>
		<c:forEach var="tmp" items="${noticeList }">
			<li>${tmp }</li>
		</c:forEach>
	</ul>
</body>
</html>