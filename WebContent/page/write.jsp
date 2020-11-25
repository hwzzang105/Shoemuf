<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
	
	import="Shoemuf.*"
	import="java.util.Date"
	import="java.text.SimpleDateFormat"
%>

<% 
request.setCharacterEncoding("utf-8"); 
Date nowDate = new Date();
SimpleDateFormat sf = new SimpleDateFormat("yyyy년 MM월 dd일");
String id = (String) session.getAttribute("id");
%>
    
    
<!DOCTYPE html>
<style>
	table{ padding:0; border:0; border-spacing:0px; border-collapse:collapse; }
    th, td{ padding:0; }
    
    #title{height : 16; font-family :'돋움'; font-size : 12; text-align :center; }
    .write{ clear:both; width: 600px; margin: 0 auto;}
</style>
<html>
<jsp:include page="header.jsp" flush="false" />
<head>
<meta charset="UTF-8">
<title>게시판 - 글쓰기</title>
</head>
<script type="text/javascript">
function fn_sendQna(){
	   var write=document.writeForm;
	   var id=write.id.value;
	   var title=write.title.value;
	   var content=write.content.value;
	   if(title.length==0 ||title==""){
	      alert("제목을 입력해주세요.");
	   } else if(content.length==0 ||content=="") {
	      alert("문의내용을 입력해주세요.");
	   } else {
	      writeForm.method="post";
//	      joinForm.action="memList";
	      writeForm.submit();
	   } 
	}
</script>


<body>

 	<div class="write">
    <br>
    <b><font size="6" color="gray">글쓰기</font></b>
    <br>
    
    <form method="post" action="qnaShow2.jsp" name="writeForm" >
    
    <table width="700" border="3" bordercolor="lightgray" align="center">
        <tr>
            <td id="title">작성자</td>
            <td><%=id%></td>
        </tr>
            <tr>
            <td id="title">
                제 목
            </td>
            <td>
                <input name="title" type="text" size="70" maxlength="100" value=""/>
            </td>        
        </tr>
        <tr>
            <td id="title">
                내 용
            </td>
            <td>
                <textarea name="content" cols="72" rows="20"></textarea>            
            </td>        
        </tr>
        <tr>
				<td id="title">작성일</td>
				<td ><input type="text" name="writeDate" value="<%=sf.format(nowDate) %>"/></td>
			</tr>
        
 
        <tr align="center" valign="middle">
            <td colspan="5">
                
                <input type="button" onclick="fn_sendQna()" value="등록" >
                <input type="button" value="취소" onClick="location.href='qna.jsp'" >
            </td>
        </tr>
    </table>    
    </form>
    </div>
</body>

<jsp:include page="footer.jsp" flush="false" />
</html>