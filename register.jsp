<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>	
		<title>系统登录</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">

		<meta http-equiv="keywords" content="social network,login">
		<meta http-equiv="description" content="This is the login page.">
		<meta http-equiv="author"content="OOPRS,shenxuchuan@pku.edu.cn"> 
		<meta http-equiv="content-Type" content="text/html;charset=UTF-8"> 
<style type="text/CSS">
</style>
</head>
	<body bgcolor="papayawhip">
	<div align="center" class="style1 style2">用 户 注 册
	</div>
	<center>
	<form action="registerResponse.jsp" method="post">
		<table border="2" bordercolor="black" bgcolor="">
			<tbody>
			<tr>
				<td height="28">用户名</td>
				<td><input type="text" name="userID" maxlength="20" style="width:150"></td>
			</tr>
			<tr>
				<td height="28">密码</td>
				<td><input type="text" name="passwd" maxlength="20" style="width:150"></td>
			</tr>
			<tr>
				<td height="28">姓名</td>
				<td><input type="text" name="userName" maxlength="20" style="width:150"></td>
			</tr>
			<tr>
				<td height="28">性别</td>
				<td>
				男<input type="radio" name="sex" checked="selected" value="男" />&nbsp;
				女<input type="radio" name="sex" value="女" />
				</td>
			</tr>
			<tr>
				<td height="28">出生年月</td>
				<td>
				<SELECT onclick="onSelect(this)" name="birthYear">
				<%
					for (int i=1900;i<=2014;i++){
						%><option value=<%=i%>><%=i%></option><%
					}
				%>
				</SELECT>
				<SELECT onclick="onSelect(this)" name="birthMonth">
				<%
					for (int i=1;i<=12;i++){
						%><option value=<%=i%>><%=i%></option><%
					}
				%>
				</SELECT>
				</td>
			</tr>
			</tbody>
		</table>
	<input type="submit" value="注册" >&nbsp;&nbsp; 
	<input type="button" value="返回" onclick="location.href='login.htm'">
	</form>
	</center>
	</body>
</html>