package userlist;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

/**
 * �����������ݿ�Ĺ���
 * @author Administrator
 *
 */
public class DBTool {
	//��ȡһ������
	public static Connection conn;
	//��ȡ�����ļ��е���Ϣ
	private static Properties pro = new Properties();
	
	static{
		//��ȡ��ȡ�ļ�����
		InputStream is = DBTool.class.getResourceAsStream("/jdbcM.properties");
		try {
			//��properties�ļ��е���Ϣ��ȡ��Properties����
			pro.load(is);
		} catch (IOException e) {
			e.printStackTrace();
		}
		try {
			//����������
			Class.forName(pro.getProperty("driverClass"));
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		try {
			//��ȡ����
			conn = DriverManager.getConnection(pro.getProperty("url"),pro.getProperty("user"),pro.getProperty("password"));
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	/**
	 * �ر����ӵ���
	 */
	public static void close(){
		try {
			//�رյ���
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
