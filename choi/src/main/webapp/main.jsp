<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
#adWrapper {
    border: 2px solid black;
    overflow: hidden;
    display: flex;
    height: 300px;
    width: 98%;
}
#adImg1 {
    width: 100%;
    transition: 0.5s;
}
#adImg2 {
    width: 0;
    transition: 0.5s;
}
#adImg3 {
    width: 0;
    transition: 0.5s;
}
</style>
<script>
    window.onload = init;
    var cateFlag = false;
    var adList = ["logo.jpg", "test.jpg", "logo.jpg", "test.jpg"];
    var adPage = 0;
    var adFlag = 2;
    function init() {
    document.getElementById("cateClick").onclick = openCate;
    document.getElementById("adImg1").src = adList[0];
    document.getElementById("adImg2").src = adList[1];
    setInterval(function(){
            adFloating();
        }, 3000);
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
    function adFloating() {
        if (adFlag == 2) {
            adPage++;
            document.getElementById("adImg1").style.width = "0";
            document.getElementById("adImg2").style.width = "100%";
            document.getElementById("adImg3").remove();
            var img = document.createElement("img");
            img.style.width = "0";
            img.style.transition = "0.5s";
            img.id = "adImg3";
            img.style.height = "300px";
            document.getElementById("adWrapper").insertBefore(img, document.getElementById("adWrapper").lastChild);
            document.getElementById("adImg3").src = setAd();
            adFlag = 3;
        }
        else if (adFlag == 1) {
            adPage++;
            document.getElementById("adImg1").style.width = "100%";
            document.getElementById("adImg3").style.width = "0";
            document.getElementById("adImg2").remove();
            var img = document.createElement("img");
            img.style.width = "0";
            img.style.transition = "0.5s";
            img.id = "adImg2";
            img.style.height = "300px";
            document.getElementById("adWrapper").insertBefore(img, document.getElementById("adWrapper").lastChild);
            document.getElementById("adImg2").src = setAd();
            adFlag = 2;
        }
        else {
            adPage++;
            document.getElementById("adImg2").style.width = "0";
            document.getElementById("adImg3").style.width = "100%";
            document.getElementById("adImg1").remove();
            var img = document.createElement("img");
            img.style.width = "0";
            img.style.transition = "0.5s";
            img.id = "adImg1";
            img.style.height = "300px";
            document.getElementById("adWrapper").insertBefore(img, document.getElementById("adWrapper").lastChild);
            document.getElementById("adImg1").src = setAd();
            adFlag = 1;
        }
    }
    function setAd() {
        if (adPage > adList.length) {
            return adList[adPage%(adList.length)];
        }
        else {
            return adList[adPage-1];
        }
    }
</script>
<body>
    <div id="nav">
        <p id="logo">
            <img width="130" height="50"
                src="logo.jpg"/>
        </p>
        <a id="cateClick"><b>카테고리▶</b></a><br>
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
        <a></a>
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
            <div id="adWrapper">
                <img id="adImg1" src="" height="300px"></img>
                <img id="adImg2" src="" height="300px"></img>
                <img id="adImg3" src="" height="300px"></img>
            </div>
        </div>
    </div>
</body>
</html>