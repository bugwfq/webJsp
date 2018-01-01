<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%--设置locale --%>
<fmt:setLocale value="${requestScope.locale}"/>
<%--设置文件位置 --%>
<fmt:setBundle basename="i18n/mess"/>
<%--获取内容 --%>
<fmt:message key="userName"></fmt:message>
</body>
</html>