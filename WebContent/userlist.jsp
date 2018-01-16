<%@page import="Dao.Music"%>
<%@page import="java.util.Map"%>
<%@page import="Dao.MusicList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/userListStyle.css">
</head>
<body id="auto-id-wnNonECTIXPNMaTS"class="auto-1435105232024-parent">
           
        <div id="m-playlist" class="g-bd4 f-cb">
            <div class="g-mn4">

                <div class="g-wrap6">
                    <!--标题栏-->
                    <div class="m-info f-cb">
                        <div class="cover u-cover u-cover-dj">
                            <img src="images/web2/head.jpg" class="j-img" >
                            <span class="msk"></span>
                        </div>
                        <div class="cnt">
                            <div class="cntc">
                                <div class="hd f-cb">
                                    <i class="f-fl u-icn u-icn-13"></i>
                                    <div class="tit">

                                        <h2 class="f-ff2 f-brk"> 

                                            <%=request.getAttribute("listName") %>
                                            
                                            <!--<a id="s13007" href=""><img src="images/web2/change.jpg">编辑</a>-->

                                        </h2>

                                    </div>
                                </div>
                                <div class="user f-cb">

                                    <span class="name">

                                    </span>
                                    <span class="time s-fc4"><%=request.getAttribute("createDate")%>
                                        &nbsp;创建</span>
                                </div>
                                <div class="btns f-cb j-action" id="auto-id-M3toiguNsIzJKMTi" data-rid="80631439" data-type="13">

                                    <a href="#" class="u-btn2 u-btn2-2 u-btni-addply f-fl j-ply" hidefocus="true" title="播放" id="auto-id-M3toiguNsIzJKMTi"><img src="images/web2/play.jpg"></a>
                                    <a href="#" class="u-btni u-btni-fav j-fav" hidefocus="true" id="auto-id-ymLqZafyB9m1lIXz"><img src="images/web2/collect.jpg"></a>
                                    <a href="#" class="u-btni u-btni-share j-shr" hidefocus="true" id="auto-id-4uJN6JTMANoyUJ2I"><img src="images/web2/share.jpg"></a>
                                    <a href="#" class="u-btni u-btni-cmmt nomr j-cmt" hidefocus="true" id="auto-id-ZwTD304RzitZJkTI"><img src="images/web2/common.jpg"></a>
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
<!--侧栏-->
<div class="g-wrap7">
                        <h3 class="u-hd3">
                            <span class="f-fl">创建的歌单</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                             <a href="javascript:void(0)" onclick="newwindow()"><img src="images/web2/build.jpg"></a>
                        <SCRIPT LANGUAGE="javascript">
                        function newwindow(){window.open ('AddList.jsp', 'newwindow', 'height=100, width=400, top=0, left=0, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=n o, status=no') //这句要写成一行
                        }</SCRIPT>
                        </h3>
                        <ul class="m-rctlist f-cb">
                        
                        <%if(request.getAttribute("musiclist") != null){
                        	List<MusicList> musiclist = (List)request.getAttribute("musiclist");
                        	for(int i = 0;i < musiclist.size();i++){
                        	%>
                               <li>
                                <div class="cver u-cover u-cover-3">
                                    <a data-res-data="recommendclick|0||playlist-playlist-recommend|10192733" data-res-action="log" data-res-type="13" data-res-id="85245918" title="<%=musiclist.get(i).getListName()%>" href="getUserFirstList?musicListid=<%=musiclist.get(i).getListId()%>"><img src="http://p4.music.126.net/NyYREqiCuAxv2jmmNNyB6A==/2889516560215521.jpg?param=50y50">
                                    </a>
                                </div>
                                <div class="info">
                                    <p class="f-thide">
                                        <a data-res-data="recommendclick|0||playlist-playlist-recommend|10192733" data-res-action="log" data-res-type="13" data-res-id="85245918" title="" href="getUserFirstList?musicListid=<%=musiclist.get(i).getListId()%>" class="sname f-fs1 s-fc0"><%=musiclist.get(i).getListName()%></a>
                                    </p>
                                    <p><span class="by s-fc4">by</span><a title="Jioe" href="/user/home?id=38754111" class="nm nm f-thide s-fc3">null</a>
                                    </p>
                                </div>
                            </li>
						<%}} %>
                        </ul>
                        
                    </div>

                    <!--列表-->
                    <table class="m-table" id="m-song-module">
                        <thead>
                            <tr>
                                <th class="first w1"><div class="wp"></div></th>
                   
                        <th><div class="wp">歌曲标题</div></th>
                        <th class="w2"><div class="wp">时长</div></th>
                        <th class="w3"><div class="wp">歌手</div></th>
                        <th class="w4"><div class="wp">专辑</div></th>
                        </tr>
						
                        </thead>
                        
                        <tbody id="m-song-list-module">
                        
                        <%if (request.getAttribute("infomap") != null) {
                			Map<String, Music> map = (Map) request.getAttribute("infomap");
                			int cnt = 1;
                			for (Map.Entry<String, Music> m : map.entrySet()) {%>
                            <tr class="ztag even" data-rt="" data-fee="0" data-id="29004400" id="songlist-29004400">
                                <td class="left">
                                    <div class="hd">
                                        <span data-copyright="1" title="播放" class="j-ply ply" data-type="ply"></span>
                                        <span class="num"><%=cnt++%></span>
                                    </div>
                                </td>
                                <td>
                                    <div class="f-cb">
                                        <div class="tt">
                                            <div class="ttc ttc-1">
                                                <span class="txt">
                                                    <div>
                                                        <b><a style="float:left;" title="<%=m.getValue().getName()%>" href="getMusicListID?musicid=<%=m.getValue().getId()%>" target="bottomFrame"><%=m.getValue().getName()%></a></b>
                                                        
                                                           
                                                        <a onclick="newwindow1(<%=m.getValue().getId()%>)"title="添加到歌曲列表"><img src="images/web2/add.jpg"></a>
                        <SCRIPT LANGUAGE="javascript">
                        function newwindow1(id){window.open ('showUserMusicList?musicId=' + id, 'newwindow', 'height=500px, width=300px, top=0, left=0, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=n o, status=no') //这句要写成一行
                        }</SCRIPT>
                                                         </div>  
                                                </span>
                                            </div>
                                        </div>
                                        <div class="opt hshow" style="display: none;">
                                            <a data-res-action="addto" data-res-id="29004400" data-res-type="18" data-res-copyright="1" hidefocus="true" title="添加到播放列表" href="javascript:;" class="u-icn u-icn-81 icn-add"></a>
                                            <span class="icn icn-fav" title="收藏" data-type="sub" data-copyright="1">收藏</span>
                                            <span class="icn icn-share" title="分享" data-type="shr" data-copyright="1">分享</span>
                                        </div>
                                    </div>
                                </td><%
                                    int time = Integer.parseInt(m.getValue().getTime());
                                    int min = time / 60;
                                    int second = time % 60;
                                %>
                                <td class="s-fc3"><%="" + min + ":" + second%></td>

                                <td><div class="text"><span title="<%=m.getValue().getSingerName()%>"><a href="/artist?id=861777" class="s-fc3"><%=m.getValue().getSingerName()%></a></span></div></td>
                                <td>
                                    <div class="text">
                                        <a title="<%=m.getValue().getAlbum()%>"  class="s-fc3"><%=m.getValue().getAlbum()%></a>
                                    </div>
                                </td>
                            </tr>
                            <%}} %>                
                        </tbody>
                    </table>
                </div>
            </div>
        </div>


    </body>
</html>