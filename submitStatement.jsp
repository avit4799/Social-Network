<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%@page import="java.util.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.ResultSetMetaData"%>
<%@ page import="java.text.*"%> 
<%
	int ok=0;
    	response.setCharacterEncoding("UTF-8");
    	request.setCharacterEncoding("UTF-8");
	if(request.getParameter("words")!=null){
		String content= java.net.URLDecoder.decode(request.getParameter("words"),"UTF-8");//获取请求参数  
		String email=(String)session.getAttribute("email");
		String time=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime()); 

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
		String sql = "INSERT INTO  `working`.`status` (email,time,content) VALUES ('"+email+"','"+time+"','"+content+"')";
		System.out.println("submitStatement.jsp");
		System.out.println(sql);
		out.println(sql);
		//取得结果
		stmt.execute(sql);
		/** 关闭连接 **/
		conn.close();
		stmt.close();
	}
	
%>
<body>
<head>
<meta http-equiv="content-Type" content="text/html;charset=UTF-8"> 
</head>
</body>