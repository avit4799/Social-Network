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
	String targetEmail=(String)request.getParameter("email");
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


	//申明～？
	Statement stmt2 = conn.createStatement();

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
		body{
			word-wrap:break-word; word-break:break-all;
			text-decoration:none;
		}
		
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
  --bg: url(background3.jpeg);
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
  --bg: url(background3.jpeg);
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
		
	
		.comment{
			border-style: dashed;
			border-width: 1px 0px 0px 0px;
			border-color: "#202020";
		}
	</style>
	<SCRIPT type="text/javascript">
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

<body >
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
	
<section class="blur-container blur-8 justify-content-center align-items-center" style="height:80px">
	<div style="position:absolute;top:6px;left:750px;height:63px;min-width:350px;" class="blur-box">
   
	<%
	sql= "SELECT * FROM `working`.`user` as a, `working`.`userdetail` as b where a.email='"+targetEmail+"' and a.email=b.email";
	System.out.println(sql);

	//取得结果
	String targetName=null;
	rs = stmt.executeQuery(sql);
	if (rs.next()){
		targetName=rs.getString("username");
		out.print(targetName+"</br>");
		out.print("&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp Gender: "+rs.getString("sex")+"</br>");
		out.print("&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp Date of birth: "+rs.getString("year")+"/");
		out.print(rs.getString("month")+"/");
        	out.print(rs.getString("day"));
	}%>		
  </div> 
</section>

	<%
	sql= "SELECT statusnum,time,content "
		+				"FROM `working`.`status` "
		+	"where email='"+ targetEmail+"' "
	+"order by time desc "
	+"limit 0,50;";

	//取得结果
	rs = stmt.executeQuery(sql);
	while (rs.next()){
	%>
	
	<div align="center">
	<hr width="1000"/>
	<table bgcolor="">
		<tr height="">
	    <td  width="500">
	    	<a style="display:block;width:160px ;color:#FFFFFF;background:url(background3.jpeg) no-repeat fixed ;
	    		text-align:center;text-decoration:none;padding:4px;font-weight:bold;"
	    		 href="view.jsp?email=<%out.print(targetEmail);%>"><%out.print(targetName);%></a>
	    </td>
	  </tr>
	<tr height="100">
	<td width="500"><font size="5" color="black"><%out.print(rs.getString("content"));%></font>
	</td>
	<td width="110"><font size="3" color="gray"><%out.print(rs.getString("time"));%></font>
	</td>
	<td width="60"><a style="text-decoration:none;font-weight:bold;" href="javascript:reply('<%out.print(rs.getString("statusnum"));%>', '0')">Reply</a></td>
	</tr>
  <tr height="10">
	  <td  width="650">
    <div>
	<input style="display:none; height:25;width:500" id="<%out.print(rs.getString("statusnum"));%>,0" value=""/>
	<input type="button" style="display:none;" id="<%out.print(rs.getString("statusnum"));%>,0Button" value="Submit" onclick="submitReply('<%out.print(rs.getString("statusnum"));%>',0)"/>
	</div>
    </td>
	</tr>
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
	
	<tr height="">

	<td class="comment" width="500"><font size="3" color="black">
    <a href="view.jsp?email=<%out.print(rs2.getString("email"));%>"><%out.print(rs2.getString("username"));%></a>Replies:<a href="view.jsp?email=<%out.print(rs2.getString("email2"));%>"><%out.print(rs2.getString("username2"));%></a>
    </font><font size="4" color="black"><%out.print(rs2.getString("reply"));%></font>
	</td>
	<td  class="comment" width="110"><font size="3" color="gray"><%out.print(rs2.getString("time"));%></font>
	</td>
	<td  class="comment" width="60"><a href="javascript:reply('<%out.print(rs.getString("statusnum"));%>','<%out.print(rs2.getString("replynum"));%>')">Reply</a></td>
	</tr>
    <tr height="10">
	  <td  width="650">
    <div>
	    <input style="display:none; height:25;width:500" id="<%out.print(rs.getString("statusnum"));%>,<%out.print(rs2.getString("replynum"));%>" value=""/>
	    <input type="button" style="display:none;" id="<%out.print(rs.getString("statusnum"));%>,<%out.print(rs2.getString("replynum"));%>Button" value="Submit" onclick="submitReply('<%out.print(rs.getString("statusnum"));%>','<%out.print(rs2.getString("replynum"));%>')"/>
   	</div>
    </td>
	  </tr>

	<%
	}
	rs2.close();
	%>
	</table>
	<hr width="1000"/>
	<section class="blur-container blur-8 justify-content-center align-items-center" style="height:80px">
	</section>
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
