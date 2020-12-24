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
	if (request.getParameter("delDis") != null) {
		String discription = request.getParameter("delDis");
		sqlSession.delete("test.delProduct", discription);
		sqlSession.commit();
		response.sendRedirect("mainAdmin.jsp");
	}
	else if (request.getParameter("prevDis") == null) {
		request.setCharacterEncoding("UTF-8");
		String cate = request.getParameter("category");
		String img = request.getParameter("img");
		String price = request.getParameter("price");
		String discription = request.getParameter("discription");
	    HashMap info = new HashMap();
	    info.put("category", cate);  
	    info.put("img", img);  
	    info.put("price", price);  
	    info.put("discription", discription); 
		sqlSession.insert("test.addItem", info);
		sqlSession.commit();
		response.sendRedirect("mainAdmin.jsp");
	}
	else {
		request.setCharacterEncoding("UTF-8");
		String cate = request.getParameter("newcategory");
		String img = request.getParameter("newimg");
		String prevDiscription = request.getParameter("prevDis");
		String price = request.getParameter("newprice");
		String discription = request.getParameter("newdiscription");
		List goodsList = sqlSession.selectList("test.getSameDis", prevDiscription);
		int size = goodsList.size();
		if (size == 0) {
			response.sendRedirect("mainAdmin.jsp");
		}
		else {
		    HashMap info = new HashMap();
		    info.put("category", cate);  
		    info.put("img", img);  
		    info.put("price", price);  
		    info.put("discription", discription); 
		    info.put("prevDis", prevDiscription); 
			sqlSession.update("test.ALTproduct", info);
			response.sendRedirect("mainAdmin.jsp");
			sqlSession.commit();
		}
	}
	%>
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>