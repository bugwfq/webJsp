<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<jsp:useBean id="good" class="userlist.GoodsDao" scope="page"></jsp:useBean>
	<table style="width:100%" border=1>
		<tr>
			<th>显示图片</th><th>商品名称</th><th>商品单价</th><th>商品位置</th><th>数量</th>
		</tr>
		<c:forEach var="g" items="${pageScope.good.goodsMapList}">
			<tr>
				<td><img src="${g.IMAGEPATH}"/></td>
				<td><c:out value="${g.GNAME}"></c:out></td>
				<td><c:out value="${g.PRICE}"></c:out></td>
				<td><c:out value="${g.STOCK}"></c:out></td>
				<td><input type="button" value="加入购物车" onclick="window.location='MyShopCart?add=${g.ID}'"/></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>