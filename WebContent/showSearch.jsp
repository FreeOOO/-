<%@page import="Dao.Music"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
}

body,input {
	font-size: 14px;
	line-height: 24px;
	color: #333;
	font-family: Microsoft yahei, Song, Arial, Helvetica, Tahoma, Geneva;
}

h1 {
	margin-bottom: 15px;
	height: 100px;
	line-height: 100px;
	text-align: center;
	font-size: 24px;
	color: #fff;
	background: #0051a1;
}

#content #post,#comment p {
	zoom: 1;
}

#content #post:after,#comment p:after {
	display: block;
	height: 0;
	clear: both;
	visibility: hidden;
	overflow: hidden;
	content: '.';
}

.transition {
	-webkit-transition: all 0.5s linear;
	-moz-transition: all 0.5s linear;
	-o-transition: all 0.5s linear;
	-ms-transition: all 0.5s linear;
	transition: all 0.5s linear;
}

#content {
	margin: 0 auto;
	width: 100%;
	overflow: hidden;
}

#content #post {
	margin-bottom: 15px;
	padding-bottom: 15px;
	border-bottom: 1px #d4d4d4 dashed;
}

#content #post textarea {
	display: block;
	margin-bottom: 10px;
	padding: 5px;
	width: 98%;
	height: 100px;
	border: 1px #d1d1d1 solid;
	border-radius: 5px;
	resize: none;
	outline: none;
}

#content #post textarea:hover {
	border: 1px #9bdf70 solid;
	background: #f0fbeb;
}

#content #post #postBt,#content #post #clearBt {
	margin-left: 10px;
	padding: 3px;
	float: right;
}

#comment {
	overflow: hidden;
}

#comment p {
	margin-bottom: 10px;
	padding: 10px;
	border-radius: 5px;
}

#comment p:nth-child(odd) {
	border: 1px solid #e3e197;
	background: #ffd;
}

#comment p:nth-child(even) {
	border: 1px solid #adcd3c;
	background: #f2fddb;
}

#comment p span {
	display: inline;
	float: left;
}

#comment p .msg {
	width: 90%;
}

#comment p .datetime {
	width: 10%;
	color: #999;
	text-align: right;
}
</style>
<link rel="stylesheet" type="text/css" href="css/musicliststyle.css">
</head>
<body id="auto-id-wnNonECTIXPNMaTS" class="auto-1435105232024-parent">
	<%
		if (request.getAttribute("infomap") != null) {
			Map<String, Music> map = (Map) request.getAttribute("infomap");
			int cnt = 1;
	%>
	<div id="m-playlist" class="g-bd4 f-cb">
		<div class="g-mn4">
			<div class="g-wrap6">

				<!--列表-->
				<table class="m-table" id="m-song-module">
					<thead>
						<tr>
							<th class="first w1"><div class="wp">&nbsp;</div></th>
							<th><div class="wp">歌曲标题</div></th>
							<th class="w2"><div class="wp">时长</div></th>
							<th class="w3"><div class="wp">歌手</div></th>
							<th class="w4"><div class="wp">专辑</div></th>
						</tr>

					</thead>
					<tbody id="m-song-list-module">
						<%
							for (Map.Entry<String, Music> m : map.entrySet()) {
						%>
						<tr class="ztag even" data-rt="" data-fee="0" data-id="29004400"
							id="songlist-29004400">
							<td class="left">
								<div class="hd">
									<a href="getMusicListID?musicid=<%=m.getValue().getId()%>"
										target="bottomFrame"><span data-copyright="1" title="播放"
										class="j-ply ply" data-type="ply"></span></a> <span class="num"><%=cnt++%></span>
								</div>
							</td>
							<td>
								<div class="f-cb">
									<div class="tt">
										<div class="ttc ttc-1">
											<span class="txt"> <b><a
													title="<%=m.getValue().getName()%>"
													href="getMusicListID?musicid=<%=m.getValue().getId()%>"
													target="bottomFrame"><%=m.getValue().getName()%></a></b>
													<%if(request.getSession().getAttribute("user_id") == null){ %>
													<a href="login.jsp" title="添加到歌曲列表"><img src="images/web2/add.jpg"></a>
													<%}else{ %>
													<a onclick="newwindow1(<%=m.getValue().getId()%>)"title="添加到歌曲列表"><img src="images/web2/add.jpg"></a>
													<%} %>
                        <SCRIPT LANGUAGE="javascript">
                        function newwindow1(id){window.open ('showUserMusicList?musicId=' + id, 'newwindow', 'height=500px, width=300px, top=0, left=0, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=n o, status=no') //这句要写成一行
                        }</SCRIPT>
											</span>
										</div>
									</div>
									<div class="opt hshow" style="display: none;">
										<a data-res-action="addto" data-res-id="29004400"
											data-res-type="18" data-res-copyright="1" hidefocus="true"
											title="添加到播放列表" href="javascript:;"
											class="u-icn u-icn-81 icn-add"></a> <span class="icn icn-fav"
											title="收藏" data-type="sub" data-copyright="1">收藏</span> <span
											class="icn icn-share" title="分享" data-type="shr"
											data-copyright="1">分享</span>
									</div>
								</div>
							</td>
							<%
								int time = Integer.parseInt(m.getValue().getTime());
										int min = time / 60;
										int second = time % 60;
							%>
							<td class="s-fc3"><%="" + min + ":" + second%></td>

							<td><div class="text">
									<span title="<%=m.getValue().getSingerName()%>"><a
										href="/artist?id=861777" class="s-fc3"><%=m.getValue().getSingerName()%></a></span>
								</div></td>
							<td>
								<div class="text">
									<a title="<%=m.getValue().getAlbum()%>" class="s-fc3"><%=m.getValue().getAlbum()%></a>
								</div>
							</td>
						</tr>
						<%
							}
						%>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<%
		} else {
			request.getRequestDispatcher("index.jsp").forward(request,
					response);
		}
	%>
</body>
</html>