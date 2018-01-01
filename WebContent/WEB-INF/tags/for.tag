<%@ tag language="java" pageEncoding="UTF-8"%>
<%@attribute name="var" type="java.lang.String"%>
<%@attribute name="begin" type="java.lang.Integer" %>
<%@attribute name="end" type="java.lang.Integer" %>
<%@attribute name="step" type="java.lang.Integer"%>
<%
	for(int i = begin ; i<=end;i+=step){
		request.setAttribute(var, i);
%>
<jsp:doBody></jsp:doBody>
<%
	}
%>