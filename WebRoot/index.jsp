
<form name="frm" method="post" action="hello.jsp">
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>

<%@ page import = "java.util.*"%>
<!doctype html>


<html>
<head>
<title>page1</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link href="forindex/style.css" rel="stylesheet" type="text/css">

<script type="text/javascript" src="forindex/JFCore.js"></script>
		
		<!-- Set here the key for your domain in order to hide the watermark on the web server -->
		<script type="text/javascript">
			(function() {
				JC.init({
					domainKey: ''
				});
				})();
		</script>

</head>
<body>
<div class="wrap">
<!-- tab style-1 -->
<div class="row">
	<div class="grid_12 columns">
		<div class="tab style-1">
    					<dl>
 			              <dd class="users"><a class="user active" href="#tab1" > </a></dd>
    						<dd class="messages"><a class="msg" href="#tab2"> </a></dd>
    						<dd class="settings"><a class="setting" href="#tab3"> </a></dd>
    						<dd class="likes"><a class="like" href="#tab4"> </a></dd>
    					</dl>
    					<ul>
    						<li class="active"> 
			    				<div class="form">		 
										<input type="text" class="active textbox" name="name" value="用户名" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '用户名';}"> <input type="text" class="textbox" name="keyword" value="密码" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '密码';}"></div></li><li class="active"><br></li><li class="active"><div class="form"><input type="submit" value="登 录"> 
										 
								  
							</div></li>
    						<li><div class="top-grids">
					      			<div class="top-grid1">
					      				<img src="images/f1.jpg" title="" alt="">
					      			</div>
					      			<div class="top-grid2">
						      			<a href="#single.html"><h4>管理员Saketh<h4></h4></a>
						      			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt</p>
					      			</div>
					      			 <div class="top-grid1">
					      				<img src="images/f2.jpg" title="" alt="">
					      			</div>
					      			<div class="top-grid2">
						      			<a href="#single.html"><h4>管理员Amar<h4></h4></a>
						      			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt</p>
					      			</div>
					      			 <div class="top-grid1">
					      				<img src="images/f3.jpg" title="" alt="">
					      			</div>
					      			<div class="top-grid2">
						      			<a href="#single.html"><h4>管理员Akil<h4></h4></a>
						      			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt</p>
					      			</div>
					      			 <div class="top-grid1">
					      				<img src="images/f4.jpg" title="" alt="">
					      			</div>
					      			<div class="top-grid2">
						      			<a href="#single.html"><h4>管理员Naveen<h4></h4></a>
						      			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt</p>
						      			   
					      			</div>
      							</div>   		
								<div class="clear"> </div>
							</li>
    						<li>
    							<div class="settings">
	    							<a href="#single.html"><h5><img src="images/arrow1.png" title="" alt="">Profile</h5></a>
	    							<a href="#single.html"><h5><img src="images/arrow1.png" title="" alt="">Edit</h5></a>
	    							<a href="#single.html"><h5><img src="images/arrow1.png" title="" alt="">Create Account</h5></a>
	    							<a href="#single.html"><h5><img src="images/arrow1.png" title="" alt="">Language</h5></a>
	    							<a href="#single.html"><h5><img src="images/arrow1.png" title="" alt="">invoice</h5></a>
    							</div>
    						</li>
    						<li>
					    		<div class="top-grids">
					      			<div class="top-grid1">
					      				<img src="images/f1.jpg" title="" alt="">
					      			</div>
					      			<div class="top-grid2">
						      			<a href="#single.html"><h4>Saketh<h4></h4></a>
						      			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt</p>
					      			</div>
					      			 <div class="top-grid1">
					      				<img src="images/f2.jpg" title="" alt="">
					      			</div>
					      			<div class="top-grid2">
						      			<a href="#single.html"><h4>Amar<h4></h4></a>
						      			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt</p>
					      			</div>
					      			 <div class="top-grid1">
					      				<img src="images/f3.jpg" title="" alt="">
					      			</div>
					      			<div class="top-grid2">
						      			<a href="#single.html"><h4>Akil<h4></h4></a>
						      			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt</p>
					      			</div>
					      			 <div class="top-grid1">
					      				<img src="images/f4.jpg" title="" alt="">
					      			</div>
					      			<div class="top-grid2">
						      			<a href="#single.html"><h4>Naveen<h4></h4></a>
						      			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt</p>
					      			</div>
					      		</div>    		
								<div class="clear"> </div>
    						</li>
    					</ul>
		</div>
</div>            
</div>			
</div>
<div class="wrap">
	<!--footer-->
<div class="footer">
	<p><a href="index0.jsp">注册</a></p>
</div>
<div class="clear"> </div>
</div>
    </body>
</html>