<%@page language="java" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.ResultSetMetaData"%>

<body bgcolor="papayawhip">
<%
	int ok=0;
	if(session.getAttribute("login")!=null && session.getAttribute("login").equals("ok")){
		session.setAttribute("login",null);
		session.setAttribute("userID",null);
		ok=1;
	}
	out.println("<p>退出登录！！</p>");
	out.println("<p>5秒后返回<a href=\"login.jsp\">登陆</a>页面！</p>");
	String content=5+";URL="+"login.jsp";
	response.setHeader("REFRESH",content); 
%>
</body>