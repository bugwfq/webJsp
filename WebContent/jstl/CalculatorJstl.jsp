<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
       <!--将按键内容以字符串形式存储在文字框中当按钮为“=”时，调用eval方法计算结果然后将结果输出文字框中-->
 
 <script type="text/javascript">
     function onclicknum(nums) {
    	 var str = document.getElementById("nummessege");
         str.value = str.value + nums;
     }
 
     function onclickclear() {
    	 window.location.href="CalculatorJstl.jsp?clear=true"; 
     }
     function onclickresult(operatora) {
    	 var str = document.getElementById("nummessege");
    	 window.location.href="CalculatorJstl.jsp?operatora="+operatora+"&num="+str.value; 
     }
    
 </script>
 
<body bgcolor="affff" >
	<c:if test='${param.operatora=="1"}'><c:set var="num" value="${applicationScope.num+param.num}" scope="application" ></c:set></c:if>
   	<c:if test='${param.operatora=="2"}'>
   	<c:if test ="${empty applicationScope.num}"><c:set var="num" value="${param.num}" scope="application" ></c:set></c:if>
	<c:if test ="${!empty applicationScope.num}"><c:set var="num" value="${applicationScope.num-param.num}" scope="application" ></c:set></c:if> 	
   	</c:if>
   	<c:if test="${param.operatora=='3'}">
   	<c:if test ="${empty applicationScope.num}"><c:set var="num" value="${param.num}" scope="application" ></c:set></c:if>
	<c:if test ="${!empty applicationScope.num}"><c:set var="num" value="${applicationScope.num*param.num}" scope="application" ></c:set></c:if> 
   	</c:if>
   	<c:if test="${param.operatora=='4'}">
   	<c:if test ="${empty applicationScope.num}"><c:set var="num" value="${param.num}" scope="application" ></c:set></c:if>
	<c:if test ="${!empty applicationScope.num}"><c:set var="num" value="${applicationScope.num/param.num}" scope="application" ></c:set></c:if> 
   	</c:if>
   	
   		<c:choose>
			<c:when test="${param.operatora!='5'}"><c:set var="operatora" value="${param.operatora}" scope="application" ></c:set></c:when>
			<c:otherwise><c:set var="operatora" value="${applicationScope.operatora}" scope="application" ></c:set></c:otherwise>
		</c:choose>
	<c:if test="${param.clear=='true'}"><c:set var="num" value="" scope="application"></c:set></c:if>
	对象数字${applicationScope.num}
	参数数字${param.num}
	
	对象符号${applicationScope.operatora}
	参数符号${param.operatora}
     <!--定义按键表格,每个按键对应一个事件触发-->
         <table border="1" align="center" bgColor="#bbff77"
             style="height: 350px; width: 270px">
             <tr>
                 <td colspan="4">
                     <input type="text" id="nummessege" name="nummessege"
                         style="height: 90px; width: 350px; font-size: 50px" 
                      value="<c:choose><c:when test="${param.operatora!='5'}"></c:when><c:when test="${applicationScope.operatora=='1'}">${applicationScope.num+param.num}</c:when><c:when test="${applicationScope.operatora=='2'}">${applicationScope.num-param.num}</c:when><c:when test="${applicationScope.operatora=='3'}">${applicationScope.num*param.num}</c:when><c:when test="${applicationScope.operatora=='4'}">${applicationScope.num/param.num}</c:when><c:otherwise>${applicationScope.operatora}</c:otherwise></c:choose>"/>
                 </td>                
             </tr>
             <tr>
                 <td>
                     <input type="button" value="1" id="1" onclick="onclicknum(1)"
                         style="height: 70px; width: 90px; font-size: 35px">
                 </td>
 
                 <td>
                     <input type="button" value="2" id="2" onclick="onclicknum(2)"
                         style="height: 70px; width: 90px; font-size: 35px">
                 </td>
 
                 <td>
                     <input type="button" value="3" id="3" onclick="onclicknum(3)"
                         style="height: 70px; width: 90px; font-size: 35px">
                 </td>
 
                 <td>
                     <input type="button" value="+" name="operator" onclick="onclickresult(1)"
                         style="height: 70px; width: 90px; font-size: 35px">
                 </td>
             </tr>
 
             <tr>
                 <td>
                     <input type="button" value="4" id="4" onclick="onclicknum(4)"
                         style="height: 70px; width: 90px; font-size: 35px">
                 </td>
 
                 <td>
                     <input type="button" value="5" id="5" onclick="onclicknum(5)"
                         style="height: 70px; width: 90px; font-size: 35px">
                 </td>
 
                 <td>
                     <input type="button" value="6" id="6" onclick="onclicknum(6)"
                         style="height: 70px; width: 90px; font-size: 35px">
                 </td>
 
                 <td>
                     <input type="button" value="-" name="operator" onclick="onclickresult(2)"
                         style="height: 70px; width: 90px; font-size: 35px">
                 </td>
             </tr>
 
             <tr>
                 <td>
                     <input type="button" value="7" id="7" onclick="onclicknum(7)"
                         style="height: 70px; width: 90px; font-size: 35px">
                 </td>
 
                 <td>
                     <input type="button" value="8" id="8" onclick="onclicknum(8)"
                         style="height: 70px; width: 90px; font-size: 35px">
                 </td>
 
                 <td>
                     <input type="button" value="9" id="9" onclick="onclicknum(9)"
                         style="height: 70px; width: 90px; font-size: 35px">
                 </td>
 
                 <td>
                     <input type="button" value="*" name="operator" onclick="onclickresult(3)"
                         style="height: 70px; width: 90px; font-size: 35px">
                 </td>
             </tr>
 
             <tr>
                 <td colspan="2">
                     <input type="button" value="0" id="0" onclick="onclicknum(0)"
                         style="height: 70px; width: 190px; font-size: 35px">
                 </td>
                 <td>
                     <input type="button" value="." id="point" onclick="onclicknum('.')"
                         style="height: 70px; width: 90px; font-size: 35px">
                 </td>
 
                 <td>
                     <input type="button" value="/" name="operator"
                         onclick="onclickresult(4)"
                         style="height: 70px; width: 90px; font-size: 35px">
                 </td>
             </tr>
 
             <tr>
 
                 <td colspan="2">
                     <input type="button" value="Del" id="clear"
                         onclick="onclickclear()"
                         style="height: 70px; width: 190px; font-size: 35px" />
                 </td>
 
                 <td colspan="2">
                     <input type="button" value="=" name="eq"
                         onclick="onclickresult(5)"
                         style="height: 70px; width: 190px; font-size: 35px" />
                 </td>
 
 
             </tr>
 
 
         </table>
 
     </body>
 </html>