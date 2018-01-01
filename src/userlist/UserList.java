package userlist;

import java.util.List;

public class UserList {
	public UserList() {}
	public String getUserList(){
		StringBuilder sb = new StringBuilder();
		sb.append("<table style=\"width:100%\" border=1\">"+
		   		"<tr>"+
		   			"<th>显示图片</th><th>商品名称</th><th>商品单价</th><th>商品位置</th><th>数量</th>"+
		   		"</tr>");	

		GoodsDao goodsDao = new GoodsDao();
		List<Goods> goodsList = goodsDao.getGoodsList();
		for(Goods goods : goodsList){
		String id = goods.getId();
		String img = goods.getImagepath();
		String gname = goods.getGname();
		double price = goods.getPrice();
		String stock = goods.getStock();
		sb.append("<tr>"+
				"<td><img  src=\""+img+"\"/></td><td>"+gname+"</td><td>"+price+"</td><td>"+stock+"</td><td><input type=\"button\" value=\"加入购物车\" onclick=\"window.location='MyShopCart?add="+id+"'\"/></td>"+
			"</tr>");	
		}
		
		sb.append("</table>");
		return sb.toString();
	}
}
