<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    
    %>
<!DOCTYPE html>
<%  request.setCharacterEncoding("UTF-8"); %>    





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

<script type="text/javascript">
	/* 하나라도 걸리면 경고창과 포커스를 처리한후 false를  반환한다.  */
    function checkIt(){   
        var userinput=document.userinput;
        if(!userinput.id.value){
            alert("ID를 입력하세요");
            userinput.id.focus();
            return false;
        }
        if(!userinput.pwd.value){
            alert("비밀번호를 입력하세요");
            userinput.pwd.focus();
            return false;
        }
        if(!userinput.name.value){
            alert("사용자 이름을 입력하세요");
            userinput.name.focus();
            return false;
        }
        if(!userinput.addr.value){
            alert("주소를 입력하세요");
            userinput.addr.focus();
            return false;
        }
        if(!userinput.mnumber.value){
            alert("휴대번호를 입력하세요");
            userinput.mnumber.focus();
            return false;
        }
        if(!userinput.email.value){
            alert("이메일를 입력하세요");
            userinput.email.focus();
            return false;
        }
        if(!userinput.birth.value){
            alert("생년월일를 입력하세요");
            userinput.birth.focus();
            return false;
        }
        return true;
    }
	
	//아이디 중복 여부를 판단
    function openConfirmid(userinput){
        //아이디를 입력했는지 검사
        if(userinput.id.value==""){
            alert("아이디를입력하세요");
            userinput.id.focus();
            return;
        }
        //url과 사용자 입력 id를 조합합니다.
        url="confirmId.jsp?id="+userinput.id.value;
         
        //새로운 윈도우를 엽니다.
        open(url,"confirm","toolbar=no,location=no,status=no,menubar=no,scrllbar=no,resizable=no,width=300,height=200");
    }



</script>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<jsp:include page="header.jsp" flush="false" />
<body>

	<div class="join">
		<div class="join_form">
			<h2 class="join_tit">MEMBER JOIN</h2>
			<form action="join_next.jsp" method="post" name="userinput" onSubmit="return checkIt()">
				
				<h3 class="join_tit1">기본정보</h3>
				<table class="table_form">
				    <tr>
				    	<th class="table_th">아이디</th>
				    	<td class="table_td">
				    		<input type="text" id="m_id" name="id" />
				    		<input type="button" name="confirm_id" value="ID중복확인" onClick="openConfirmid(this.form)">
				    	</td>
				    	
				    </tr>
				    <tr>
				    	<th class="table_th">비밀번호</th>
				    	<td class="table_td"><input type="password" id="m_pw" name="pwd" /></td>
				    </tr>
				    <tr>
				    	<th class="table_th">이름</th>
				    	<td class="table_td"><input type="text" id="m_name" name="name" /></td>
				    </tr>
				    <tr>
				    	<th class="table_th">주소</th>
				    	<td class="table_td"><input type="text" id="m_addr" name="addr" /></td>
				    </tr>
				    <tr>
				    	<th class="table_th">휴대번호</th>
				    	<td class="table_td"><input type="text" id="m_number" name="mnumber" /></td>
				    </tr>
				    <tr>
				    	<th class="table_th">이메일</th>
				    	<td class="table_td"><input type="text" id="m_email" name="email" /></td>
				    </tr>
				    <tr>
				    	<th class="table_th">생년월일</th>
				    	<td class="table_td"><input type="text" id="m_birth" name="birth" /></td>
				    </tr>
				</tbody>
				</table>
				<div class="join_btn">
				<input id="bt1" type="submit" value="회원가입" />
				<input id="bt2" type="reset" value="취소" />
				</div>
			</form>
			
		</div>
	</div>


</body>

<jsp:include page="footer.jsp" flush="false" />
</html>