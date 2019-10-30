<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8"/>
<title>views/cafe/list2.jsp</title>
<script src="${pageContext.request.contextPath}/resources/css/bootstrap.css"></script>
</head>
<body>
<div class="container">
	<a href="insertfrom.do">새글작성</a>
	<h3>카페글~~</h3>
	<table class="table table-bordered">
		<thead>
			<tr>
				<th>번호</th>
				<th>작성자</th>
				<th>제목</th>
				<th>조회수</th>
				<th>등록일</th>
			</tr>
		</thead>	
		<tbody>
			<c:forEach var="tmp" items="${list }">
				<tr>
					<td>${tmp.num }</td>
					<td>${tmp.writer }</td>
					<td><a href="detail.do?num=${tmp.num }&condition=${condition}&keyword=${encodedKeyword}">${tmp.title }</a>}</td>
					<td>${tmp.viewCount }</td>
					<td>${tmp.regdate}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="page-display">
		<ul class="pagination">
		<c:choose>
			<c:when test="${startPageNum ne 1 }">
				<li>
					<a href="list.do?pageNum=${startPageNum-1 }&condition=${condition}&keyword=${encodedKeyword">
						&laquo;
					</a>
				</li>
		</c:when>
		<c:otherwise>
			<li class="disabled">
				<a href="javascript:">&laquo;</a>
			</li>
		</c:otherwise>
	</c:choose>		
	<c:forEach var="i" begin="${startPageNum }"
		end="${endPageNum }" step="1">
		<c:choose>
			<c:when test="${i eq pageNum }">
				<li class="active"><a href="list.do?pageNum=${i }&condition=${condition}&keyword=${endcodedKeyword">${i }</a></li>
			</c:when>
			<c:otherwise>
				<li><a href="list.do?pageNum=${i }&condition=${condition}&keyword=${encodedKeyword}">${i }</a></li>
			</c:otherwise>
		</c:choose>	
	</c:forEach>
	
		<c:choose>
			<c:when test="${endPageNum lt totalPageCount }">
				<li>
					<a href="list.do?pageNum=${endPageNum+1 }&condition=${condition}&keyword=${encodedKeyword}">
						&raquo;
					</a>
				</li>
				</c:when>
			<c:otherwise>
				<li class="disabled">
					<a href="javascript:">&raquo;</a>
				</li>
			</c:otherwise>
		</c:choose>
		</ul>
	</div>
	<%-- 글 검색 기능 폼 --%>
	
	<form action="list.do" method="get">
		<label for="condition">검색조건</label>
		<select name="condition" id="condition">
			<option value="titlecontent" <c:if test="${condition eq 'titlecontent' }">selected</c:if>>제목+내용</option>
			<option value="title"<c:if test="${condition eq 'title' }">selected</c:if>>제목</option>
			<option value="writer" <c:if test="${condition eq 'writer' }">selecter</c:if>>작성자</option>
		</select>
		<input type="text" name="keyword" placeholder="검색어 입력.." value="${keyword} " />
		<button type="submit">검색</button>
	</form>
	
	<c:if test="${not empty keyword }">
		<p>
			<strong>${keyword }</strong>라는 검색어로
			<strong>${totalRow }</strong>개의 글이 검색되었습니다.
		</p>
	</c:if>
</div>

</body>
</html>