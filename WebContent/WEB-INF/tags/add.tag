<%@ tag language="java" pageEncoding="UTF-8"%>
<%@attribute name="num1" type="java.lang.Integer"%>
<%@attribute name="num2" type="java.lang.Integer"%>
<%
if(num1 != null && num2!=null){
 %>
 <%=num1+num2%>
 <%
}
%>