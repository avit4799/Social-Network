<%@page language="java" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.ResultSetMetaData"%>

<body style="background:url(frog.gif) no-repeat fixed center">
<%
	int ok=0;
	if(session.getAttribute("login")!=null && session.getAttribute("login").equals("ok")){
		session.setAttribute("login",null);
		session.setAttribute("email",null);
		ok=1;
	}
	out.println("<p>Sign out.</p>");
	out.println("<p>Back to <a href=\"login.jsp\">Sign in</a> webpage after 5 secs...</p>");
	String content=5+";URL="+"login.jsp";
	response.setHeader("REFRESH",content);
%>
</body>
