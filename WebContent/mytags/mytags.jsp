<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%--自定义if标签 --%>
<my:if text="${1==1}">
<%--自定义out标签 --%>
	<my:out value="<h1>哈哈哈</h1>"></my:out>
</my:if>

<%-- 自定义for循环 --%>
<my:for var="i" begin="1" end="10" step="1">
${requestScope.i}<br/>
</my:for>
<%--自定义 forEach  --%>
<%
List list1 = new ArrayList();
list1.add("wangfuqiang");
list1.add("huogai");
list1.add("zizuozishou");
request.setAttribute("list", list1);
%>
<my:forEach var="map" items="${requestScope.list}">
<my:out value="${requestScope.map}"></my:out>
</my:forEach>

</body>
</html>