<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>系统登录</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">

		<meta http-equiv="keywords" content="social network,login">
		<meta http-equiv="description" content="This is the login page.">
		<meta http-equiv="content-Type" content="text/html;charset=UTF-8">
<style type="text/CSS">
	body{
		background-image:url('background.jpg');
		background-repeat:no-repeat;
	}
	div{
		background-color: #ffffff;
		width: 480px;
  height: 380px;
  margin:30px;
  padding:10;
   position:absolute;
   top:15%;
   left:30%;

  filter:alpha(opacity=60);
  opacity:0.6;

	}
</style>
</head>
	<body>

	<div align="center" class="style1 style2" ><b>用 户 注 册</b>

	<center>
	<form action="registerResponse.jsp" method="post">
		<table border="0" bgcolor="">
			<tbody>
			<tr>
				<td height="58">邮箱*</td>
				<td><input type="text" name="email" maxlength="30" style="width:150" required="required" pattern="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?"></td>
			</tr>
			<tr>
				<td height="58">密码*</td>
				<td><input type="password" name="passwd" minlength="6" maxlength="20" style="width:150" required="required"></td>
			</tr>
			<tr>
				<td height="58">昵称*</td>
				<td><input type="text" name="username" maxlength="20" style="width:150" required="required"></td>
			</tr>
			<tr>
				<td height="58">性别</td>
				<td>
				男<input type="radio" name="sex" value="男" />&nbsp;
				女<input type="radio" name="sex" value="女" />&nbsp;
                其他<input type="radio" name="sex" checked="selected" value="其他" />
				</td>
			</tr>
			<tr>
				<td height="58">生日</td>
				<td>
				<SELECT onclick="onSelect(this)" name="year">
				<%
					for (int i=1900;i<=2017;i++){
						%><option value=<%=i%>><%=i%></option><%
					}
				%>
				</SELECT>
				<SELECT onclick="onSelect(this)" name="month">
				<%
					for (int i=1;i<=12;i++){
						%><option value=<%=i%>><%=i%></option><%
					}
				%>
				</SELECT>
                <SELECT onclick="onSelect(this)" name="day">
				<%
					for (int i=1;i<=31;i++){
						%><option value=<%=i%>><%=i%></option><%
					}
				%>
				</SELECT>
				</td>
			</tr>
			</tbody>
		</table>
	<input type="submit" value="注册" >&nbsp;&nbsp;
	<input type="button" value="返回" onclick="location.href='login.jsp'">
	</form>
	</center>
	</div>
	</body>
</html>
