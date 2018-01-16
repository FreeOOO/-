<%-- 
    Document   : AddMusicToList
    Created on : 2015-6-30, 11:20:41
    Author     : Administrator
--%>

<%@page import="Dao.MusicList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
     <style type="text/css">
         li, s {
    list-style: outside none none;}
    body{
    color: #333333;
    font-family: Arial,Helvetica,sans-serif;
    font-size: 12px;
}
/*             
*::before, *::after {
    box-sizing: border-box;
}
body {
    background: #f5f5f5 none repeat scroll 0 0;
    min-width: 982px;
}
html, body, img, iframe {
    border: 0 none;
}
html, body {
    height: 100%;
    width: 100%;
}
body, textarea, select, input, button {
    color: #333333;
    font-family: Arial,Helvetica,sans-serif;
    font-size: 12px;
}
body, html, h1, h2, h3, h4, h5, h6, ul, ol, li, dl, dt, dd, header, menu, section, p, input, td, th {
    margin: 0;
    padding: 0;
}
* {
    box-sizing: border-box;
}
*::before, *::after {
    box-sizing: border-box;
}
.m-rctlist li {
    height: 50px;
    line-height: 24px;
    margin-bottom: 15px;
    width: 200px;
}

body, html, h1, h2, h3, h4, h5, h6, ul, ol, li, dl, dt, dd, header, menu, section, p, input, td, th {
    padding: 0;
}
* {
    box-sizing: border-box;
}
.g-wrap7 {
    
    padding: 0 40px 40px 30px;
}
* {
    box-sizing: border-box;
}.u-hd3 {
    border-bottom: 1px solid #cccccc;
    color: #333333;
    height: 23px;
    margin-bottom: 20px;
    position: relative;
}
h1, h2, h3, h4, h5, h6 {
    font-size: 100%;}*/
        </style>  
        <title>JSP Page</title>
        <script type="text/javascript">
        function addmusic(musicid,listid){
        	var xmlhttp = new XMLHttpRequest();
    		xmlhttp.open("POST", "addMusic?musicid=" + musicid + "&listid=" + listid, false);
    		xmlhttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded; charset=utf-8;");
    		xmlhttp.send();
    	}
       
        </script>
    </head>
    <body>
        <div class="g-wrap7">
            <h3 class="u-hd3">
                <span class="f-fl">添加到歌单:</span>
            <ul class="m-rctlist f-cb">
                <li><a href="javascript:void(0)" onclick="newwindow()"><img src="images/web2/build.jpg"></a>
                        <SCRIPT LANGUAGE="javascript">
                        function newwindow(){window.open ('AddList.jsp', 'newwindow', 'height=100, width=400, top=0, left=0, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=n o, status=no') //这句要写成一行
                        }</SCRIPT></li>
                    
                    <%if(request.getAttribute("list") != null){
                    	List<MusicList> list = (List)request.getAttribute("list");
                    	for(int i = 0;i < list.size();i++){%>
                <li>
                    <div class="info">
                        <p class="f-thide">
                    <!--      <a data-res-data="recommendclick|0||playlist-playlist-recommend|10192733" data-res-action="log" data-res-type="13" data-res-id="85245918" id="getvalue" value="<%=request.getAttribute("musicid").toString() %>&<%=list.get(i).getListId() %>" class="sname f-fs1 s-fc0"><%=list.get(i).getListName()%></a> -->
                    <input type="button" id="getvalue" onclick="addmusic(<%=request.getAttribute("musicid").toString() %>,<%=list.get(i).getListId() %>)" value="<%=list.get(i).getListName()%>">     
                        </p>
                        
                    </div>
                </li>
				<%}} %>

            </ul>
        </div>
    </body>
</html>
