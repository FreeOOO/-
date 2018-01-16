<%-- 
    Document   : MusicPlay
    Created on : 2015-6-23, 9:43:09
    Author     : Administrator
--%>

<%@page import="Dao.Comment"%>
<%@page import="java.util.List"%>
<%@page import="Dao.Music"%>
<%@page import="java.util.Map"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/musicliststyle.css">
<title>music</title>
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
<script type="text/javascript">
	var Storage = {
			save : function(time,data){
				localStorage.setItem(time, data + "|"
						+ this.getDateTime());
			},
		saveData : function()//保存数据
		{
			var data = document.querySelector("#post textarea");
			if (data.value != "") {
				var time = new Date().getTime() + Math.random() * 5;//getTime是Date对象中的方法
				localStorage.setItem(time, data.value + "|"
						+ this.getDateTime());//将毫秒数存入Key值中，可以降低Key值重复率
				putComment(data.value);
				data.value = "";
				this.writeData();
			} else {
				alert("请输入评论内容");
			}
		},
		writeData : function()//输出数据
		{
			var dataHtml = "", data = "";
			for (var i = localStorage.length - 1; i >= 0; i--)//效率更高的循环方法
			{
				data = localStorage.getItem(localStorage.key(i)).split("|");
				dataHtml += "<p><span class=\"msg\">" + data[0]
						+ "</span><span class=\"datetime\">" + data[1]
						+ "</span></p>";
			}
			document.getElementById("comment").innerHTML = dataHtml;
			if (data) {

			}
		},
		getDateTime : function()//获取日期时间，例如 2012-03-08 12:58:58
		{
			var isZero = function(num)//私有方法，自动补零
			{
				if (num < 10) {
					num = "0" + num;
				}
				return num;
			}

			var d = new Date();
			return d.getFullYear() + "-" + isZero(d.getMonth() + 1) + "-"
					+ isZero(d.getDate());
		}
	}
	
	window.onload = function() {
		localStorage.clear();
//Storage.writeData();//当打开页面的时候，先将localStorage中的数据输出一边，如果没有数据，则输出空
		document.getElementById("postBt").onclick = function() {
			Storage.saveData();
		}//发表评论按钮添加点击事件，作用是将localStorage中的数据输出
		document.getElementById("clearBt").onclick = function() {
			Storage.clearData();
		}//清空所有已保存的数据
	}
	
	function putComment(data){
		var xmlhttp = new XMLHttpRequest();
		var listid = document.getElementById("listid").value;
		data = encodeURI(data);
		data = encodeURI(data);
		xmlhttp.open("POST", "getComment?comment=" + data + "&listid=" + listid, false);
		xmlhttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded; charset=utf-8;");
		xmlhttp.send();
	}
</script>
</head>
<body id="auto-id-wnNonECTIXPNMaTS" class="auto-1435105232024-parent">
	<%
		if (request.getAttribute("infomap") != null) {
			Map<String, Music> map = (Map) request.getAttribute("infomap");
			int cnt = 1;
	%>
	<input type="text" id="listid" value="<%=request.getAttribute("listId") %>" style="visibility: hidden;">
	<div id="m-playlist" class="g-bd4 f-cb">
		<div class="g-mn4">
			<div class="g-wrap6">
				<div class="m-info f-cb">
					<div class="cover u-cover u-cover-dj">
						<img src="images/web2/head.jpg" class="j-img"> <span
							class="msk"></span>
					</div>
					<div class="cnt">
						<div class="cntc">
							<div class="hd f-cb">
								<i class="f-fl u-icn u-icn-13"></i>
								<div class="tit">
									<h2 class="f-ff2 f-brk">
										<%=request.getAttribute("listName")%>
									</h2>
								</div>
							</div>
							<div class="user f-cb">
								<span class="name"> </span> <span class="time s-fc4"><%=request.getAttribute("createDate")%>&nbsp;创建</span>
							</div>
							<div class="btns f-cb j-action" id="auto-id-M3toiguNsIzJKMTi"
								data-rid="80631439" data-type="13">

								<a
									href="getMusicListID?musiclistid=<%=request.getAttribute("listId")%>"
									target="bottomFrame"
									class="u-btn2 u-btn2-2 u-btni-addply f-fl j-ply"
									hidefocus="true" title="播放" id="auto-id-M3toiguNsIzJKMTi"><img
									src="images/web2/play.jpg"></a> <a href="#"
									class="u-btni u-btni-fav j-fav" hidefocus="true"
									id="auto-id-ymLqZafyB9m1lIXz"><img
									src="images/web2/collect.jpg"></a> <a href="#"
									class="u-btni u-btni-share j-shr" hidefocus="true"
									id="auto-id-4uJN6JTMANoyUJ2I"><img
									src="images/web2/share.jpg"></a> <a href="#"
									class="u-btni u-btni-cmmt nomr j-cmt" hidefocus="true"
									id="auto-id-ZwTD304RzitZJkTI"><img
									src="images/web2/common.jpg"></a>
							</div>
							<!--                                    <div class="tags f-cb">
                                        <b>标签：</b>
                                        <a class="u-tag" href="/discover/playlist/?cat=%E5%8D%8E%E8%AF%AD&amp;order=hot"><i>华语</i></a>
                                        <a class="u-tag" href="/discover/playlist/?cat=%E9%A9%BE%E8%BD%A6&amp;order=hot"><i>驾车</i></a>
                                        <a class="u-tag" href="/discover/playlist/?cat=%E6%B5%81%E8%A1%8C&amp;order=hot"><i>流行</i></a>
                                    </div>-->

						</div>
					</div>
				</div>

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
													<a onclick="newwindow1(<%=m.getValue().getId()%>)"title="添加到歌曲列表"><img src="images/web2/add.jpg"></a>
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

				<!-- 评论 -->
				<br>
				<br>
				<p style="font-size: 28px">评论</p>
				<hr size="4px"  width="99%" color="#DC143C"/>
				<br>
				<div id="content">
					<div id="post">
						<textarea class="transition"></textarea>
						<input id="postBt" type="button" value="发表评论" />
						<!--     <input id="clearBt" type="button" value="清空"/> -->
					</div>
					<div id="comment">
					<%if(request.getAttribute("commonlist") != null){
						List<Comment> list = (List)request.getAttribute("commonlist");
						for(int i = 0;i < list.size();i++){
						%>
					<p onload="Storage.save(<%=list.get(i).getCreateTime() %>, <%=list.get(i).getContent() %>)"><span class="msg"> <%=list.get(i).getContent() %>
					</span><span class="datetime"><%=list.get(i).getCreateTime() %></span></p>
						<%}} %>
					</div>
				</div>

				<!-- 评论 -->

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
