<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="errorpage.jsp" %>
<%@ include file="common.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>page2</title>
<meta name="keywords" content="JS代码,导航代码,JS广告代码,JS特效代码" />
<meta name="description" content="此代码内容为漂亮的大背景图片CSS&jQuery导航栏，属于站长常用代码，更多网页导航代码请访问模板王JS代码频道。" />
<link rel="stylesheet" type="text/css" href="forindex/index.css" />
<%if(session.getAttribute("name")==null){ %>
<jsp:forward page="index.jsp"></jsp:forward>
<%} %>

<!-- The JavaScript -->
<script type="text/javascript" src="js/jquery.pack.js"></script>
<script type="text/javascript" src="js/jquery.bgpos.js"></script>
<script type="text/javascript">
	$(function() {
		/* position of the <li> that is currently shown */
		var current = 0;
		var loaded  = 0;
		for(var i = 1; i <4; ++i)
			$('<img />').load(function(){
				++loaded;
				if(loaded == 3){
					$('#bg1,#bg2,#bg3').mouseover(function(e){
						var $this = $(this);
						/* if we hover the current one, then don't do anything */
						if($this.parent().index() == current)
							return;
						/* item is bg1 or bg2 or bg3, depending where we are hovering */
						var item = e.target.id;

						/*
						this is the sub menu overlay. Let's hide the current one
						if we hover the first <li> or if we come from the last one,
						then the overlay should move left -> right,
						otherwise right->left
						 */
						if(item == 'bg1' || current == 2)
							$('#menu .sub'+parseInt(current+1)).stop().animate({backgroundPosition:"(-266px 0)"},300,function(){
								$(this).find('li').hide();
							});
						else
							$('#menu .sub'+parseInt(current+1)).stop().animate({backgroundPosition:"(266px 0)"},300,function(){
								$(this).find('li').hide();
							});

						if(item == 'bg1' || current == 2){
							/* if we hover the first <li> or if we come from the last one, then the images should move left -> right */
							$('#menu > li').animate({backgroundPosition:"(-800px 0)"},0).removeClass('bg1 bg2 bg3').addClass(item);
							move(1,item);
						}
						else{
							/* if we hover the first <li> or if we come from the last one, then the images should move right -> left */
							$('#menu > li').animate({backgroundPosition:"(800px 0)"},0).removeClass('bg1 bg2 bg3').addClass(item);
							move(0,item);
						}

						/*
						We want that if we go from the first one to the last one (without hovering the middle one),
						or from the last one to the first one, the middle menu's overlay should also slide, either
						from left to right or right to left.
						 */
						if(current == 2 && item == 'bg1'){
							$('#menu .sub'+parseInt(current)).stop().animate({backgroundPosition:"(-266px 0)"},300);
						}
						if(current == 0 && item == 'bg3'){
							$('#menu .sub'+parseInt(current+2)).stop().animate({backgroundPosition:"(266px 0)"},300);
						}

						
						/* change the current element */
						current = $this.parent().index();
						
						/* let's make the overlay of the current one appear */
					   
						$('#menu .sub'+parseInt(current+1)).stop().animate({backgroundPosition:"(0 0)"},300,function(){
							$(this).find('li').fadeIn();
						});
					});
				}	
			}).attr('src', 'images/'+i+'.jpg');
		
					
		/*
		dir:1 - move left->right
		dir:0 - move right->left
		 */
		function move(dir,item){
			if(dir){
				$('#bg1').parent().stop().animate({backgroundPosition:"(0 0)"},200);
				$('#bg2').parent().stop().animate({backgroundPosition:"(-266px 0)"},300);
				$('#bg3').parent().stop().animate({backgroundPosition:"(-532px 0)"},400,function(){
					$('#menuWrapper').removeClass('bg1 bg2 bg3').addClass(item);
				});
			}
			else{
				$('#bg1').parent().stop().animate({backgroundPosition:"(0 0)"},400,function(){
					$('#menuWrapper').removeClass('bg1 bg2 bg3').addClass(item);
				});
				$('#bg2').parent().stop().animate({backgroundPosition:"(-266px 0)"},300);
				$('#bg3').parent().stop().animate({backgroundPosition:"(-532px 0)"},200);
			}
		}
	});
</script>

<!--[if lte IE 6]>
     <link rel="stylesheet" href="forindex/styleIE6.css" type="text/css" media="screen"/>
<![endif]-->
</head>

<body style="text-align:center">

    	<h2 class="title_name">你好.<span>欢迎来到P2P融资系统</span><small>by 禹绍宴</small></h2>
        <div id="menuWrapper" class="menuWrapper bg1">
            <ul class="menu" id="menu">
                <li class="bg1" style="background-position:0 0;">
                    <a id="bg1" href="#">业务</a>
                    <ul class="sub sub1" style="background-position:0 0;">
                        <li><a href="form1.jsp">求助贷款</a></li>
                        <li><a href="form3.jsp" target="_blank">发放贷款</a></li>
                        <li><a href="form2.jsp"> 还款 </a></li>
                    </ul>
                </li>
                <li class="bg1" style="background-position:-266px 0px;">
                    <a id="bg2" href="#">关于我</a>
                    <ul class="sub sub2" style="background-position:-266px 0;">
                        <li><a href="index.jsp">注销</a></li>
                        <li><a href="http://www.lanrentuku.com/" target="_blank"></a></li>
                        <li><a href="http://www.lanrentuku.com/" target="_blank"></a></li>
                    </ul>
                </li>
                <li class="last bg1" style="background-position:-532px 0px;">
                    <a id="bg3" href="#">数据统计</a>
                    <ul class="sub sub3" style="background-position:-266px 0;">
                        <li><a href="countByTime.jsp" target="_blank">按时间统计</a></li>
                       
                        <li><a href="countByPeople.jsp" target="_blank">按人统计</a></li>
                    </ul>
                </li>
            </ul>
        </div>
        
</body>
</html>