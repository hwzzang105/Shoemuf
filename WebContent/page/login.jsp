<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% request.setCharacterEncoding("utf-8"); %>
<style>
	/*초기화*/
	* { margin: 0; padding: 0;}
	body, html { min-width: 1100px; width: 100%;}
	ul { list-style: none;}
	a { text-decoration: none;}

	.login{ clear: both; width: 1200px; margin: 0 auto;}
	.login_a{ font-size: 11px; text-align: center; overflow: hidden; border-width: 1px; border-style: solid; border-color: rgb(233, 233, 233); border-image: initial; padding: 50px 0px;}
	.login_form{ width: 355px; display: inline-block; zoom: 1; vertical-align: top;}
	.form { width: 355px; text-align: left; vertical-align: middle;}
	.login_tit { font-size: 11px; color: rgb(85, 85, 85); letter-spacing: 2px; padding: 0px 0px 0px 11px; margin: 15px 0px 30px 9px;}
	.id { font-family: Arial; font-size: 11px; font-weight: bold; padding: 0px 4px 5px; margin: 0px 14px;}
	#m_id{ width: 216px; height: 14px; color: rgb(32, 32, 32); padding: 2px; border-width: 1px; border-style: solid; border-color: rgb(217, 217, 217); border-image: initial;}
	.l_id{ display: block; padding: 0px;}
	.pw { font-family: Arial; font-size: 11px; font-weight: bold; padding: 0px 0px 5px; margin: 0px 14px;}
	#m_pw{ width: 216px; height: 14px; color: rgb(32, 32, 32); margin: 0px 0px 0px 1px; padding: 2px; border-width: 1px; border-style: solid; border-color: rgb(217, 217, 217); border-image: initial;}
	.l_pw{ display: block; padding: 6px 0px 0px;}
	.login_right{ max-width: 450px; display: inline-block; zoom: 1; margin: 0px 0px 0px 20px;}
	
	.btn_g { margin: 20px;}
	#b1 {width: 80px; height: 20px; border:1px solid transparent; background-color:#333; color: #fff;}
	#b2 {width: 80px; height: 20px; border:1px solid transparent; background-color:#333; color: #fff;}
	#b3 {width: 80px; height: 20px; border:1px solid transparent; background-color:#333; color: #fff;}
</style>
<html>
<head>
<meta charset="UTF-8">
<title>LOGIN</title>
</head>
<jsp:include page="header.jsp" flush="false" />

<body>
	<div class="login">
		<div class="login_a">
			<div class="login_form">
				<form action="login_next.jsp" method="post" class="form">
					
					<h3 class="login_tit">LOGIN PAGE</h3>
					<label class="l_id">
						<span  class="id">ID</span>
						<input type="text" id="m_id" name="id"  /><br>
					</label>
					
					<label class="l_pw">
						<span class="pw">PW</span>
						<input type="password" id="m_pw" name="pwd" /><br>
					</label>
					<div class="btn_g">
						<input id="b1" type="submit" value="확인"/>
						<input id="b2" type="reset" value="취소" />
						<a href="join.jsp"><input id="b3" type="button" value="회원가입" /></a>
					</div>
				</form>	
			</div>
			<div class="login_right">
				<a href="#"><img src="../image/login_pic.jpg" alt="" /></a>
			</div>
		</div>
	</div>
</body>

<jsp:include page="footer.jsp" flush="false" />
</html>