<%@ page language="java" contentType="text/html; charset=UTF-8"
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
<meta charset="UTF-8">
    <style>
        #wrapper {
            min-width: 500px;
            border-radius: 20px;
            border: solid 3px;
            border-color: plum;
        }
        #header {
            min-height: 10px;
            text-align: center;
            margin-top: 30px;
            margin-bottom: 30px;
        }
        #main {
            min-height: 150px;
            text-align: center;
        }
        #idAlign {
            text-align:center;
            margin-top: 15px;
        }
        #pwAlign {
            margin-right: 138px;
        }
        #noti {
            font-style: bold;
            font-size: 15px;
            border: solid red 1.5px;
            border-radius: 15px;
            padding-left: 5px;
            padding-right: 5px;
        }
        #footer {
            margin-bottom: 10px;
            text-align: center;
        }
        input[type=submit] {
            border-radius: 10px;
            border: solid purple;
            font-size: 15px;
            background-color:mediumpurple;
            color: white;
            padding-left: 25px;
            padding-right: 25px;
        }
        #title {
            border-radius: 30px;
            border: solid purple;
            font-size: 30px;
            background-color:mediumpurple;
            text-decoration-color: white;
            padding-left: 30px;
            padding-right: 30px;
        }
        #t {
            color: white;
        }
        #input[type=text] {
            width: 10px;
        }
        #id {
            font-style: bold;
            font-size: 25px;
            margin-right: 100px;
        }
        #pw {
            font-style: bold;
            font-size: 25px;
            margin-right: 100px;
        }
        input[type=button] {
            border-radius: 10px;
            border: solid purple;
            font-size: 15px;
            background-color:mediumpurple;
            color: white;
            padding-left: 25px;
            padding-right: 25px;
        }
   </style>
   <script>
   <%
   request.setCharacterEncoding("UTF-8");
   String cat = request.getParameter("name");
   List goodsList = sqlSession.selectList("test.getProduct");
   int size = goodsList.size();
   for (int i = 0; i < size; i++) {
   	HashMap li = (HashMap)goodsList.get(i);
		String tmp = (String)li.get("category");
   }
		%>
	window.onload = init;
	function init() {
	}
   </script>
   </head>
    <body>
        <div id="wrapper">
        <div id="header"><span id="title"><span id="t">로그인</span></span></div>
        <form method="post" action="main.jsp">
        <div id="main"><span id="idAlign"><span id="id">ID</span>
        <input type="text" name="id"></input>
            <input type="submit" id="check" value="중복확인"></input></span>
            <br><span id="pwAlign"><span id="pw">PW</span><input type="password" name="pw"></input></span>
            <br><br><span id="noti">비밀번호를 입력해주세요</span></div>
        <div id="footer"><input type="submit" name="login" value="확인">
        </input></form></div>
        </div>
    </body>
</html>