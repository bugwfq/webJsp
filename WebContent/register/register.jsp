<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta  http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
	body{padding: 0px;margin: 0px;}
#header{width: auto;min-height: 70px;line-height: 70px;}
#header{border-bottom: medium solid #39A631;}
span.title_con{font-family:"微软雅黑";font-style: normal;font-size: 2em;font-weight:800 ;color: #39A631;padding-left: 1em;}
#content{width: auto;height:28em;text-align: center;background-image: url(../img/hovertree_login_bg.jpg);background-size: 100% 100%;}
#footer{width: auto;min-height: 60px;line-height:60px;text-align:center;font-family:Arial, Helvetica, sans-serif;margin-top: 195px;}
#footer{border-top: thin solid #39A631;}#footer a{color:black;}
.con{width: 35%;height: 20em;margin-top:4em;min-width:260px; padding-bottom: 302px;}
.con{border: thin solid #8EC172;}
.con_title{background-color: #8EC172;width: auto;height: 2.5em;line-height: 2.5em;text-align: center;min-width:260px;}
.con_title_sp{font-family: "微软雅黑";font-size: 1.5em;font-weight: 800;color: #FFF;}
.con_input{margin: 2em 0 1em 0;}
.submit-btn{width: 8em;height: 2em;background-color: #62ab00;border-radius: 4px;border: 0px;color: #fff;font-family:"微软雅黑";font-size: 1em;font-weight: bold;}
.con_input span{font-family: "微软雅黑";font-size: 1em;font-weight: bold;color: #333;}
.con_input input{width: 15em;padding: 0.5em 1em;border: 1px solid #bbb;}
.submit-btn{margin: 1em 0 1em 0;}
</style>
<title>易通软件教育</title><base target="_blank" />
<script type="text/javascript">
	function checkForm() {
		var username = document.getElementsByName("username")[0].value;
		if (username == null || username == "") {
			alert("用户名不能为空");
			return;
		}
		var password = document.getElementsByName("password")[0].value;
		var password2 = document.getElementsByName("password2")[0].value;
		if(password!=password2){
			alert("两次密码不一致");
			return;
		}
		
		
		var telephone = document.getElementsByName("telephone")[0].value;
		var regex = /^[0-9]{11}$/;
		if (!regex.test(telephone)) {
			alert("请输入11位的数字");
			return;
		}
		
		var email = document.getElementsByName("email")[0].value;
		var regex = /^\w{4,}@[a-zA-Z]+\.[a-zA-Z]+$/;
		if (!regex.test(email)) {
			alert("请输入正确邮箱");
			return;
		}
		
		var url = document.getElementsByName("url")[0].value;
		var regex = /^http[s]?:\/{2}www\.\w+\.\w.+/;
		if (!regex.test(url)) {
			alert("请输入正确网址");
			return;
		}
		//表单中添加 
		//     邮件地址 lixin@ww.com
		//     个人网址  https|http://www.baidu.com
		
		
		document.forms[0].submit();
	}	
</script>
</head>
<body>

<div id="header">
<div class="header_title">
<span class="title_con">易通软件教育</span>
</div>
</div>

<div id="content">
<center>
<div class="con">
<div class="con_title">
<span class="con_title_sp">欢迎注册易通学工系统</span>
</div>
<div class="con_panel">
	<form action="addDataBase.jsp" method="post">
			<div class="con_input">
	
			<span>*用户名：</span><input name="username" type="text" placeholder="学号/工号"/>
			</div>
			<div class="con_input">
			<span>*密&nbsp;&nbsp;&nbsp;&nbsp;码：</span><input name="password" type="password" placeholder="密码"/>
			</div>
			<div class="con_input">
			<span>*确认密码：</span><input name="password2" type="password" placeholder="密码"/>
			</div>
			<div class="con_input">
			<span>*联系电话：</span><input name="telephone" type="text" placeholder="联系电话"/>
			</div>
			<div class="con_input">
			<span>*邮箱地址：</span><input name="email" type="text" placeholder="请输入正确邮箱地址"/>
			</div>
			<div class="con_input">
			<span>*注册日期：</span><input name="date" type="date" />
			</div>
			<div class="con_input">
			<span>个人网址：</span><input name="url" type="text" />
			</div>
			<div class="con_select">
			<input type="radio" name="position" checked="checked" id="hovertreestu" value="0" /><label for="hovertreestu">学生</label>
			<input type="radio" name="position" id="hovertreetea" value="1" /><label for="hovertreetea">教师</label>
			<input type="radio" name="position" id="hovertreeadm" value="2" /><label for="hovertreeadm">管理员</label>
			</div>
			<a href="javascript:checkForm()" class="submit-btn">&nbsp;立即注册 &nbsp;</a>
		</form>
	</div>
</div>
</center>
</div>

<div id="footer">
&copy; 加入我们：<a href="http://hovertree.com/">易通</a>
</div>

</body>
</html>