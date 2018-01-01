<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 <html>
     <meta name="content-type" content="text/html; charset=UTF-8">
     <head>
         <title>Calculator</title>
         
         <!--将按键内容以字符串形式存储在文字框中当按钮为“=”时，调用eval方法计算结果然后将结果输出文字框中-->
 
 <script type="text/javascript">
     function onclicknum(nums) {
    	 var str = document.getElementById("nummessege");
         str.value = str.value + nums;
 
     }
 
     function onclickclear() {
    	 window.location.href="Calculator.jsp?clear=true"; 
     }
     function onclickresult(operatora) {
    	 var str = document.getElementById("nummessege");
    	 window.location.href="Calculator.jsp?operatora="+operatora+"&num="+str.value; 
     }
    
 </script>
     </head>

     <body bgcolor="affff" >
     <jsp:useBean id="result" class="calculator.Result" scope="application"></jsp:useBean>
	<jsp:setProperty name="result" property="num" value="${param.operatora=='1'?(applicationScope.result.num+param.num):(param.operatora=='2'?(empty applicationScope.result.num  ?param.num:applicationScope.result.num-param.num):(param.operatora=='3'?(applicationScope.result.num*param.num):(param.operatora=='4'?(applicationScope.result.num/param.num):(param.clear=='true' ? '':applicationScope.result.num))))}"/>
	<jsp:setProperty name="result" property="operatora" value="${param.operatora !='5'?(param.clear=='true' ? '':param.operatora):(applicationScope.result.operatora)}"/>
	对象数字${applicationScope.result.num}
	参数数字${param.num}
	
	对象符号${applicationScope.result.operatora}
	参数符号${param.operatora}
     <!--定义按键表格,每个按键对应一个事件触发-->
         <table border="1" align="center" bgColor="#bbff77"
             style="height: 350px; width: 270px">
             <tr>
                 <td colspan="4">
                     <input type="text" id="nummessege"
                         style="height: 90px; width: 350px; font-size: 50px" 
                      value="${param.operatora!='5' ? (param.clear=='true' ? '':'') : applicationScope.result.operatora=='1'?(applicationScope.result.num+param.num):(applicationScope.result.operatora=='2'?(applicationScope.result.num-param.num):(applicationScope.result.operatora=='3'?(applicationScope.result.num*param.num):(applicationScope.result.operatora=='4'?(applicationScope.result.num/param.num):((applicationScope.result.num)))))}"  
                      />
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