<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    
    import="Shoemuf.*"
    import="java.util.*"
    
    %>
<!DOCTYPE html>
<%  request.setCharacterEncoding("UTF-8"); %>    

<html>
<head>
<meta charset="UTF-8">

<title>alter</title>
</head>
<body>
<jsp:useBean id="member" class="Shoemuf.MemberBean">
    <jsp:setProperty name ="member" property="*"/>
</jsp:useBean>
 
<%
    MemberDAO manager = MemberDAO.getInstance();
    manager.insertMember(member);
%>     
<script>
alert("회원가입성공!");
location.href="index.jsp";
</script>

</body>
</html>