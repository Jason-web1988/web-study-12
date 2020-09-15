<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link rel = "stylesheet" type="text/css" href="css/css.css">
<script type="text/javascript" 
src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
 $(function(){
	 var status=false;
	$('#update').on("click", function(){
		alert("수정");
		if(!status){
			$('input').each(function(index, value){
				$(this).attr("readonly",false);
				console.log($(this));
			});
				
			$('#name').attr('readonly', false);
			$('#title').attr('readonly', false);
			$('#email').attr('readonly', false);
			$('#content').attr('readonly', false);
			status = true;
		}else{
			if($('#pass').val() != $('#repass').val()){
				alert("비밀번호가 틀립니다.");
				$('#pass').val('');
				$('#repass').val('');
				$('#pass').focus();
				return;
			}
			
	 	var updateBoard = {
	 		num : $('#num').text(),	
			name : $('#name').val(),
			pass : $('#pass').val(),
			title : $('#title').val(),
			email : $('#email').val(),
			content: $('#content').val()
		}; 
		 	$.ajax({
				 type:"post",
				 url : "boardUpdate.do",
				 data:JSON.stringify(updateBoard),
				 success:function(data){
				 alert(data);
				 if(data ==1){
				 window.location.href="boardList.do";
				 }
		 	}
		 });	 
		}		
	
	});



		$('#remove').on("click", function() {			
			if($('#pass').val() != $('#repass').val()){
					alert("비밀번호가 틀립니다.");
					$('#pass').val('');
					$('#repass').val('');
					$('#pass').focus();
					return;
				}else{
			/* alert($('#num').text()+"column"+${board.num }); */
			var newNum = {
				num : $('#num').text()
			};

			$.ajax({
				type : "GET",
				url : "boardRemove.do?num=" + $('#num').text(),
				cache : false,
				success : function(data) {
					alert("삭제되었습니다." + data);
					window.location.href = "boardList.do"
				}
			});		
			}
		});
		
		$('#list').on("click", function() {
			location.href = "boardList.do";
		});

		$('#add').on("click", function() {
			location.href = "boardWrite.do";
		});

	});
</script>
</head>
<body>
${board }
<div id = "wrap" align="center">
<h1>게시글 상세보기</h1>
	<table>
		<tr>
			<th>번호</th>
			<td id="num">${board.num }</td>
			
			<th>작성자 </th> 
			<td><input type="text" id="name" value ="${board.name}" readonly="readonly"></td>
		</tr>
		<tr>
			<th>작성일</th><td id="writeDate"><fmt:formatDate value="${board.writeDate}"/></td>
			<th>조회수 </th><td id="readCount">${board.readCount}</td>
		</tr>
		
		<tr>
			<th>제목</th>
			<td><input type="text" id = "title" value ="${board.title }"readonly="readonly"></td>
			<th>이메일</th> <td><input type="email" id="email" value="${board.email}" readonly="readonly"></td>		
			
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input type="password" id="pass"></td>
			<th>비밀번호 확인</th>
			<td><input type="password" id="repass"></td>
		</tr>
		<tr>
			<th>내용</th>
			<td colspan = "3"><textarea cols="105" rows="15" id="content" " readonly="readonly" >${board.content }</textarea></td>
		</tr>		
	</table>
	<br><br>
	<button id="update">해당 게시글 수정</button>
	<button id="remove">해당 게시글 삭제</button>
	<button id="list">목록으로 되돌아 가기</button>
	<button id="add">새로운 글 작성하러 가기</button>
</div>
</body>
</html>