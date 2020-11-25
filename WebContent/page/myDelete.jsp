<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
	import="Shoemuf.*"    
%>
<% //로그인이 되었이어야  보여지도록 검증
   if(session.getAttribute("id")==null){
        response.sendRedirect("index.jsp");
   }else{
%> 



<%
    String id =request.getParameter("id");
    String pwd = request.getParameter("pwd");
     
    MemberDAO manager = MemberDAO.getInstance();
    int check= manager.userCheck(id, pwd);
     
    if(check==1){
        manager.deleteMember(id);
        session.invalidate();       
%> 




<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
</head>
<body>
	<h4>회원 정보 삭제</h4>
	<div align="center">
	회원정보가 삭제되었습니다.<br/>
	<input type= "button" value="확인" onClick="location.href='index.jsp'">
	</div>
</body>
</html>
<%}else{%>
    <!-- 무엇이 틀렸는지 안알려준다  보안! -->
    <script>
        alert("id 또는 비밀번호가 맞지 않습니다.");
        history.go(-1);
    </script>



<%  	
		}
	}
%>