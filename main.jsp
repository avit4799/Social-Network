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
	<title>简易社交网络</title>
	<meta http-equiv="content-Type" content="text/html;charset=UTF-8"> 
	<style>
		.input_detail {
			width:500px;
			height: 80px;
			border: 1px solid #ccc;
			border-left-color: #9a9a9a;
			border-top-color: #9a9a9a;
			outline: none;
			word-wrap: break-word;
			font-size: 18px;
			overflow:auto;
		}
		.comment{
			border-style: dashed; 
			border-width: 1px 0px 0px 0px; 
			border-color: "#202020";
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
				alert("请输入内容！");
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
				alert("请输入内容！");
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
    <a href="myFriends.jsp">我的关注</a>
    </td>
    <td style="width:100">
    <a href="personalInfo.jsp">个人资料</a>
    </td>
	<td style="width:500">
	<form action="search.jsp" method="post">
		<input type="text" name="searchName" maxlength="20" style="width:120"/>
		<input type="submit" value="查找好友" />
		<input type="button" value="退出登录" onclick="location.href='logout.jsp'" />
	</form>
	</td>
	</tr>
	</table>
	</div>
	<hr width="700" align="center"/>
	<div align="center">
	<font size="4">此刻的状态：</font>
	<TEXTAREA type="text" id="statement"  rows=4 cols=15 class="input_detail"></TEXTAREA>
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
	<hr width="700"/>
	<table bgcolor="">
	<tr height="10">
	<td  width="500"><font size="4" color="black"><a href="view.jsp?email=<%out.print(rs.getString("email"));%>"><%out.print(rs.getString("username"));%></a>:</font>
	</td>
	</tr>
	<tr height="100">
	<td width="500"><font size="4" color="black"><%out.print(rs.getString("content"));%></font>
	</td>
	<td width="110"><font size="3" color="gray"><%out.print(rs.getString("time"));%></font>
	</td>
	<td width="40"><a href="javascript:reply('<%out.print(rs.getString("statusnum"));%>', '0')">回复</a><td>
	</tr>
    <tr height="10">
	<td  width="650">
    <div>
	<input style="display:none; height:25;width:500" id="<%out.print(rs.getString("statusnum"));%>,0" value=""/>
	<input type="button" style="display:none;" id="<%out.print(rs.getString("statusnum"));%>,0Button" value="确定" onclick="submitReply('<%out.print(rs.getString("statusnum"));%>',0)"/>
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
    <a href="view.jsp?email=<%out.print(rs2.getString("email"));%>"><%out.print(rs2.getString("username"));%></a>回复:<a href="view.jsp?email=<%out.print(rs2.getString("email2"));%>"><%out.print(rs2.getString("username2"));%></a>
    </font><font size="4" color="black"><%out.print(rs2.getString("reply"));%></font>
	</td>
	<td  class="comment" width="110"><font size="3" color="gray"><%out.print(rs2.getString("time"));%></font>
	</td>
	<td  class="comment" width="60"><a href="javascript:reply('<%out.print(rs.getString("statusnum"));%>','<%out.print(rs2.getString("replynum"));%>')">回复</a><td>
	</tr>
    <tr height="10">
	<td  width="650">
    <div>
	<input style="display:none; height:25;width:500" id="<%out.print(rs.getString("statusnum"));%>,<%out.print(rs2.getString("replynum"));%>" value=""/>
	<input type="button" style="display:none;" id="<%out.print(rs.getString("statusnum"));%>,<%out.print(rs2.getString("replynum"));%>Button" value="确定" onclick="submitReply('<%out.print(rs.getString("statusnum"));%>','<%out.print(rs2.getString("replynum"));%>')"/>
	</div>
    </td>
	</tr>
    
	<%
	}
	rs2.close();
	%>
	</table>
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