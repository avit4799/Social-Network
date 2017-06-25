<%@page language="java" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.ResultSetMetaData"%>
<%
	int ok=0;
	request.setCharacterEncoding("UTF-8");
    	response.setCharacterEncoding("UTF-8");
	if(request.getParameter("email")!=null)
	if(request.getParameter("passwd")!=null)
	if(request.getParameter("username")!=null){
		String email=request.getParameter("email");
		String passwd=request.getParameter("passwd");
		String username= java.net.URLDecoder.decode(request.getParameter("username"),"UTF-8");//获取请求参数
		String sex=request.getParameter("sex");
		String birthYear=request.getParameter("year");
		String birthMonth=request.getParameter("month");
        String birthDay=request.getParameter("day");

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

		//要执行的 sql 查询
		String sql = "SELECT * FROM `working`.`user` where email='"+email+"' LIMIT 1";
		//取得结果
		ResultSet rs = stmt.executeQuery(sql);
		if (!rs.next()){
			sql = "INSERT INTO `working`.`user` (email, passwd, username) VALUES('"+email+"','"+passwd+"','"+username +"')";
			System.out.println(sql);
			stmt.execute(sql);
            sql = "INSERT INTO `working`.`userdetail` (email, sex, year, month, day) VALUES ('"+email+"','"+sex+"',"+birthYear+","+birthMonth+","+birthDay+")";
            System.out.println(sql);
			stmt.execute(sql);
			ok=1;
		}
		/** 关闭连接 **/
		conn.close();
		stmt.close();
		rs.close();
	}
%>

<body style="background:url(frog.gif) no-repeat fixed center">
<%
if (ok==1){
	out.println("<p>You've successfully signed up!</p>");
	out.println("<p>Back to <a href=\"login.jsp\">Sign in</a> webpage after 5 secs...</p>");
	String content=5+";URL="+"login.jsp";
	response.setHeader("REFRESH",content);
}else{
	out.println("<p>This email has been already used!</p>");
	out.println("<p>Back to <a href=\"register.jsp\">Sign up</a> webpage after 5 secs...</p>");
	String content=5+";URL="+"register.jsp";
	response.setHeader("REFRESH",content);
}
%>
</body>
