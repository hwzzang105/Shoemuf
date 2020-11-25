<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
	
	import="Shoemuf.*"
	import="java.util.List"
	
%>

<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String writeDate = request.getParameter("writeDate");

	
	BoardBean q = new BoardBean(id, title, content, writeDate);
	BoardDAO dao = new BoardDAO();
	dao.delQnaAll(q);
	List qnaList = dao.qnaList();
%>



<!DOCTYPE html>
<style>
	
	.col1 { width: 10%; }
    .col2 { width: 30%; }
    .col3 { width: 10%; }
    .col4 { width: 10%; }
  	
	table{ padding:0; border:0; border-spacing:0px; border-collapse:collapse; }
    th, td{ padding:0; }
	.con_qna { clear:both; width: 1000px; margin: 0 auto; padding: 0 0 50px;}
	.qna_board { margin: 0 0 10px; }
	.board_tit h2 { font-size: 15px; font-family: Arial,돋움; color: #555; letter-spacing: 2px;}
	.board_table { width: 1000px; board-bottom: 1px solid #e3e3e3; font-size: 15px;}
	.board_table thead tr th { padding: 9px 0 7px; border-top: 1px solid #e3e3e3; border-bottom: 1px solid #e3e3e3; font-weight: normal; font-size: 15px; letter-spacing: 0px;}
	.board_table tbody tr td { padding: 18px 0 16px; border-top: 1px dotted #e3e3e3; line-height: 140%; text-align: center; vertical-align: middle;}
</style>
<html>
<head>
<meta charset="UTF-8">
<title>Q & A</title>
</head>
<jsp:include page="header.jsp" flush="false" />
<body>

	<div class="con_qna">
		<form action="qnaList2.jsp">
		<div class="qna_board">
			<div class="board_tit">
				<h2>
					<font color="#333">Q & A</font>
				</h2>
			</div>
			<div class="board_list">
			
				<table border="1" class="board_table">
					<thead>
						<tr>
							<th class="col1">작성자</th>
							<th class="col2">제목</th>
							<th class="col3">내용</th>
							<th class="col4">작성일</th>
						</tr>
					</thead>
					
					<tbody>
						<% if(qnaList.size() == 0) { %>
						<tr>
					      <td colspan="4">
					        <p style="text-align:center; font-size:9pt;">
					        	<strong><span>등록된 문의글이 없습니다.</span></strong>
					        </p>
					      </td>
						</tr>
						<%
							} else {
								for(int i=0;i<qnaList.size();i++) {
									BoardBean bean = (BoardBean) qnaList.get(i);
						%>
						<tr>
							<td class="number"><%=bean.getId() %></td>
							<td class="subject" ><a href="qnaShow.jsp" class="lst" style="color: #333;"><%=bean.getTitle() %></a></td>
							<td class="writer" ><a href="qnaShow.jsp" class="lst" style="color: #333;" name="content" ><%=bean.getContent() %></a></td>
							<td class="date"><%=bean.getWriteDate() %></td>
						</tr>
						<%
								}
							}
						%>	
					</tbody>
					
				</table>
				
			</div>
		</div>
		
		<div class="page_next">
			
		<%

			//if logined userID라는 변수에 해당 아이디가 담기고 if not null

			if (session.getAttribute("id") != null) {

%>

			<a href="write.jsp"><input type="button" value="글쓰기" /></a>
			<input type="submit" value="모두삭제" />
<%

			} else {

%>

			<button  onclick="if(confirm('로그인 하세요'))location.href='login.jsp';" type="button" >글쓰기</button>
			<button  onclick="if(confirm('로그인 하세요'))location.href='login.jsp';" type="submit" >모두삭제</button>
<%

			}

%>		
			
			
		</div>
		</form>
	</div>

</body>
<jsp:include page="footer.jsp" flush="false" />
</html>