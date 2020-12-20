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
<script>

<%
request.setCharacterEncoding("UTF-8");
String pw = request.getParameter("pw");
String id = request.getParameter("id");
List goodsList = sqlSession.selectList("test.getUserInfo", id);
int size = goodsList.size();
if (size == 0) {
	response.sendRedirect("login.jsp?err=err");
}
else {
	response.sendRedirect("main.jsp");
}
	%>
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>