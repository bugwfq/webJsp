<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<% pageContext.setAttribute("id", "100"); %>
<%-- 简单的EL表达式获取值 （只能获取域中的值） --%>
${id}
<%-- EL表达式简单的逻辑 --%>
<%-- 获取请求中的参数 --%>
${param.name}

${empty param.name ? "-" : "hahah"}
哈哈${result.num+'10'} <br/>
<jsp:useBean id="result" class="calculator.Result" scope="application">
<jsp:setProperty name="result" property="num" value="${result.num+param.wang}"/>
</jsp:useBean>
${applicationScope.result.num}

<%--  测试变量的创建  --%>

</body>
</html>