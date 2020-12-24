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
<script>

<%
	request.setCharacterEncoding("UTF-8");
	String pw = request.getParameter("pw");
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	List goodsList = sqlSession.selectList("test.getUserInfo", id);
	int size = goodsList.size();
	if (pw.equals("")|| id.equals("") || name.equals("")) {
		response.sendRedirect("join.jsp?err=notcom");
	}
	else if (size == 0) {
        HashMap info = new HashMap();
        info.put("id", id);  
        info.put("pw", pw);  
        info.put("name", name);
		sqlSession.insert("test.joinUser", info);
		sqlSession.commit();
		response.sendRedirect("login.jsp?err=com");
	}
	else {
		response.sendRedirect("join.jsp?err=onid");
	}
	%>
</script>
<title>Insert title here</title>
</head>
<body>

</body>
</html>