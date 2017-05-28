<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@page import="java.util.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.ResultSetMetaData"%>

<%

	response.setCharacterEncoding("UTF-8");
	request.setCharacterEncoding("UTF-8");
	if(session.getAttribute("login")!=null && session.getAttribute("login").equals("ok")){
		String content=0+";URL="+"main.jsp";
		response.setHeader("REFRESH",content); 
	}
%>
	

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>	
		<title>系统登录</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="social network,login">
		<meta http-equiv="description" content="This is the login page.">
		<meta http-equiv="content-Type" content="text/html;charset=UTF-8"> 
<style type="text/CSS">...
<!--
.style1 {...}{
font-size: 18px;
font-weight: bold;
}
.style2 {...}{font-size: 24px}
.style5 {...}{font-size: 16px}
-->
</style>
</head>
<body width="300" height="300">
<center>

<div align="center" class="style1 style2">系 统 登 录
</div>
<form action="loginResponse.jsp" method="post">
	<table border="2" bordercolor="black" bgcolor="">
		<tbody>
		<tr>
			<td height="28"><span class="style5">邮箱：</span> <input type="text" name="email" maxlength="30" style="width:150" pattern="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?"></td>
		</tr>
		<tr>
			<td><span class="style5">密码：</span> <input type="password" name="passwd" maxlength="20" style="width:150"></td>
		</tr>
		</tbody>
	</table>
	<div align="center">
		<input type="submit" value="登录" />&nbsp;&nbsp;
		<input type="button" value="注册" onclick="location.href='register.jsp'"/>
	</div>
</form>
</center>
</body>
</html>
