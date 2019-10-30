<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>views/file/private/upload.jsp</title>
</head>
<body>
<c:choose>
	<c:when test="${isSuccess }">
		<p>파일을 저장했습니다.</p>
		<a href="../list.do">파일 목록 보기</a>
	</c:when>
	<c:otherwise>
		<p>파일 저장 실패</p>
	<a href="upload_form.do">다시 업로드</a>
	</c:otherwise>
</c:choose>
</body>
</html>






