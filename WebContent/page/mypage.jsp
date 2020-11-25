<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    
    import="Shoemuf.*"
    
%>
<!DOCTYPE html>
<%  request.setCharacterEncoding("UTF-8"); %>    

<%  
	//로그인 체크
    if(session.getAttribute("id")==null){
        response.sendRedirect("index.jsp");
    }else{
%>


<style>
	/*초기화*/
	* { margin: 0; padding: 0;}
	body, html { min-width: 1100px; width: 100%;}
	ul { list-style: none;}
	a { text-decoration: none;}
	
	
	.join{ clear:both; width: 400px; margin:0 auto; }
	.join_form{  width: 1000px; display: inline-block; zoom: 1; padding: 0px 0px 50px;}
	.join_tit { font-size: 11px; color: rgb(85, 85, 85); letter-spacing: 2px; padding: 0px 0px 0px 11px;}
	.join_tit1 { font-size: 12px; color: rgb(68, 68, 68); padding: 50px 0px 10px;}
	.table_form{ table-layout: fixed; font-size: 11px; line-height: 20px; border-top: 1px solid rgb(227, 227, 227); border-bottom: 1px solid rgb(227, 227, 227);}
	.table_th{ width: 140px; color: rgb(105, 105, 105); font-weight: normal; text-align: left; padding: 12px 0px 8px 20px; border-top: 1px solid rgb(227, 227, 227); border-right: 1px solid rgb(227, 227, 227);}
	.table_td{ width: auto; vertical-align: middle; padding: 8px 0px 8px 20px; border-top: 1px solid rgb(227, 227, 227);}
	.table_form tr td input{ color: rgb(0, 0, 0); font-size: 12px; padding: 4px; border-width: 1px; border-style: solid; border-color: rgb(217, 217, 217); border-image: initial;}
	
	.join_btn {margin-left: 100px; margin-top: 30px;}
	#bt1{ margin-right: 10px; width: 100px; height: 50px; background-color:#333; color: #fff;}
	#bt2{ width: 100px; height: 50px; background-color:#333; color: #fff;}
</style>
<html>
<head>
<meta charset="UTF-8">
<title>My Page</title>
</head>
<jsp:include page="header.jsp" flush="false" />
<body>

<%
	String id =(String)session.getAttribute("id");
    MemberDAO manager= MemberDAO.getInstance();
    MemberBean m = manager.listMembers(id);
    

    
    //null값일때 공백처리
    if(m.getPwd()==null){
        m.setPwd("");
    }
    if(m.getName()==null){
        m.setName("");
    }
    if(m.getAddr()==null){
        m.setAddr("");
    }
    if(m.getMnumber()==null){
        m.setMnumber("");
    }
    if(m.getEmail()==null){
        m.setEmail("");
    }
    if(m.getBirth()==null){
        m.setBirth("");
    }
    
%>


	<div class="join">
		<div class="join_form">
			<h2 class="join_tit">MY PAGE</h2>
			<form action="myUpdate.jsp" method="post">
				
				<h3 class="join_tit1">기본정보</h3>
				<table class="table_form">
				    <tr>
				    	<th class="table_th">아이디</th>
				    	<td class="table_td">
				    		<input type="text" id="m_id" name="id" value="<%=m.getId()%>" readonly />
				    	</td>
				    	
				    </tr>
				    <tr>
				    	<th class="table_th">비밀번호</th>
				    	<td class="table_td"><input type="password" id="m_pw" name="pwd" value="<%=m.getPwd()%>" /></td>
				    </tr>
				    <tr>
				    	<th class="table_th">이름</th>
				    	<td class="table_td"><input type="text" id="m_name" name="name" value="<%=m.getName()%>" /></td>
				    </tr>
				    <tr>
				    	<th class="table_th">주소</th>
				    	<td class="table_td"><input type="text" id="m_addr" name="addr" value="<%=m.getAddr()%>" /></td>
				    </tr>
				    <tr>
				    	<th class="table_th">휴대번호</th>
				    	<td class="table_td"><input type="text" id="m_number" name="mnumber" value="<%=m.getMnumber()%>" /></td>
				    </tr>
				    <tr>
				    	<th class="table_th">이메일</th>
				    	<td class="table_td"><input type="text" id="m_email" name="email" value="<%=m.getEmail()%>" /></td>
				    </tr>
				    <tr>
				    	<th class="table_th">생년월일</th>
				    	<td class="table_td"><input type="text" id="m_birth" name="birth" value="<%=m.getBirth()%>" /></td>
				    </tr>
				</tbody>
				</table>
				<div class="join_btn">
				<input id="bt1" type="submit" value="수정" " />
				
				</div>
			</form>
			
		</div>
	</div>


</body>

<jsp:include page="footer.jsp" flush="false" />
</html>
<%} %>