<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="checkvalid.jsp" %>
<%@page import="java.util.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.ResultSetMetaData"%>


<%

	response.setCharacterEncoding("UTF-8");
	request.setCharacterEncoding("UTF-8");
	String email=(String)session.getAttribute("email");
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
	java.sql.Connection conn = DriverManager.getConnection(connUrl);

	//申明～？
	java.sql.Statement stmt = conn.createStatement();

	//设置字符集
	stmt.executeQuery("SET NAMES UTF8");


	//申明～？
	java.sql.Statement stmt2 = conn.createStatement();

	//设置字符集
	stmt2.executeQuery("SET NAMES UTF8");

	//要执行的 sql 查询
	String sql;


%>
<html>
<head>
	<title>Social Network</title>
	<meta http-equiv="content-Type" content="text/html;charset=UTF-8">
	<style>
		body 
  {
  background-image:url(background.jpg);
  background-repeat:no-repeat;
  background-attachment:fixed
  }
		ul
		{
    list-style-type:none;
    margin:0;
    padding:0;
    overflow:hidden;
    position:relative;
    left:100px;
    }

    li
    {
     float:left;
    }
    a{
    	display:block;
    	min-width:160px;
    	font-weight:bold;
    	color:#FFFFFF;
    	background-color:#669999;
    	text-algn:center;
    	padding:4px;
    	text-decoration:none;
    	text-transfrom:uppercase;
    	}
    
   a:hover,a:active
  {
    background-color:#cc0000;
  }
  div{
		background-color: #ffffff;
		width: 1000px;
    min-height: 100px;
    margin:30px;
    
    position:relative;
    top:15%;
    left:5%;   
    opacity:0.75;

	}
	</style>
	<SCRIPT type="text/javascript">
		function submitStatement(){
			var statement=document.getElementById("statement");
			var strInput = statement.value;
			if (strInput!=""){
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
							window.location.reload();
						}
					}
					strInput="submitStatement.jsp?words="+strInput;
					strInput=encodeURI(strInput);
					strInput=encodeURI(strInput);
					xmlhttp.open("GET",strInput,true);
					xmlhttp.send();
				}
			}else{
				alert("Input something!");
			}
		}
		function reply(statementID, contentID){
            var sentence = statementID+","+contentID;
			var statementDoc=document.getElementById(sentence);
			if(statementDoc.style.display=="none"){
				statementDoc.style.display="";
				statementDoc=document.getElementById(sentence+"Button");
				statementDoc.style.display="";
			}
			else{
				statementDoc.style.display="none";
				statementDoc=document.getElementById(sentence+"Button");
				statementDoc.style.display="none";
			}
		}
		function submitReply(statementID, contentID){
            var sentence = statementID+","+contentID;
			var statementDoc=document.getElementById(sentence);
			var strInput = statementDoc.value;
			if (strInput!=""){
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

							window.location.reload();
						}
					}
					strInput="submitReply.jsp?words="+strInput+"&statementID="+statementID+"&contentID="+contentID;
					strInput=encodeURI(strInput);
					strInput=encodeURI(strInput);
					xmlhttp.open("GET",strInput,true);
					xmlhttp.send();
				}
			}else{
				alert("Input something!");
			}
		}
	</SCRIPT>
</head>
<body>	
    <%response.setIntHeader("Refresh", 30);%>
    
    <ul>
    	<li> <a href="main.jsp">hi,<%
	sql= "SELECT * FROM `working`.`user` where email='"+email+"' LIMIT 15";
	System.out.println(sql);
	//取得结果
	ResultSet rs = stmt.executeQuery(sql);
	if (rs.next()){
		out.println(rs.getString("UserName"));
	}%></a>
	    </li>
    	<li> <a href="myFriends.jsp">Following</a></li>
    	<li> <a href="personalInfo.jsp">Profile</a></li> 
    	<form action="search.jsp" method="post">
    		<li>
    		 <a><input type="text" name="searchName" maxlength="20" style="width:120"/></a>   
    	</li>
    	<li> 	
    	   <a><input type="submit" value="Find friends"/></a>
    	</li>
    	<li><a href="logout.jsp">Sign out</a></li>
    	</form> 
    </ul>  		
	  
	<div align="center">
		<font size="4">Current status:</font>
	 <TEXTAREA type="text" id="statement"  rows=3 cols=15 class="input_detail"></TEXTAREA>
	 <input style="height: 20; width:50" type="button" value="发布" onclick="submitStatement()"/>
	</div>
	<%
	sql= "SELECT a.email as email, username, statusnum, time, content "
		+				"FROM `working`.`user` as a, `working`.`status` as b "
		+	"where a.email=b.email and ("
		+	"(b.email='"+ email+"') "
		+	"or b.email in ( "
		+		"SELECT email2 from `working`.`friends` where email='"+ email+"'))"
	+"order by time desc "
	+"limit 0,50;";
	System.out.println(sql);
	//取得结果
	rs = stmt.executeQuery(sql);
	while (rs.next()){
	%>
	
	<div align="center">		
			
	<tr height="10">
	<a color=white href="view.jsp?email=<%out.print(rs.getString("email"));%>"><%out.print(rs.getString("username"));%></a>
 	</tr>
 	<div style="width:800px">
 		<p style="word-wrap:break-word; word-break:break-all;text-align:left">
		<font size="6" color="black"><%out.print(rs.getString("content"));%></font>
	</p>
 	</div>
 		 	
	<td>
		<font size="3" color="gray"><%out.print(rs.getString("time"));%></font>
	</td>
	
	<td width="40">
		<a style="width:200px" href="javascript:reply('<%out.print(rs.getString("statusnum"));%>', '0')">Reply</a>
	</td>
	
	<td  width="650">
    
	<input style="display:none; height:25;width:500" id="<%out.print(rs.getString("statusnum"));%>,0" value=""/>
	<input type="button" style="display:none;" id="<%out.print(rs.getString("statusnum"));%>,0Button" value="Submit" onclick="submitReply('<%out.print(rs.getString("statusnum"));%>',0)"/>
	
  </td>
	
	<%
	String sql2="SELECT a.email as email, a.username as username, replynum, time, reply, c.email as email2, c.username as username2 "
		+				"FROM `working`.`user` as a, `working`.`reply` as b, `working`.`user` as c "
		+	"where a.email=b.email and "
		+	"b.statusnum='"+ rs.getString("statusnum")+"' "
        +   "and c.email = b.email2 "
		+"order by time desc "
		+"limit 0,100;";
	System.out.println(sql2);
	ResultSet rs2 = stmt2.executeQuery(sql2);
	while (rs2.next()){
	%>
	
	<td class="comment" width="500"><font size="3" color="black">
    <a href="view.jsp?email=<%out.print(rs2.getString("email"));%>"><%out.print(rs2.getString("username"));%></a>Replies:<a href="view.jsp?email=<%out.print(rs2.getString("email2"));%>"><%out.print(rs2.getString("username2"));%></a>
    </font><font size="4" color="black"><%out.print(rs2.getString("reply"));%></font>
	</td>
	<td  class="comment" width="110"><font size="3" color="gray"><%out.print(rs2.getString("time"));%></font>
	</td>
	<td  class="comment" width="60"><a href="javascript:reply('<%out.print(rs.getString("statusnum"));%>','<%out.print(rs2.getString("replynum"));%>')">Reply</a><td>
	</tr>
    <tr height="10">
	<td  width="650">
    
	<input style="display:none; height:25;width:500" id="<%out.print(rs.getString("statusnum"));%>,<%out.print(rs2.getString("replynum"));%>" value=""/>
	<input type="button" style="display:none;" id="<%out.print(rs.getString("statusnum"));%>,<%out.print(rs2.getString("replynum"));%>Button" value="Submit" onclick="submitReply('<%out.print(rs.getString("statusnum"));%>','<%out.print(rs2.getString("replynum"));%>')"/>
	
    </td>
	</tr>

	<%
	}
	rs2.close();
	%>
	
	</div>
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
