<%@tag language="java" pageEncoding="UTF-8"%>
<%@attribute name="text" required="true" type="java.lang.Boolean" %>

<% 
	if(text){
%>		
<jsp:doBody></jsp:doBody>
<% 
	}
%>
