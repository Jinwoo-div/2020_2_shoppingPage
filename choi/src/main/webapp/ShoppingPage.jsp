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
#thingsTable {
    width: 100%;
}
#thingsTable td{
    width: 25%;
    text-align: center;
    border: solid 1px black;
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
    function loadThings(cat) {
    	var table = document.getElementById("thingsTable");
    	var len = table.rows.length;
    	for (var i = 0; i < len; i++) {
    		table.deleteRow(0);	
    	}
	    var discriptionList = new Array();
	    var priceList = new Array();
	    var imgList = new Array();
	    var keepList = new Array();
	    var buyList = new Array();
	    var categoryList = new Array();
	    var cate = cat;
	    <%
	    request.setCharacterEncoding("UTF-8");
	    String cat = request.getParameter("name");
	    List goodsList = sqlSession.selectList("test.getProduct");
	    int size = goodsList.size();
	    for (int i = 0; i < size; i++) {
	    	HashMap li = (HashMap)goodsList.get(i);
    		String tmp = (String)li.get("category");
    		if (tmp.equals(cat)) {
    		}
    		else {
    			continue;
    		}
    		%>
	    	categoryList.push('<%=tmp%>');
    	    <%
    		tmp = (String)li.get("discription");
    		%>
    	    discriptionList.push('<%=tmp%>');
    	    <%
    		tmp = (String)li.get("price");
    		%>
	    	priceList.push('<%=tmp%>');
    	    <%
    		tmp = (String)li.get("img");
    		%>
    		imgList.push('<%=tmp%>');
    	    <%
    		tmp = (String)li.get("keepNum");
    		%>
	    	keepList.push('<%=tmp%>');
    	    <%
    		tmp = (String)li.get("buyNum");
    		%>
	    	buyList.push('<%=tmp%>');	    	   
	    	<%
	    	}
	    %>/* 
	    var le = buyList.length;
	    var unmatch = new Array();
	    for (var i = 0; i < le; i++) {
	    	if (categoryList[i] == cate) {
	    		continue;
	    	}
	    	else {
	    		unmatch.push(i);
	    	}
	    }
	    for (var i = unmatch.length-1; i > -1; i--) {
		    discriptionList.splice(unmatch[i], 1);
		    priceList.splice(unmatch[i], 1);
		    imgList.splice(unmatch[i], 1);
		    keepList.splice(unmatch[i], 1);
		    buyList.splice(unmatch[i], 1);
		    categoryList.splice(unmatch[i], 1);
	    } */
	    for (var i = 1; i < buyList.length+1; i++) {
	        if (i%4 == 1) {
		        var newtr = document.createElement("tr");
		        newtr.id = "line" + (parseInt(i/4)+1);
		        document.getElementById("thingsList").appendChild(newtr);
	        }
	        var linenum;
	        if (i/4 == 1) {
	        	linenum = parseInt(i/4);
	        }
	        else {
	        	linenum = parseInt(i/4)+1;
	        }
	        var name = "line" + (linenum);
	       	document.getElementById(name).insertCell()
	        var arr = document.getElementById(name).getElementsByTagName("td");
	       	var index = i%4;
	       	if (index == 0) {
	       		index = 3;
	       	}
	       	else {
	       		index -= 1;
	       	}
		    var discripition = discriptionList[i-1]
		    var price = priceList[i-1];
		    var img = imgList[i-1];
		    var keep = keepList[i-1];
		    var buy = buyList[i-1];
		    var category = categoryList[i-1];
	        arr[index].innerHTML = "<img src=''/><br><span>"+price+"원</span><br><span>"+discripition+"</span><br><input type='button' class='makeKeep'/><span> " + keep+"찜ㅣ "+buy+"구매</span> <input type='button' class='buy'/>";
	    }

    }
    var cateFlag = false;
    function init() {
    document.getElementById("cateClick").onclick = openCate;
    document.getElementById("dig").onclick = loadThings("dig");
    document.getElementById("beauty").onclick = loadThings("furn");
    document.getElementById("fash").onclick = loadThings("fash");
    document.getElementById("book").onclick = loadThings("book");
    document.getElementById("trip").onclick = loadThings("trip");
    document.getElementById("cu").onclick = loadThings("cu");
    document.getElementById("thing").onclick = loadThings("thing");
    document.getElementById("pet").onclick = loadThings("pet");
    document.getElementById("write").onclick = loadThings("write");
    document.getElementById("hobby").onclick = loadThings("hobby");
    document.getElementById("food").onclick = loadThings("food");
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
        <a id="cateClick"><b>카테고리▶</b></a><br>
        <a><b>핫딜</b></a><br>
        <a><b>랭킹</b></a><br>
        <a><b>about Site</b></a><br>
    </div>
    <div id="category">
        <a href="ShoppingPage.jsp?name=dig">디지털</a>
        <a href="ShoppingPage.jsp?name='beauty'">뷰티</a>
        <a href="ShoppingPage.jsp?name='furn'">가구</a>
        <a href="ShoppingPage.jsp?name='fash'">패션</a>
        <a href="ShoppingPage.jsp?name='book'">도서</a>
        <a href="ShoppingPage.jsp?name='trip'">여행</a>
        <a href="ShoppingPage.jsp?name='cu'">e쿠폰</a>
        <a href="ShoppingPage.jsp?name='thing'">공구</a>
        <a href="ShoppingPage.jsp?name='pet'">반려</a>
        <a href="ShoppingPage.jsp?name='write'">문구</a>
        <a href="ShoppingPage.jsp?name='hobby'">취미</a>
        <a href="ShoppingPage.jsp?name='food'">생필품</a>
        <a href=""></a>
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
                    
        			<a href="ShoppingPage.jsp?name=dig" id="dig">디지털</a><a href="ShoppingPage.jsp?name='beauty'" id="beauty">뷰티</a><a href="ShoppingPage.jsp?name='furn'" id="furn">가구</a>
                    <a href="ShoppingPage.jsp?name='fash'" id="fash">패션</a><a href="ShoppingPage.jsp?name='book'" id="book">도서</a><a href="ShoppingPage.jsp?name='trip'" id="trip">여행</a>
                    <br>
                    <a href="ShoppingPage.jsp?name='cu'" id="cu">e쿠폰</a><a href="ShoppingPage.jsp?name='thing'" id="thing">공구<a href="ShoppingPage.jsp?name='pet'" id="pet">반려</a>
                    <a href="ShoppingPage.jsp?name='write'" id="write">문구</a><a href="ShoppingPage.jsp?name='hobby'" id="hobby">취미</a><a href="ShoppingPage.jsp?name='food'" id="food">생필품</a>
                </span>
            </div>
            <table id="thingsTable">
            	<tbody id="thingsList">
                <tr>
                  <!--   <td><img src=""/><br><span>가격</span><br><span>설명</span>
                        <br><input type="button" class="makeKeep"/><span> n찜ㅣn구매</span> 
                        <input type="button" class="buy"/></td> -->
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>