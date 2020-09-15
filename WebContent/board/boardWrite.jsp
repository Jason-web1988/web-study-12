<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link rel = "stylesheet" type="text/css" href="css/css.css">
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(function(){
	$('#add').on("click",function(){
		var newBoard={
				name:$('#name').val(),
				pass:$('#pass').val(),
				email:$('#email').val(),
				title:$('#title').val(),
				content:$('#content').val(),
				};
		$.ajax({
			type:"post",
			url:"boardWrite.do",
			cache: false,
			data: JSON.stringify(newBoard),
			success:function(data){
				alert("추가되었습니다." + data);
				window.location.href="boardList.do"
			}
		});
	});
	
	$('#reset').on("click", function(){
		$('input').each(function(index, value){
			$(this).val("")
		});
		$('textarea').val("");
	});
	$('#list').on("click", function(){
		location.href="boardList.do";
	});
	
});
</script>
</head>
<body>
<div id="wrap" align="center">
	<h1>게시글 등록</h1>
		<table>
			<tr>
				<th>작성자</th>			
				<td><input type="text" id ="name" name="name">*필수</td>
			</tr>
			
			<tr>
				<th>비밀번호</th>
				<td><input type="password" id="pass" name="pass">*필수</td>
			</tr>
			
			<tr>
				<th>이메일</th>
				<td><input type="text" id="email" name="email"></td>
			</tr>
			
			<tr>
				<th>제목</th>
				<td><input type="text" size="70" name="title" id="title">*필수</td>
				
				
			<tr>
				<th>내용</th>
				<td><textarea rows="15" cols="70" name="content" id="content"></textarea></td>
			</tr>	
		</table>
		<br><br>
		<button id="add">등록</button>
		<button id="reset">다시 작성</button>
		<button id="list">목록</button>
	</div>			 
</body>
</html>