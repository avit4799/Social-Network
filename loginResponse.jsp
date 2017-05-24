<%@page language="java" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.ResultSetMetaData"%>
<%
	int ok=0;
	response.setCharacterEncoding("UTF-8");
	request.setCharacterEncoding("UTF-8");
	if(session.getAttribute("login")!=null && session.getAttribute("login").equals("ok")){
		ok=1;
	}
	
	else if(request.getParameter("email")!=null && request.getParameter("passwd")!=null){
		String email=request.getParameter("email");
		String passwd=request.getParameter("passwd");

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
		String sql = "SELECT passwd FROM `working`.`user` where email='"+email+"' LIMIT 1";

		//取得结果
		ResultSet rs = stmt.executeQuery(sql);
		if (rs.next()){
			if (rs.getString("passwd").equals(passwd)){
				ok=1;
				session.setAttribute("login","ok");
				session.setAttribute("email",email);
				session.setMaxInactiveInterval(-1);
			}
		}
		
		/** 关闭连接 **/
		conn.close();
		stmt.close();
		rs.close();
	}
if (ok==1){
	String content=0+";URL="+"main.jsp";
	response.setHeader("REFRESH",content); 
}else{
	out.println("用户名或密码错误！");
	String content=2+";URL="+"login.jsp";
	response.setHeader("REFRESH",content); 
}
%>