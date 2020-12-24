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
            margin-right: 138px;
                    }
        #nameAlign {
            margin-right: 138px;
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
        
        #name {
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
	window.onload = init;
	var idWrong = true;
   <%
   List goodsList = sqlSession.selectList("test.getProduct");
  /*  for (int i = 0; i < size; i++) {
   	HashMap li = (HashMap)goodsList.get(i);
		String tmp = (String)li.get("category");
   } */
		%>
	<% 
	   request.setCharacterEncoding("UTF-8");
	   String err = request.getParameter("err");
	   if (err == null) {
	   }
	   else if (err.equals("onid")) {
		   PrintWriter outer = response.getWriter();
		   response.setContentType("text/html; charset=utf=8");
		   outer.println("<script>");
		   outer.println("alert('id중복! 다른id 사용요망');");
		   outer.println("</script>");
	   }
	   else if (err.equals("notcom")) {
		   PrintWriter outer = response.getWriter();
		   response.setContentType("text/html; charset=utf=8");
		   outer.println("<script>");
		   outer.println("alert('3칸 모두 작성요망');");
		   outer.println("</script>");
	   }
	   %>
   </script>
   </head>
    <body>
        <div id="wrapper">
        <div id="header"><span id="title"><span id="t">회원가입</span></span></div>
        <form method="post" action="joinCheck.jsp">
        <div id="main"><span id="idAlign"><span id="id">ID</span>
        <input type="text" name="id" id="idin"></input></span>
            <br><span id="pwAlign"><span id="pw">PW</span><input type="password" name="pw"></input></span>
            <br><br><span id="nameAlign"><span id="name">이름</span><input type="text" name="name"></input></span></div>
        <div id="footer"><input type="submit" name="login" value="확인">
        </input></form></div>
        </div>
    </body>
</html>