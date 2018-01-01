<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.et.dao.ConnectionTool"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>register</title>
</head>
<body>
<%!    
	//配置连接
		public Connection conn = null;
		public void init() throws ServletException{
			try{
				//获取连接
				conn = ConnectionTool.getConnection();
			}catch(Exception e){
				System.out.println("连接失败");
			}
		}

%>
<%
	//获取输入的用户名
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	String telephone = request.getParameter("telephone");
	String email = request.getParameter("email");
	String rdate = request.getParameter("date");
	String url = request.getParameter("url");
	String position = request.getParameter("position");
	position = position.equals("0")? "学生":(position.equals("1")? "老师":"管理员");
	
	String sql = "insert into userinfo(username,password,telephone,email,rdate,url)  values(?,?,?,?,?,?)";
	PreparedStatement ps = conn.prepareStatement(sql);
	ps.setString(1, username);
	ps.setString(2, password);
	ps.setString(3, telephone);
	ps.setString(4, email);
	ps.setString(5, rdate);
	ps.setString(6, url);
	ps.execute();
	
%>
	姓名：<%= username%>
	密码：<%= password%>
	联系电话：<%= telephone%>
	邮件：<%= email%>
	注册日期：<%=rdate%>
	网址：<%=url%>
	
</body>
</html>