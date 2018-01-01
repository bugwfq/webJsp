package userlist;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;



public class GoodsDao {
	public Map<String,Goods> goodsMap = new HashMap<String,Goods>();
	public GoodsDao(){
	}


	/**
	 * 根据传入的id返回查询到的所有商品信息
	 * 可传入一个和多个，如果是多个可传入一个数组
	 * @param id 一个id或一个id数组
	 * @return
	 */
	public List<Goods> getGoodsList(){
		List<Goods> goodsList = new LinkedList<Goods>();
		//查询的sql语句
		String sql = "select * from goods ";
		
		try {
			//用于执行预编译sql 语句
			PreparedStatement ps =  DBTool.conn.prepareStatement(sql.toString());
			//传入对应的name
			//返回一个游标结果集
			ResultSet rs = ps.executeQuery();
			//遍历集合
			while(rs.next()){
				//存储对象的变量
				Goods goods = new Goods(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getDouble(5),rs.getString(6),rs.getString(7));
				//添加到map集合中
				goodsMap.put(goods.getId(), goods);
				//添加到返回的list集合中
				goodsList.add( goods);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return goodsList;
	}
	
	
	
	public List<Map<String,String>> getGoodsMapList(){
		List<Map<String,String>> goodsList = new ArrayList<Map<String,String>>();
		//查询的sql语句
		String sql = "select * from goods ";
		
		try {
			//用于执行预编译sql 语句
			PreparedStatement ps =  DBTool.conn.prepareStatement(sql.toString());
			//传入对应的name
			//返回一个游标结果集
			ResultSet rs = ps.executeQuery();
			//遍历集合
			ResultSetMetaData rsm = ps.getMetaData();
			while(rs.next()){
				Map<String ,String> goods = new HashMap<String, String>();
				for(int i=1 ;i<=rsm.getColumnCount();i++){
					String columnName = rsm.getColumnName(i);
					String columnValue = rs.getString(i);
					//添加到map集合中
					goods.put(columnName, columnValue);
				}
				//添加到返回的list集合中
				goodsList.add( goods);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return goodsList;
	}
	/**
	 * 通过一个id获取一个商品
	 * @param id
	 * @return
	 */
	public Goods getGoodsFromDB(String id){
		//查询的sql语句
		StringBuilder sql = new StringBuilder("select * from goods where id="+id);
		try {
			//用于执行预编译sql 语句
			PreparedStatement ps =  DBTool.conn.prepareStatement(sql.toString());
			//返回一个游标结果集
			ResultSet rs = ps.executeQuery();
			//遍历集合
			while(rs.next()){
				//存储对象的变量
				Goods goods = new Goods(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getDouble(5),rs.getString(6),rs.getString(7));
				//添加到map集合中
				goodsMap.put(goods.getId(), goods);
				return goods;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	
	/**
	 * 传入需要分出的页数和每页显示的行数返回一个list集合
	 * @param staPage  第几页
	 * @param linage   每页显示几行
	 * @return
	 */
	public List<Goods> getPagingGoods(int staPage,int linage){
		List<Goods> goodsList = new LinkedList<Goods>();
		//获取商品信息
		Set<String> keys = goodsMap.keySet();
		//遍历所有的0id
		int i = 0;
		int start = (staPage-1)*linage;
		int end = staPage*linage;
		for(Iterator<String> iter = keys.iterator();iter.hasNext();){
			String key = iter.next();
			Goods value = goodsMap.get(key);
			if(i>=start && i<=end){
				goodsList.add(value);
			}
			i++;
		}
		
		//判断是否有商品
		if(goodsList.size()==0){
			//如果不在hashMap中则去数据库查找
			goodsList = getGoodsPagingFromDB(staPage, linage);
		}
		return goodsList;
	}
	
	
	
	/**
	 * 传入需要分出的页数和每页显示的行数从数据库中查找返回一个list集合
	 * @param staPage  第几页
	 * @param linage   每页显示几行
	 * @return
	 */
	public List<Goods> getGoodsPagingFromDB(int staPage,int linage){
		List<Goods> goodsList = new LinkedList<Goods>();
		//查询的sql语句
		String sql = "select * from goods limit ?,?";
		
		try {
			//用于执行预编译sql 语句
			PreparedStatement ps =  DBTool.conn.prepareStatement(sql.toString());
			//传入对应的分页值
			int start = (staPage-1)*linage;
			int end = (staPage*linage);
			ps.setInt(1, start);
			ps.setInt(2, end);
			//返回一个游标结果集
			ResultSet rs = ps.executeQuery();
			//遍历集合
			while(rs.next()){
				//存储对象的变量
				Goods goods = new Goods(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getDouble(5),rs.getString(6),rs.getString(7));
				//添加到map集合中
				goodsMap.put(goods.getId(), goods);
				//添加到返回的list集合中
				goodsList.add( goods);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return goodsList;
	}
}
