<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    
    import="Shoemuf.*"
    %>
    
 <%
	request.setCharacterEncoding("utf-8");
	String id = (String) session.getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String title = request.getParameter("title");
String content =request.getParameter("content");
String writeDate = request.getParameter("writeDate");

BoardBean q = new BoardBean(id, title, content, writeDate);
BoardDAO dao = new BoardDAO();
dao.addQna(q);
%>
	<h2>1:1문의</h2>
	<form action="" method="post">
		<table align="center">
			<tr>
				<td>작성자</td>
				<td><%=q.getId() %></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><%=q.getTitle() %></td>
			</tr>
			<tr>
				<td>문의내용</td>
				<td><%=q.getContent() %></td>
			</tr>
			<tr>
				<td>작성일</td>
				<td><%=q.getWriteDate() %></td>
			</tr>
		</table>
		<a href="qna.jsp"><input type="button" value="확인" /></a>
	</form>
</body>
</html>