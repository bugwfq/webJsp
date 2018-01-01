<%@ tag language="java" pageEncoding="UTF-8"%>
<%@attribute name="var" type="java.lang.String" %>
<%@attribute name="items" type="java.lang.Object"%>
<%@tag import="java.util.Collection"%>
<%
if(items instanceof Collection){
	Collection coll=(Collection)items;
	for(Object temp:coll){
		request.setAttribute(var, temp);
		%>
		<jsp:doBody></jsp:doBody>
		<%
	}
}else if(items.getClass().getName().startsWith("[")){
	
}

%>
