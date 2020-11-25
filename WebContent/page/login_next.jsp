<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    
    
    import="Shoemuf.*"
    %>





<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
    request.setCharacterEncoding("utf-8");
 
    String id =request.getParameter("id");
    String pwd =request.getParameter("pwd");
     
    MemberDAO manager =MemberDAO.getInstance();
    int check=manager.userCheck(id, pwd);
     
    //userCheck에서 x를 return 받아서 로긴체크
    //history.go(-1); : 전페이지로 (입력창)
    if(check==1){
        //로그인 성공
        session.setAttribute("id",id);
        response.sendRedirect("index.jsp");
         
    }else if(check==0){   
%> 
    <script>
        alert("비밀번호가 맞지 않습니다.");
        history.go(-1);       
    </script>
<%}else{ %>
    <script>
        alert("아이디가 맞지 않습니다.");
        history.go(-1);       
    </script>
<%} %>


  
</body>
</html>