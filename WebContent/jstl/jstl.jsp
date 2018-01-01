<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%--c:set 标签设置一个变量   
 scope=""属性是变量所生成的域 默认在page域中 
 --%>
<c:set var="test" scope="application"  value='${applicationScope.num+param.num+"10"}'></c:set>
<%--jstl+el表达式输出域变量中的值--%>
第一次输出<c:out value="${applicationScope.test}"></c:out>
<%-- if 语句的练习 --%>
if语句输出<c:if test="${param.operatora=='2'}"><c:set var="test" scope="application"  value='${applicationScope.num+param.num+"100"}'></c:set></c:if>

<%-- 输出域中的某个变量--%>
<c:out value="${applicationScope.test}"></c:out>
<input type="text" value="<c:if test="${param.num>10}">${param.num}</c:if>
<c:if test="${empty param.num}"></c:if>"/>

<%-- for循环迭代--%>
<c:forEach var="i" begin="1" end="10" step="1" items="">

</c:forEach>
</body>
</html>