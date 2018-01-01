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
	 * ���ݴ����id���ز�ѯ����������Ʒ��Ϣ
	 * �ɴ���һ���Ͷ��������Ƕ���ɴ���һ������
	 * @param id һ��id��һ��id����
	 * @return
	 */
	public List<Goods> getGoodsList(){
		List<Goods> goodsList = new LinkedList<Goods>();
		//��ѯ��sql���
		String sql = "select * from goods ";
		
		try {
			//����ִ��Ԥ����sql ���
			PreparedStatement ps =  DBTool.conn.prepareStatement(sql.toString());
			//�����Ӧ��name
			//����һ���α�����
			ResultSet rs = ps.executeQuery();
			//��������
			while(rs.next()){
				//�洢����ı���
				Goods goods = new Goods(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getDouble(5),rs.getString(6),rs.getString(7));
				//��ӵ�map������
				goodsMap.put(goods.getId(), goods);
				//��ӵ����ص�list������
				goodsList.add( goods);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return goodsList;
	}
	
	
	
	public List<Map<String,String>> getGoodsMapList(){
		List<Map<String,String>> goodsList = new ArrayList<Map<String,String>>();
		//��ѯ��sql���
		String sql = "select * from goods ";
		
		try {
			//����ִ��Ԥ����sql ���
			PreparedStatement ps =  DBTool.conn.prepareStatement(sql.toString());
			//�����Ӧ��name
			//����һ���α�����
			ResultSet rs = ps.executeQuery();
			//��������
			ResultSetMetaData rsm = ps.getMetaData();
			while(rs.next()){
				Map<String ,String> goods = new HashMap<String, String>();
				for(int i=1 ;i<=rsm.getColumnCount();i++){
					String columnName = rsm.getColumnName(i);
					String columnValue = rs.getString(i);
					//��ӵ�map������
					goods.put(columnName, columnValue);
				}
				//��ӵ����ص�list������
				goodsList.add( goods);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return goodsList;
	}
	/**
	 * ͨ��һ��id��ȡһ����Ʒ
	 * @param id
	 * @return
	 */
	public Goods getGoodsFromDB(String id){
		//��ѯ��sql���
		StringBuilder sql = new StringBuilder("select * from goods where id="+id);
		try {
			//����ִ��Ԥ����sql ���
			PreparedStatement ps =  DBTool.conn.prepareStatement(sql.toString());
			//����һ���α�����
			ResultSet rs = ps.executeQuery();
			//��������
			while(rs.next()){
				//�洢����ı���
				Goods goods = new Goods(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getDouble(5),rs.getString(6),rs.getString(7));
				//��ӵ�map������
				goodsMap.put(goods.getId(), goods);
				return goods;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	
	/**
	 * ������Ҫ�ֳ���ҳ����ÿҳ��ʾ����������һ��list����
	 * @param staPage  �ڼ�ҳ
	 * @param linage   ÿҳ��ʾ����
	 * @return
	 */
	public List<Goods> getPagingGoods(int staPage,int linage){
		List<Goods> goodsList = new LinkedList<Goods>();
		//��ȡ��Ʒ��Ϣ
		Set<String> keys = goodsMap.keySet();
		//�������е�0id
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
		
		//�ж��Ƿ�����Ʒ
		if(goodsList.size()==0){
			//�������hashMap����ȥ���ݿ����
			goodsList = getGoodsPagingFromDB(staPage, linage);
		}
		return goodsList;
	}
	
	
	
	/**
	 * ������Ҫ�ֳ���ҳ����ÿҳ��ʾ�����������ݿ��в��ҷ���һ��list����
	 * @param staPage  �ڼ�ҳ
	 * @param linage   ÿҳ��ʾ����
	 * @return
	 */
	public List<Goods> getGoodsPagingFromDB(int staPage,int linage){
		List<Goods> goodsList = new LinkedList<Goods>();
		//��ѯ��sql���
		String sql = "select * from goods limit ?,?";
		
		try {
			//����ִ��Ԥ����sql ���
			PreparedStatement ps =  DBTool.conn.prepareStatement(sql.toString());
			//�����Ӧ�ķ�ҳֵ
			int start = (staPage-1)*linage;
			int end = (staPage*linage);
			ps.setInt(1, start);
			ps.setInt(2, end);
			//����һ���α�����
			ResultSet rs = ps.executeQuery();
			//��������
			while(rs.next()){
				//�洢����ı���
				Goods goods = new Goods(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getDouble(5),rs.getString(6),rs.getString(7));
				//��ӵ�map������
				goodsMap.put(goods.getId(), goods);
				//��ӵ����ص�list������
				goodsList.add( goods);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return goodsList;
	}
}
