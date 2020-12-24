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
var discriptionList = new Array();
<%
	List goodsList = sqlSession.selectList("test.getProduct");

	int size = goodsList.size();
	for (int i = 0; i < size; i++) {
		HashMap li = (HashMap)goodsList.get(i);
		String tmp = (String)li.get("discription");
		%>
	    discriptionList.push('<%=tmp%>');
	    <%
	}
%>
window.onload = function () {
	for (var i = 1; i < discriptionList.length+1; i++) {
	    var newtr = document.createElement("tr");
	    document.getElementById("List").appendChild(newtr);
	   	newtr.insertCell();
	    var arr = document.getElementById("List").getElementsByTagName("td");
	    var discripition = discriptionList[i-1];
	    arr[i].innerHTML = "<span>"+discripition+"</span>";
	}
}
</script>
<title>Insert title here</title>
</head>
<body>
	<div>
	<div id="editor" style="border:solid 1px black">
		<span>--물품추가--</span>
			<form method="post" action="add.jsp">
				<span>이미지</span><input type="text" name="img"><br>
				<span>가격</span><input type="text" name="price"><br>
				<span>설명</span><input type="text" name="discription"><br>
				<span>카테고리</span><select name="category">
				<option SELECTED value="dig">디지털</option>
				<option SELECTED value="beauty">뷰티</option>
				<option SELECTED value="furn">가구</option>
				<option SELECTED value="fash">패션</option>
				<option SELECTED value="book">도서</option>
				<option SELECTED value="trip">여행</option>
				<option SELECTED value="cu">e쿠폰</option>
				<option SELECTED value="thing">공구</option>
				<option SELECTED value="pet">반려</option>
				<option SELECTED value="write">문구</option>
				<option SELECTED value="hobby">취미</option>
				<option SELECTED value="food">생필품</option>
				</select><br>
				<input type="submit">
			</form>
		</div>
		<div style="border:solid 1px black">
		<span>--물품수정--</span>
		<table id="thingsTable" border="1">
            	<tbody id="List">
                <tr>
                <td>현재 등록된 상품리스트</td>
                </tr>
                </tbody>
            </table>
			<form method="post" action="add.jsp">
				<span>수정할 상품명</span><input type="text" name="prevDis"><br>
				<span>이미지</span><input type="text" name="newimg"><br>
				<span>가격</span><input type="text" name="newprice"><br>
				<span>새로운 상품명</span><input type="text" name="newdiscription"><br>
				<span>카테고리</span><select name="newcategory">
				<option SELECTED value="dig">디지털</option>
				<option SELECTED value="beauty">뷰티</option>
				<option SELECTED value="furn">가구</option>
				<option SELECTED value="fash">패션</option>
				<option SELECTED value="book">도서</option>
				<option SELECTED value="trip">여행</option>
				<option SELECTED value="cu">e쿠폰</option>
				<option SELECTED value="thing">공구</option>
				<option SELECTED value="pet">반려</option>
				<option SELECTED value="write">문구</option>
				<option SELECTED value="hobby">취미</option>
				<option SELECTED value="food">생필품</option>
				</select><br>
				<input type="submit">
				</form>
				</div>
				<div style="border:solid 1px black">
				<span>--상품삭제--</span>
				<form method="post" action="add.jsp?new=del">	
				<span>삭제할 상품명</span><input type="text" name="delDis">
				<input type="submit">
				</form>
				</div>
	</div>
</body>
</html>