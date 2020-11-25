<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
	import="Shoemuf.*"    
%>
<% //로그인이 되었이어야  보여지도록 검증
   if(session.getAttribute("id")==null){
        response.sendRedirect("index.jsp");
   }else{
%> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
</head>
<body>
	<form name="myform" action="myDelete.jsp" method="post">
		아이디 : <input type=text name="id"  size="15" maxlength="12"><br/>
		비밀번호 : <input type=password name="pwd"  size="15" maxlength="12"><br/>
       
		<input type=submit value="회원탈퇴">
		<input type="button" value="취  소" onclick="location.href='index.jsp'">
	</form>
</body>
</html>
<%}%>