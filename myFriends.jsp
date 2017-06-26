<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="checkvalid.jsp" %>
<%@page import="java.util.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.ResultSetMetaData"%>

<%

	response.setCharacterEncoding("UTF-8");
	request.setCharacterEncoding("UTF-8");

	String path = request.getContextPath();
		String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";

	/** 链接数据库参数 **/
	String driverName = "com.mysql.jdbc.Driver"; //驱动名称
    String DBUser = "admin"; //mysql用户名
    String DBPasswd = "1234567890"; //mysql密码
    String DBName = "working"; //数据库名
    String MySQLServer = "127.0.0.1"; //MySQL地址
    String MySQLServerPort = "3306"; //MySQL端口号（默认为3306）

	//数据库完整链接地址
	String connUrl = "jdbc:mysql://"+MySQLServer+":"+MySQLServerPort+"/" + DBName + "?user="
		+ DBUser + "&password=" + DBPasswd ;

	//加载数据库驱动
	Class.forName(driverName).newInstance();

	//链接数据库并保存到 conn 变量中
	Connection conn = DriverManager.getConnection(connUrl);

	//申明～？
	Statement stmt = conn.createStatement();

	//设置字符集
	stmt.executeQuery("SET NAMES UTF8");

	//要执行的 sql 查询

	String email=(String)session.getAttribute("email");

	String sql="";
%>
<html>
<head>
	<title>Following</title>
	<meta http-equiv="content-Type" content="text/html;charset=UTF-8">
	
	<style>
			section {
  height: 100vh;
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  position: relative;
}

.blur-container {
  background-size: cover;
  background-position: center;
  background-attachment: fixed;
}
.blur-container::before, .blur-container::after {
  top: 0px;
  left: 0px;
  content: '';
  width: 100%;
  height: 100%;
  display: block;
  position: absolute;
}
.blur-container .container-fluid {
  z-index: 10;
  width: 100%;
  height: 100%;
}
.blur-container .blur-box {
  display: block;
  position: relative;
}
.blur-container .blur-box::before, .blur-container .blur-box::after {
  top: 0px;
  left: 0px;
 // content: '';
  width: 100%;
  height: 100%;
  display: block;
  position: absolute;
}

.blur-container.blur-8 {
  --bg: url(background2.jpg);
  overflow: hidden;
  background-image: var(--bg);
}
.blur-container.blur-8::after {
  background-size: cover;
  background-position: center;
  background-attachment: fixed;
  opacity: 0.8;
  -webkit-filter: blur(6px);
          filter: blur(6px);
  background-image: var(--bg);
}

.blur-container.blur-8 .blur-box {
  background-size: cover;
  background-position: center;
  background-attachment: fixed;
  color: #fff;
  width: 100%;
  height: 90%;
  z-index: 11;
  max-width: 600px;
  max-height: 400px;
  border-radius: 10px;
  background-image: var(--bg);
  box-shadow: 0px 0px 30px #333;
}

.btn {
    display: inline-block;
    font-weight: 400;
    line-height: 1.25;
    text-align: center;
    white-space: nowrap;
    vertical-align: middle;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
    border: 1px solid transparent;
    padding: .5rem 1rem;
    font-size: 1rem;
    border-radius: .25rem;
    -webkit-transition: all .2s ease-in-out;
    -o-transition: all .2s ease-in-out;
    transition: all .2s ease-in-out;
}

a {
    background-color: transparent;
    -webkit-text-decoration-skip: objects;
}


.blur-container.blur-5 {
  --bg: url(background2.jpg);
  background-image: var(--bg); 
  
}
.blur-container.blur-5::after {
  background-size: cover;
  background-position: center;
  background-attachment: fixed;
  opacity: 0.1;
  -webkit-filter: blur(6px);
          filter: blur(6px);
  background-image: var(--bg);
}
.blur-container.blur-5 .blur-box {
  
  width: 100%;
  height: 100px;
  overflow: hidden;
  
  
}
.blur-container.blur-5 .blur-box .btn {
  color: #fff;
  -webkit-transition: 0s;
  transition: 0s;
  cursor: pointer;
  overflow: hidden;
  position: relative;
  padding: 10px 40px;
  border: 2px solid #fff;
  text-decoration: none;
}
.blur-container.blur-5 .blur-box .btn span {
  position: relative;
  z-index: 10;
}
.blur-container.blur-5 .blur-box .btn::before, .blur-container.blur-5 .blur-box .btn::after {
  content: '';
  top: 0px;
  left: 0px;
  width: 100%;
  height: 100%;
  display: block;
  -webkit-transition: 0.3s;
  transition: 0.3s;
  position: absolute;
}
.blur-container.blur-5 .blur-box .btn:hover::before {
  opacity: 0.2;
  background-color: #999;
}
.blur-container.blur-5 .blur-box .btn:hover::after {
  -webkit-filter: blur(4px) brightness(120%);
          filter: blur(4px) brightness(120%);
}
.blur-container.blur-5 .blur-box .btn::before {
  z-index: 10;
  opacity: 0.4;
  background-color: #333;
}
.blur-container.blur-5 .blur-box .btn::after {
  background-size: cover;
  background-position: center;
  background-attachment: fixed;
  background-image: var(--bg);
  -webkit-filter: blur(4px) brightness(70%);
          filter: blur(4px) brightness(70%);
}
.blur-container.blur-5 .blur-box::before {
  z-index: 10;
  opacity: 0.4;
  background-color: #333;
}
.blur-container.blur-5 .blur-box::after {
  background-size: cover;
  background-position: center;
  background-attachment: fixed;
  background-image: var(--bg);
  -webkit-filter: blur(4px) brightness(70%);
          filter: blur(4px) brightness(70%);
}
.align-items-center {
    -webkit-box-align: center !important;
    -webkit-align-items: center !important;
    -ms-flex-align: center !important;
    align-items: center !important;
}
.justify-content-center {
    -webkit-box-pack: center !important;
    -webkit-justify-content: center !important;
    -ms-flex-pack: center !important;
    justify-content: center !important;
}
		
	}
	</style>
	
</head>

<body>
	<section class="blur-container blur-5 justify-content-center align-items-center" style="height:130px">
  <div class="blur-box">
    <div class="container-fluid d-flex justify-content-around align-items-center">
    	
    	   		
      <a style="position:absolute; left:80px" href="main.jsp" rel="nofollow" rel="noreferrer"class="btn"><span>Hi,<%
	sql= "SELECT * FROM `working`.`user` where email='"+email+"' LIMIT 15";
	System.out.println(sql);
	//取得结果
	ResultSet rs = stmt.executeQuery(sql);
	if (rs.next()){
		out.println(rs.getString("UserName"));
	}%></</span></a>
      <a style="position:absolute; left:600px" href="myFriends.jsp" rel="nofollow" rel="noreferrer"class="btn"><span>
      	Following
      </span></a>
      <a style="position:absolute; left:800px" href="personalInfo.jsp" rel="nofollow" rel="noreferrer"class="btn"><span>Profile</span></a>
      <a style="position:absolute; left:1000px" value="Sign out" onclick="location.href='logout.jsp'" rel="nofollow" rel="noreferrer"class="btn"><span>Sign out</span></a>     
       
   			      
    </div>
    
  </div>
  
</section>

<div style="position:absolute;left:1000px;top:100px">
		<form action="search.jsp" method="post">
    	<input type="text" name="searchName" maxlength="20" style="width:120"/> 
      <input type="submit" value="Find friends"/>    	
    </form> 
	</div>
	<div style="height:5">
		
	</div>
		
	

	<%
	sql= "SELECT * FROM `working`.`friends` as a, `working`.`user` as b, `working`.`userdetail` as c where a.email2 = c.email and a.email2 = b.email and a.email = '" + email + "'";
	//取得结果
	System.out.println(sql);
	rs = stmt.executeQuery(sql);
	while (rs.next()){
	%>
	<section style="height:200px" class="blur-container blur-8 justify-content-center align-items-center">
  <div style="position: reletive center" class="blur-box">
    
	
<a style="display:block;width:160px ;color:#FFFFFF;background-color:rgb(150,170,180);text-algn:center;text-decoration:none;padding:4px;;font-weight:bold;" href="view.jsp?email=<%out.print(rs.getString("email2"));%>"><%out.print(rs.getString("username"));%></a></br>&nbsp &nbsp &nbsp Gender: <%out.print(rs.getString("sex"));%></br></br>&nbsp&nbsp&nbsp&nbsp&nbsp;Date of birth: <%out.print(rs.getString("year"));%>/<%out.print(rs.getString("month"));%>/<%out.print(rs.getString("day"));%>	
	
	
</div>
</section>
	<%
	}
	%>

</body>
</html>
<%

		/** 关闭连接 **/
		conn.close();
		stmt.close();
		rs.close();
%>
