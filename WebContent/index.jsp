<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- <%= %>相当于Servlet中的  out.print(); 输出--%>
<%="hello" %>    <%	
					out.print(" world！");
					%>

<%--
	jsp的本质其实是Servlet只是已html的格式编写最后由容器转译为Servlet 
	
	所以<%! %>  相当于直接在类中定义可以定义方法和成员变量
	例如：<%! 
			public int add(int a,int b){
				return a+b;
			}
		%>

--%>
		<%! 
			public int add(int a,int b){
				return a+b;
			}
		%>
		<% 
			int a = 10;
			int b = 20;
		%>
		
			<%=add(a,b) %>
			<br/>
			
	<%--  九九乘法表  --%>
		<%for(int i =1; i<10;i++){for(int j=1;j<=i;j++){%>
		<%=j+"*"+i+"="+(i*j)+" "%>
		<%}%>
		<br/>
		<%}%>
	
		<%--  打印  1-100的质数    --%>
		<%for(int i =2; i<1000;i++){ boolean bool = false;for(int j=2;j<i;j++){ if(i%j==0){bool = true; break;}}if(bool){continue;}%>
		<%=i+" "%><%}%>
		
		

</body>
</html>