<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글 수정</title>
<link rel = "stylesheet" type="text/css" href="css/css.css">
<script type="text/javascript" 
src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<div id = "wrap" align="center">
<h1>게시글 상세보기</h1>
	<table>
		<tr>
			<th>번호</th>
				<td id="num">${board.num }</td>
			<th>작성자 </th> 
				<td><input type="text" id = "name" value="${board.name}"></td>
								
		</tr>
		<tr>
			<th>작성일</th><td><fmt:formatDate value="${board.writeDate}"/></td>
			<th>조회수 </th> <td>${board.readCount}</td>
		</tr>
		
		<tr>
			<th>제목</th>
			<td><input type="text" id="title" value="${board.title }"></td>
			<th>이메일</th> <td><input type="email" id="email" value="${board.email}"></td>		
		</tr>
		
		<tr>
			<th>내용</th>
			<td colspan="3"><pre><textarea>${board.content }</textarea></pre></td>
		</tr>		
	</table>
	<br><br>
	<button id="update">수정</button>
	<button id="remove">삭제</button>
	<button id="list">목록</button>
	<button id="add">등록</button>
</div>
</body>
</html>