<%@page import="java.io.PrintWriter"%>
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
   String err = request.getParameter("err");
   if (err == null) {
   }
   else if (err.equals("err")) {
	   PrintWriter outer = response.getWriter();
	   response.setContentType("text/html; charset=utf=8");
	   outer.println("<script>");
	   outer.println("alert('id나 패스워드 확인 요망');");
	   outer.println("</script>");
   }
   else if (err.equals("com")) {
	   PrintWriter outer = response.getWriter();
	   response.setContentType("text/html; charset=utf=8");
	   outer.println("<script>");
	   outer.println("alert('가입완료! 로그인 요망');");
	   outer.println("</script>");
   }
		%>
	window.onload = init;
	function init() {
		document.getElementById("join").onclick = function() {
        location.href = "join.jsp";
		}
	}
   </script>
   </head>
    <body>
        <div id="wrapper">
        <div id="header"><span id="title"><span id="t">로그인</span></span></div>
        <form method="post" action="logincheck.jsp">
        <div id="main"><span id="idAlign"><span id="id">ID</span>
        <input type="text" name="id"></input></span>
            <br><span id="pwAlign"><span id="pw">PW</span><input type="password" name="pw"></input></span>
            <br><br></div>
        <div id="footer"><input type="submit" name="login" value="확인">
        </input><input type="button" id="join" name="join" value="회원가입"></input></form></div>
        </div>
    </body>
</html>