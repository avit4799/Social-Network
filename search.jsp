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

	String searchName=(String)request.getParameter("searchName");
	System.out.println(searchName);
	String sql=null;

%>
<html>
<head>
	<title>Find friends</title>
	<meta http-equiv="content-Type" content="text/html;charset=UTF-8">

	<SCRIPT type="text/javascript">
		function addFriend(email){
			if (email!=""){
				var xmlhttp=null;
				if (window.XMLHttpRequest){
					// code for IE7+, Firefox, Chrome, Opera, Safari
					xmlhttp=new XMLHttpRequest();
				}
				else{
					// code for IE6, IE5
					xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
				}
				if (xmlhttp!=null){
					xmlhttp.onreadystatechange=function(){
						if (xmlhttp.readyState==4 && xmlhttp.status==200){
							window.location.href="search.jsp?searchName=<%out.print(searchName);%>";
							var s=document.getElementById(email);
							s.innerHTML="Followed";
						}
					}
					xmlhttp.open("GET","add.jsp?friendID="+email,true);
					xmlhttp.send();
				}
			}else{
				alert("Input something!");
			}
		}
	</SCRIPT>
</head>

<body  align="center" style="width:700">
	<div align="center">
	<table>
	<tr>
	<td style="width:100">Hi, <a href="main.jsp"><%
	sql= "SELECT * FROM `working`.`user` where email='"+email+"' LIMIT 15";
	System.out.println(sql);

	//取得结果
	ResultSet rs = stmt.executeQuery(sql);
	if (rs.next()){
		out.println(rs.getString("UserName"));
	}%></a>
	</td>
    <td style="width:100">
    <a href="myFriends.jsp">Following</a>
    </td>
    <td style="width:100">
    <a href="personalInfo.jsp">Profile</a>
    </td>
	<td style="width:500">
	<form action="search.jsp" method="post">
		<input type="text" name="searchName" maxlength="20" style="width:120"/>
		<input type="submit" value="Find friends" />
		<input type="button" value="Sign out" onclick="location.href='logout.jsp'" />
	</form>
	</td>
	</tr>
	</table>
	</div>
	<hr  style="width:700" />
	<%
	if (searchName!=null){

		sql= "SELECT * FROM `working`.`user` as a, `working`.`userdetail` as b "
			+"where username like '%"+searchName+"%' "
            +"and a.email = b.email "
			+"and a.email !='"+email+"' "
			+"and a.email not in ( "
			+"select email2 from `working`.`friends` where email='"+email+"'"
			+");";

		//取得结果
		System.out.println(sql);
		rs = stmt.executeQuery(sql);
		while (rs.next()){
		%>
		<div align="center" style="width:700" >
		<li>
		<a href="view.jsp?email=<%out.print(rs.getString("email"));%>"><%out.print(rs.getString("username"));%></a>&nbsp;Gender: <%out.print(rs.getString("sex"));%>&nbsp;Date of birth: <%out.print(rs.getString("year"));%>/<%out.print(rs.getString("month"));%>/<%out.print(rs.getString("day"));%>

		<span id="<%out.print(rs.getString("email"));%>"><input type="button" value="Follow" onclick="addFriend('<%out.print(rs.getString("email"));%>')" /></span>

		</li>
		</div>
		<%
		}
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
