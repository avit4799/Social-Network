<%@page language="java" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.ResultSetMetaData"%>
<%
	int ok=0;
	request.setCharacterEncoding("UTF-8");
    	response.setCharacterEncoding("UTF-8");
        String username = null;
        if(request.getParameter("username")!=null)
            username= java.net.URLDecoder.decode(request.getParameter("username"),"UTF-8");//获取请求参数
		String sex=request.getParameter("sex");
		String year=request.getParameter("year");
		String month=request.getParameter("month");
        String day=request.getParameter("day");
        String introduction = null;
        if(request.getParameter("introduction")!=null)
            introduction=java.net.URLDecoder.decode(request.getParameter("introduction"),"UTF-8");
        String icon=request.getParameter("icon");
        System.out.println(icon);
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
        String sql = null;

        if(username!=null && username != ""){
            sql = "UPDATE `working`.`user` SET username = '"+username +"' WHERE email = '" + email +"'";
			System.out.println(sql);
			stmt.execute(sql);
        }
        if(sex!=null){
            sql = "UPDATE `working`.`userdetail` SET sex = '"+sex +"' WHERE email = '" + email +"'";
			System.out.println(sql);
			stmt.execute(sql);
        }
        if(year!=null){
            sql = "UPDATE `working`.`userdetail` SET year = '"+year +"' WHERE email = '" + email +"'";
			System.out.println(sql);
			stmt.execute(sql);
        }
        if(month!=null){
            sql = "UPDATE `working`.`userdetail` SET month = '"+month +"' WHERE email = '" + email +"'";
			System.out.println(sql);
			stmt.execute(sql);
        }
        if(day!=null){
            sql = "UPDATE `working`.`userdetail` SET day = '"+day +"' WHERE email = '" + email +"'";
			System.out.println(sql);
			stmt.execute(sql);
        }
        if(introduction!=null && introduction != ""){
            sql = "UPDATE `working`.`userdetail` SET introduction = '"+introduction +"' WHERE email = '" + email +"'";
			System.out.println(sql);
			stmt.execute(sql);
        }
        if(icon!=null && icon != ""){
            sql = "UPDATE `working`.`userdetail` SET icon = '"+icon +"' WHERE email = '" + email +"'";
			System.out.println(sql);
			stmt.execute(sql);
        }

        ok=1;

		/** 关闭连接 **/
		conn.close();
		stmt.close();

%>

<body>
<%
if (ok==1){
	out.println("<p>You've successfully changed profile.</p>");
	out.println("<p>Back to <a href=\"main.jsp\">Homepage</a> after 5 secs...</p>");
	String content=5+";URL="+"main.jsp";
	response.setHeader("REFRESH",content);
}else{
	out.println("<p>Unknown error.</p>");
	out.println("<p>Back to <a href=\"main.jsp\">Homepage</a> after 5 secs...</p>");
	String content=5+";URL="+"main.jsp";
	response.setHeader("REFRESH",content);
}
%>
</body>
