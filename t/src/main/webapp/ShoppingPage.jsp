<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.mybatis.sample.app.SampleSessionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSessionManager"%>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="java.util.*"%>
<%
    SqlSessionFactory sqlSessionFactory = SampleSessionFactory.getSqlSession();
    SqlSession sqlSession = sqlSessionFactory.openSession();
    System.out.println(sqlSession.selectList("Test.getid"));
    %>
    <!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>My Blog Page</title>
<style>
html {
    height: 100%;
    min-width:800px;
}
body {
    background-color: white;
    font-family: Arial, "Trebuchet MS", sans-serif;
    margin: 0px;
    height: 100%;
}
#wrapper {
    width:78%;
    right: 0px;
    height: 100%;
    float: right;
    overflow: hidden;
}
#nav {
    background-color: white;
    height: 100%;
    width: 19.8%;
    float: left;
    border-right: 2px solid #C1C1C1;
}
#header {
    background-color: white;
    color: #000000;
    height: 50px;
}
h1 {
    margin: 0px;
}
div#main {
    height: 100%;
    background-color: white;
}
footer {
    background-color: #954b4b;
    color: #efe5d0;
    padding: 10px;
    margin: 0px 0px 0px 0px;
    font-size: 90%;
}
#logo {
    position: relative;
    left: 10px;
    top: 10px;
}
#searchbar{
    position: relative;
    top: 12px;
    width: 250px;
    height: 20px;
    left: 10px;
    border: 0;
    border-bottom: 2px solid black;
}
#search {
    position: relative;
    top: 13px;
    left: 5px;
    background-image: url("search.JPG");
    background-size: cover;
    border: 0px;
    width: 20px;
}
#bag {
    position: relative;
    float: right;
    left: -100px;
    top: 12px;
    background-image: url("basket.JPG");
    background-size: cover;
    background-repeat: no-repeat;
    border: 0px;
    width: 20px;
}
#keep {
    position: relative;
    float: right;
    left: -53px;
    top: 12px;
    background-image: url("keep.JPG");
    background-size: cover;
    border: 0px;
    width: 10px;
}
#user {
    position: relative;
    float: right;
    right: 0px;
    top: 12px;
    background-image: url("user.jpg");
    background-size: cover;
    border: 0px;
    width: 20px;
}
#category {
    height: 100%;
    padding-top: 10px;
    left: 20%;
    top: 0;
    z-index: 1;
    transition: 0.5s;
    overflow-x: hidden;
    width: 0px;
    position: fixed;
    background-color: white;
}
#category::-webkit-scrollbar {
    width: 7px;
    background-color: white;
}
#category::-webkit-scrollbar-thumb {
    border-radius: 10px;
    background-color: #C1C1C1;
}
#category::-webkit-scrollbar-track {
    border-radius: 2px;
}
#category a{
    width: 0px;
    padding: 6px 6px 6px 20px;
    text-decoration: none;
    color: black;
    display: block;
    word-break:keep-all;
}
#category a:hover{
    color:royalblue;
    text-decoration: underline;
}
#nav a{
    display: block;
    padding: 6px 6px 6px 20px;
	-webkit-user-select: none;
}
#nav a:hover{
    color:royalblue;
    text-decoration: underline;
}
#categoryTable{
    border-bottom: 1.5px solid black;
    min-width: 800px;
}
#cateTitle{
    float: left;
    width: 15%;
    padding-top:30px;
    padding-bottom: 30px;
    padding-left: 70px;
    min-width: 10px;
}
#cateList {
    float: right;
    width: 74.8%;
    min-width: 600px;
}
#categoryTable{
    border-top: 1px solid #C1C1C1;
    border-bottom: 1.5px solid black;
    height: 80px;
}
#categoryTable input{
    border: 0;
    background-color: white;
    margin-left: 40px;
    margin-top: 15px;
}
#categoryTable input:hover{
    text-decoration: underline;
}
#thingsList {
    width: 100%;
}
#thingsList td{
    width: 25%;
    text-align: center;
}
.makeKeep {
    margin-right: 2px;
    background-image: url("keep.JPG");
    background-size: cover;
    border: 0px;
    width: 10px;
}
.buy {
    background-image: url("basket.JPG");
    background-size: cover;
    border: 0px;
    width: 20px;
}
</style>
<script>
    window.onload = init;
    document.getElementById("nav").onload = <%
    List goodsList = sqlSession.selectList("Test.getProduct");
    int size = goodsList.size();
    for (int i = 0; i < size; i++) {
    	HashMap li = (HashMap)goodsList.get(i);
    	System.out.println(li);
    	}
    %>
    var goodsList
    var cateFlag = false;
    function init() {
    document.getElementById("cateClick").onclick = openCate;
    document.getElementById("logo").onclick = function() {
        location.href = "Main.html";
	}
}
    function openCate() {
        if (cateFlag == true) {
            cateFlag = false;
            document.getElementById("category").style.width = "0px";
        }
        else {
            cateFlag = true;
            document.getElementById("category").style.width = "100px";
        }
    }
</script>
<body>
    <div id="nav">
        <p id="logo">
            <img width="130" height="50"
                src="logo.jpg">
            </img>
        </p>
        <a id="cateClick"><b>카테고리▶</b></a>
        <a href="http://developer.mozilla.org/"><b>핫딜</b></a>
        <a href="http://htmldog.com/guides/"><b>랭킹</b></a>
        <a href="http://htmldog.com/guides/"><b>about Site</b></a>
    </div>
    <div id="category">
        <a href="http://www.w3c.org/">디지털</a>
        <a href="http://www.w3c.org/">뷰티</a>
        <a href="http://www.w3c.org/">가구</a>
        <a href="http://www.w3c.org/">패션</a>
        <a href="http://www.w3c.org/">도서</a>
        <a href="http://www.w3c.org/">여행</a>
        <a href="http://www.w3c.org/">e쿠폰</a>
        <a href="http://www.w3c.org/">공구</a>
        <a href="http://www.w3c.org/">반려</a>
        <a href="http://www.w3c.org/">문구</a>
        <a href="http://www.w3c.org/">취미</a>
        <a href="http://www.w3c.org/">생필품</a>
        <a href="http://www.w3c.org/"></a>
    </div>
    <div id="wrapper">
        <div id="header">
            <div class="header">
                <input type="text" id="searchbar"></input>
                <input type="submit" id="search" value=""></input>
                <input type="button" id="bag"></input>
                <input type="button" id="keep"></input>
                <input type="button" id="user"></input>
            </div>
        </div>
        <div id="main">
            <div id="categoryTable">
                <span id="cateTitle">카테고리</span>
                <span id="cateList">
                    <input type="button" id="dig" value="디지털"/><input type="button" id="beauty" value="뷰티"/><input type="button" id="furn" value="가구"/>
                    <input type="button" id="fas" value="패션"/><input type="button" id="book" value="도서"/><input type="button" id="trip" value="여행"/>
                    <br>
                    <input type="button" id="cu" value="e쿠폰"/><input type="button" id="thing" value="공구"/><input type="button" id="pet" value="반려"/>
                    <input type="button" id="write" value="문구"/><input type="button" id="hobby" value="취미"/><input type="button" id="food" value="생필품"/>
                </span>
            </div>
            <table id="thingsList" border='1'>
                <tr>
                    <td><img src=""/><br><span>가격</span><br><span>설명</span>
                        <br><input type="button" class="makeKeep"/><span> n찜ㅣn구매</span> 
                        <input type="button" class="buy"/>
                    <td><img src=""/><br><span>가격</span><br><span>설명</span>
                        <br><input type="button" class="makeKeep"/><span> n찜ㅣn구매</span> 
                        <input type="button" class="buy"/> 
                    <td><img src=""/><br><span>가격</span><br><span>설명</span>
                        <br><input type="button" class="makeKeep"/><span> n찜ㅣn구매</span> 
                        <input type="button" class="buy"/> 
                    <td><img src=""/><br><span>가격</span><br><span>설명</span>
                        <br><input type="button" class="makeKeep"/><span> n찜ㅣn구매</span>  
                        <input type="button" class="buy"/>
                </tr>
            </table>
        </div>
    </div>
</body>
</html>