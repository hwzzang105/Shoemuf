<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"

	import="Shoemuf.*"
    
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
	
</head>
<body>
<%
    if(session.getAttribute("id")==null){
        response.sendRedirect("index.jsp");
    }else{
        request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="member" class="Shoemuf.MemberBean">
    <jsp:setProperty name="member" property="*"/>
</jsp:useBean>
<%
    member.setId((String)session.getAttribute("id"));
 	
    MemberDAO manager = MemberDAO.getInstance();
   	manager.updateMember(member);
   	
%>

<script>
alert("회원수정성공!");
location.href="index.jsp";
</script>

</body>
</html>

<%}%>