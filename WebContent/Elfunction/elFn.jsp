<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%--contains 是否存在一个变量--%>
${fn:contains("aaa","a")}
<%--containsIgnoreCase 是否存在一个变量（忽略大小写）--%>
${fn:containsIgnoreCase("aaa","a")}

<%--fn:endsWith 以什么结尾--%>
${fn:endsWith("bca","a")}

<%--fn:startsWith 以什么结尾--%>
${fn:startsWith("acb","a")}

<%--indexOf 是否存在某个字符或字符串--%>
${fn:indexOf("acb","a")}

<%--length 某个对象的长度（字符长度）--%>
${fn:length("acbAAAA哈哈")}


<%--substring截取某个字符长度返回一个新字符--%>
${fn:substring("acbAAAA哈哈",0,3)}

<%--substringAfter第一次出现a的位置开始截取--%>
${fn:substringAfter("acbAAAA哈哈","a")}

<%--substringBefore最后一个出现‘c’的位置开始截取--%>
${fn:substringBefore("bcbAAcAAa","c")}


<%--toLowerCase转换为小写--%>
${fn:toLowerCase("bcbAAcAAa")}

<%--toUpperCase转换为大写--%>
${fn:toUpperCase("bcbAAcAAa")}

<%--trim转换为大写--%>
${fn:trim("   bcbAAcAAa   ")}

<%--split以某个字符切分为一个数组     （数组的类型[Ljava.lang.String;@67cc9a9a ）--%>
${fn:split("1,2,3,45,6",",")}

<%--join给每个数组中的元素拼接一个字符--%>
${fn:join((fn:split("1,2,3,45,6",",")),"haha")}

<%--  escapeXml将某个标签已字符串格式输出整个标签  --%>
${fn:escapeXml("<h1>哈哈<h1>")}

<%-- 与c标签库中的out标签中的 c:out标签的escapeXml属性相同 --%>
<c:out escapeXml="true" value="<h1>哈哈<h1>"></c:out>
</body>
</html>