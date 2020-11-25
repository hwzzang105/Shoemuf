<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style>
	/*초기화*/
	* { margin: 0; padding: 0;}
	body, html { min-width: 1100px; width: 100%;}
	ul { list-style: none;}
	a { text-decoration: none;}
	/**********************/
	.head{ clear: both; }
	.hdr { width: 1200px; margin: 0 auto;}
	.hdr_logo{ clear:both; display: block; width: 290px;height: 60px; margin: 0 auto;}
	.hd_top{ float:right;  padding: 10px 0 10px 10px; }
	.hd_top li { float:left; margin-left: 20px;  }
	.hd_top li a{ color: #333; font-size: 13px;}
	.gnb { clear:both; }
	.gnb_menu {clear: both; width: 1200px; border-bottom: 2px solid #333; float: right; padding-bottom: 15px; margin-bottom: 30px;}
	.gnb_menu li{display:block; float: left; margin-right: 50px; margin-top: 50px; }
	.gnb_menu li a{color: #333;}
	
	
</style>
<title>header</title>
</head>
<body>
	
	<header class="head">
		<div class="hdr">
			<nav class="tnb">
				<ul class="hd_top">
					<li><a href="login.jsp">LOGIN</a></li>
					<li><a href="join.jsp">JOIN US</a></li>
					<li><a href="#">BASKET</a></li>
					
					<%  
						//로그인 체크
					    if(session.getAttribute("id")==null){
					        response.sendRedirect("index.jsp");
					    }else{
					%>
					<li><a href="delete.jsp">DELETE</a></li>
					<li><a href="mypage.jsp">MY PAGE</a></li>
									
					
					<li><a href="#"><%=session.getAttribute("id")%>회원님 환영합니다.</a></li>
					
					<li><a href="logout.jsp">LOGOUT</a></li>
					<%} %>
				</ul>
				<a href="index.jsp" class="hdr_logo"><img src="../image/img_logo.jpg" alt="logo" /></a>
			</nav>
			<nav class="gnb">
				<ul class="gnb_menu">
					<li><a href="notice.jsp">notice</a></li>
					<li><a href="review.jsp">review</a></li>
					<li><a href="qna.jsp">Q & A</a></li>
					
				</ul>
			</nav>
		</div>
	</header>
	
</body>
</html>

