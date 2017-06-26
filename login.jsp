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
		<title>Sign in</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="social network,login">
		<meta http-equiv="description" content="This is the login page.">
		<meta http-equiv="content-Type" content="text/html;charset=UTF-8">
<style type="text/CSS">...
body{color:#000;background:#fff;font-size:12px;line-height:166%;text-align:center;}
body{font-family:verdana}
h1{font-size:100%}
body,h1{margin:0;padding:0;border:0}
a{text-decoration:none;color:#959595}
a:hover{color:#626262}
.fontWeight{font-weight:700}
.header{width:1000px;height:81px;position:relative;margin:0 auto;z-index:2;overflow:hidden;}
.headerLogo{top:17px;left:50px;position:absolute}
.headerIntro{height:28px;width:144px;display:block;background-position:0 -64px;top:17px;left:174px;position:absolute}
.headerNav{top:21px;right:100px;text-align:right;color:#cfd0d0;position:absolute}
.headerNav a{padding-left:13px;display:inline-block;}
.headerNav .last{padding-left: 0;}

.main{height:600px;background:#fff;position:relative;min-width:1000px;}
.main-inner{background:url(background.jpg) no-repeat center top}
#mainCnt{width:100%;height:600px;position:relative;clear:both;background-repeat:no-repeat;background-position:center top;}

.style1{width:295px;padding:13px 14px 15px;top:56px;left:50%;margin-left:90px;text-align:center;
	position:absolute;border:1px solid #b9cbd8; border-bottom:2px solid #c3cfd8; background:#fff;}
	input{width:150;height:30;text-align:center}
.input-row{margin:20px;margin-bottom:18px;height=40px;position:relative;font-size:20px;font-weight:300;text-align:center;}

</style>


<!-- added part -->
<script src="https://www.google.com/recaptcha/api.js"></script>
<!-- added part -->


</head>

<body width="300" height="300">
	<header class="header">
	<h1 class="headerLogo"><img src="logo.jpg" alt="logo"/></h1>
	<a class="headerIntro">website introduction</a>
	<nav class="headerNav">
		<a href>xxxx</a>
		<a href>xxxx</a>
		<a href>xxxx</a>
		
	</nav>		
	</header>
	<section class="main" >
		<div id="mainCnt" class="main-inner"></div>
		
		<div align="center" class="style1 style2">Log in
    
    <form action="loginResponse.jsp" method="post">
      <div class="input-row" align="center">
      	<input class="email" placeholder="Email" type="text" name="email" maxlength="30" style="width:150" pattern="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?">
      </div>	
	    <div class="input-row password-row" align="center">
	    	<input type="password" name="passwd" placeholder="password" maxlength="20" style="width:150">
	    </div>			
	<!-- added part -->
		<div class="g-recaptcha" data-sitekey="6LdDNiMUAAAAAHDPfsdqqPKAPFEy5Xi3EoGwJIXi"></div>
	<!-- added part -->
	  <div>
		<input class="buttonrow" type="submit" value="Sign in" />
		<input class="buttonrow" type="button" value="Sign up" onclick="location.href='register.jsp'"/>
	</div>
</form>
			
	</div>
	</section>

</body>
</html>
