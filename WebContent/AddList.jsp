<%-- 
    Document   : AddList
    Created on : 2015-6-30, 21:13:31
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript">
        function addList(){
        	var listname = document.getElementById("musicListName").value;
        	var xmlhttp = new XMLHttpRequest();
        	listname = encodeURI(listname);
        	listname = encodeURI(listname);
    		xmlhttp.open("POST", "addMusicList?musiclistname=" + listname, false);
    		xmlhttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded; charset=utf-8;");
    		xmlhttp.send();
    	}
        </script>
    </head>
    <body>
        <div>歌单名称:</div><br>
        <div><input id="musicListName" type="text " name="musicListName">&nbsp;&nbsp;<input type="button" onclick="addList()" style="width:82px;height:32px;border:none;background:url(images/web2/NewAdd.jpg) left top no-repeat;" value=""></div>
    </body>
</html>
