<%@page import="Dao.MusicList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<title>网易云音乐 听见好时光</title>
        <link href="images/web1/music.ico"rel="shortcut icon" />
		<link href="./css/bootstrap.css" rel='stylesheet' type='text/css' />
        <link href="./css/style1.css" rel='stylesheet' type='text/css' />
		<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
		<script src="./js/jquery.min.js"></script>
		 <!-- Custom Theme files -->
   		 <!-- Custom Theme files -->
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
		</script>
		</head>
	<body>
	<%if(request.getAttribute("list") == null){%>
		<jsp:forward page="index.jsp"/>
		<%} %>
		<!-- container -->
        <div class="container">
		
		
		<!-- banner -->
		<div class="banner">
			<!-- slider -->
				<!--- img-slider --->
				<div class="img-slider">
						<!----start-slider-script---->
					<script src="./js/responsiveslides.min.js"></script>
					 <script>
					    // You can also use "$(window).load(function() {"
					    $(function () {
					      // Slideshow 4
					      $("#slider4").responsiveSlides({
					        auto: true,
					        pager: true,
					        nav: true,
					        speed: 500,
					        namespace: "callbacks",
					        before: function () {
					          $('.events').append("<li>before event fired.</li>");
					        },
					        after: function () {
					          $('.events').append("<li>after event fired.</li>");
					        }
					      });
					
					    });
					  </script>
					<!----//End-slider-script---->
					<!-- Slideshow 4 -->
                    <div class="box">
					    <div  id="top" class="callbacks_container">
					      <ul class="rslides" id="slider4">
					        <li>
					          <img class="img-responsive" src="./images/web1/slide1.jpg" alt="">
					          <!--<div class="slider-caption">
					          	
					          </div>-->
					        </li>
					        <li>
					          <img src="./images/web1/slide2.jpg" alt="">
					           <!--<div class="slider-caption">
					          	
					          </div>-->
					        </li>
					        <li>
					          <img src="./images/web1/slide3.jpg" alt="">
					           <!--<div class="slider-caption">
					          	
					          </div>-->
					        </li>
					      </ul>
					    </div>
                    </div>
					    <div class="clearfix"> </div>
					</div>
						<!-- slider -->
		</div>
		<!-- banner -->
		<!-- categories -->
		<div class="categories">
			<div class="container">
				<div class="categories-left">
					<ul class="options">
						<li><a href="#">热门推荐</a></li>
						<li><a href="#">流行</a></li>
						<li><a href="#">摇滚</a></li>
						<li><a href="#">民谣</a></li>
						<li><a href="#">电子</a></li>
						<li><a href="#">爵士</a></li>
					</ul>
					
				</div>
				<div class="categories-right">
					<form action="searchMusic" method="post">
						<input type="text" id="search" name="search" placeholder="单曲/歌手/歌单">
						<input type="submit" value="搜索" />
					</form>
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
		<!-- categories -->
		<!-- content -->
		<div class="content">
			<div class="container">
			<!-- content-left -->
			<div class="col-md-8 content-left">
			<%List<MusicList> list = (List)request.getAttribute("list"); 
			for(int i = 0 ;i < list.size();i++){
			%>
				<div class="artical">
					<div class="col-md-4 artical-left">
						<a href="#"><img src="./images/web1/post<%=i + 1 %>.jpg" title="post-name" /></a>
					</div>
					<div class="col-md-8 artical-right">
						<div class="artical-head">
							<h2><a href="getMusicList?musiclistid=<%=list.get(i).getListId()%>"><%=list.get(i).getListName() %></a></h2>
							<a href="#"><span class="rate"> </span></a>
							<div class="clearfix"> </div>
						</div>
						<div class="clearfix"> </div>
						<!-- artical-info -->
						<div class="artical-info">
                        <div class="button" ><a href="getMusicListID?musiclistid=<%=list.get(i).getListId()%>" target="bottomFrame"><img src="images/web1/btnbg.png"width="40"height="40" /></a></div>
							<p><strong>时光如水你好</strong>   <%=list.get(i).getCreateDate() %> 创建 </p>
							<p><strong>介绍</strong><%=list.get(i).getIntroduce() %></p>
							
                            <!--<p><strong>Country:</strong>UK</p>
							<p><strong>singer:</strong> adipiscing</p>
							<p><strong>casting:</strong> <a href="#">Donec</a>,<a href="#">variu</a>,<a href="#">mauris</a>,<a href="#">sociis</a></p>-->
						</div>
						<!-- artical-info -->
					</div>
					<div class="clearfix"> </div>
				</div>
				<%} %>
				<!-- artical-end -->
				
				<!-- artical-end -->
				<div class="clearfix"> </div>
				<!-- pagenate -->
				<div class="pagenate">
					<ul>
						<li class="page-active"><a href="#">1</a></li>
						<li><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li class="next"><a href="#">Next</a></li>
					</ul>
				</div>
				<!-- pagenate -->
			</div>
          
			<!-- content-left -->
			<!-- content-right -->
			<div class="col-md-4 content-right">
				<div class="recent-add">
					<!----sreen-gallery-cursual---->
						<div class="sreen-gallery-cursual">
							 <!-- requried-jsfiles-for owl -->
							<link href="./css/owl.carousel.css" rel="stylesheet">
							    <script src="./js/owl.carousel.js"></script>
							        <script>
							    $(document).ready(function() {
							      $("#owl-demo").owlCarousel({
							        items : 1,
							        lazyLoad : true,
							        autoPlay : true,
							        navigation : true,
							        navigationText :  false,
							        pagination : true,
							      });
							    });
							    </script>
							 <!-- //requried-jsfiles-for owl -->
							 <!-- start content_slider -->
						       <div id="owl-demo" class="owl-carousel text-center">
					                <div class="item">
					                	<img class="lazyOwl" data-src="./images/web1/post3.jpg" alt="name">
					                </div>
					                <div class="item">
					                	<img class="lazyOwl" data-src="./images/web1/post5.jpg" alt="name">
					                </div>
					                <div class="item">
					                	<img class="lazyOwl" data-src="./images/web1/post6.jpg" alt="name">
					                </div>
				              </div>
						<!--//sreen-gallery-cursual---->
				</div>
			</div>
			<div class="clearfix"> </div>
			<!-- popular-allbums -->
			<div class="popular-albums">
				<h2>入驻歌手</h2>
				<div class="popular-allbum">
					<div class="popular-allbum-pic">
						<a href="#"><img src="images/web1/singer1.jpg" title="name" /></a>
                        
					</div>
					<div class="popular-allbum-info">
						<h3><a href="#">羽泉组合</a></h3>
						<p>国内知名演唱组合</p>
						
					</div>
					<div class="clearfix"> </div>
				</div>
				<div class="popular-allbum">
					<div class="popular-allbum-pic">
						<a href="#"><img src="./images/web1/singer2.jpg" title="name" /></a>
					</div>
					<div class="popular-allbum-info">
						<h3><a href="#">蔡依林</a></h3>
						<p>台湾歌手蔡依林</p>
					</div>
					<div class="clearfix"> </div>
				</div>
				<div class="popular-allbum">
					<div class="popular-allbum-pic">
						<a href="#"><img src="./images/web1/singer3.jpg" title="name" /></a>
					</div>
					<div class="popular-allbum-info">
						<h3><a href="#">尚雯婕</a></h3>
						<p>原创电子唱作人</p>
					</div>
					<div class="clearfix"> </div>
				</div>
                <div class="popular-allbum">
					<div class="popular-allbum-pic">
						<a href="#"><img src="./images/web1/singer4.jpg" title="name" /></a>
					</div>
					<div class="popular-allbum-info">
						<h3><a href="#">MC石头</a></h3>
						<p>电台DJ、资深乐评人</p>
					</div>
					<div class="clearfix"> </div>
				</div>
			</div>
			<!-- popular-allbums -->
			<!-- content-right -->
			</div>
		    </div>
		</div>
		<!-- content -->
		<!-- footer -->
		
		<!-- footer -->
		<!-- copy-right -->
		<div class="copy-right">
			<div class="container">
				<p>关于网易- 客户服务- 服务条款- 网站导航 网易公司版权所有©1997-2015  浙网文[2013]0332-034号</p>
			</div>
		</div>
</div>
		<!-- copy-right -->
		<!-- container -->
	</body>
</html>