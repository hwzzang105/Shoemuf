<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*,Shoemuf.*"
    %>
<%
	request.setCharacterEncoding("utf-8");
	//String id = (String) session.getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1문의</title>
</head>
<body>
<jsp:include page="header.jsp"/>
<%
request.setCharacterEncoding("utf-8");
String id = request.getParameter("id");
String content = request.getParameter("content");
BoardDAO dao = new BoardDAO();
BoardBean qnaBean = dao.qnaInfo(id, content);
%>
	<h2>1:1문의</h2>
	<form action="" method="post">
		<table>
			<tr>
				<td>작성자</td>
				<td><%=id %></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><%=qnaBean.getTitle() %></td>
			</tr>
			<tr>
				<td>문의내용</td>
				<td><%=qnaBean.getContent() %></td>
			</tr>
			<tr>
				<td>작성일</td>
				<td><%=qnaBean.getWriteDate() %></td>
			</tr>
		</table>
		<a href="qnaModify.jsp"><input type="button" value="수정하기" /></a>
		<input type="submit" value="모두삭제" />
	</form>
<jsp:include page="footer.jsp"/>
</body>
</html>