<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<style>
	/*초기화*/
	* { margin: 0; padding: 0;}
	body, html { min-width: 1100px; width: 100%;}
	ul { list-style: none;}
	a { text-decoration: none;}
	/***********************************************************/
	.contents { clear:both; width: 1200px; margin: 0 auto;}
	.concon { display: flex; justify-content: center;}
	.left_con {clear:both; width:150px;}
	.left_con ul{ padding-top: 10px; padding-bottom: 25px; margin-right: 30px; border-bottom: 1px solid #333;}
	.left_con ul li a p{ color: #333; padding: 5px;}
	.left_con_copy { padding-top: 25px;}
	
	.right_con{ clear:both;  width:1008px;}
	/***********************************************************/
	/* .roll { width: 1160px; position: relative; margin: auto; height: 180px;}
	.btn_left{ position: absolute; top: 50%; margin-top: -20px; left: 0; display: inline-block; zoom: 1; cursor: pointer;}
	.btn_right{ position: absolute; top: 50%; margin-top: -20px; left: 0; display: inline-block; zoom: 1; cursor: pointer;}
	.roll_view{ position: relative; width: 1095px; height: 100%; overflow: hidden; margin-left: 36px; display: inline-block; zoom: 1;}
	.roll_list{ position: absolute; width: 20000px; left: 0px; top: 0px;}
	 */
	/***********************************************************/
	.col3{ width: 300px;  }
	.img_list{ width:230px; heigth: 230px; margin-left: 15px; }
	.shoes{ clear:both; width:1200px; margin: 0 auto; }
	.shoes_list { clear:both; }
	.shoes_list ul li{ float:left; }
</style>

<html>
<head>
<meta charset="UTF-8">


<title>Shoemuf</title>
</head>
<jsp:include page="header.jsp" flush="false" />

<body>

	
	<div class="contents">
		<div class="concon">
			<div class="left_con">
				<ul>
					<li><a href="#">
							<p>로퍼/슬립온</p>
						</a></li>
					<li><a href="#">
							<p>스니커즈</p>
						</a></li>
					<li><a href="#">
							<p>빅사이즈 신발</p>
						</a></li>
					<li><a href="#">
							<p>워커/하이탑</p>
						</a></li>
					<li><a href="#">
							<p>샌들/슬리퍼</p>
						</a></li>
					<li><a href="#">
							<p>키높이 신발</p>
						</a></li>
				</ul>
				<div class="left_con_copy">
						<img src="../image/left_copy.jpg" alt="" />
				</div>
				
			</div>
			<div class="right_con">
				<div class="right_con_ban">
					<img src="../image/main_ban1.jpg" alt="" />
				</div>
			</div>
		</div>
		
		<div class="roll">
			<div class="btn_left">
				<span><img src="../image/btn_left.gif" alt="" /></span>
			</div>
			
			<div class="roll_view">
				<div class="roll_list">
					
				</div>
				
			</div>
			
			<div class="btn_right">
				<span><img src="../image/btn_right.gif" alt="" /></span>
			</div>
			
		</div>
		
		<div class="shoes">
			<span><img src="../image/new.gif" alt="" /></span>
			<div class="shoes_list">
				<ul>
					<li class="col3">
						<img src="../image/view1.jpg" alt="" class="img_list" />
						<p>설명</p>
						<span>가격</span>
						
					</li>
					<li class="col3">
						<img src="../image/view2.jpg" alt="" class="img_list" />
						<p>설명</p>
						<span>가격</span>
					</li>
					<li class="col3">
						<img src="../image/view3.jpg" alt="" class="img_list" />
						<p>설명</p>
						<span>가격</span>
					</li>
					<li class="col3">
						<img src="../image/view4.jpg" alt="" class="img_list" />
						<p>설명</p>
						<span>가격</span>
					</li>
				</ul>
				<ul>
					<li class="col3">
						<img src="../image/view5.jpg" alt="" class="img_list" />
						<p>설명</p>
						<span>가격</span>
					</li>
					<li class="col3">
						<img src="../image/view6.jpg" alt="" class="img_list" />
						<p>설명</p>
						<span>가격</span>
					</li>
					<li class="col3">
						<img src="../image/view7.jpg" alt="" class="img_list" />
						<p>설명</p>
						<span>가격</span>
					</li>
					<li class="col3">
						<img src="../image/view8.jpg" alt="" class="img_list" />
						<p>설명</p>
						<span>가격</span>
					</li>
				</ul>
				<ul>
					<li class="col3">
						<img src="../image/view9.jpg" alt="" class="img_list" />
						<p>설명</p>
						<span>가격</span>
					</li>
					<li class="col3">
						<img src="../image/view10.jpg" alt="" class="img_list" />
						<p>설명</p>
						<span>가격</span>	
					</li>
					<li class="col3">
						<img src="../image/view11.jpg" alt="" class="img_list" />
						<p>설명</p>
						<span>가격</span>
					</li>
					<li class="col3">
						<img src="../image/view12.jpg" alt="" class="img_list" />
						<p>설명</p>
						<span>가격</span>
					</li>
				</ul>
			</div>
		</div>
	</div>
	

</body>

	<jsp:include page="footer.jsp" flush="false" />
</html>