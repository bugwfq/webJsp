package userlist;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

/**
 * 用于连接数据库的工具
 * @author Administrator
 *
 */
public class DBTool {
	//获取一个链接
	public static Connection conn;
	//读取配置文件中的信息
	private static Properties pro = new Properties();
	
	static{
		//获取读取文件的流
		InputStream is = DBTool.class.getResourceAsStream("/jdbcM.properties");
		try {
			//将properties文件中的信息获取到Properties类中
			pro.load(is);
		} catch (IOException e) {
			e.printStackTrace();
		}
		try {
			//加载驱动类
			Class.forName(pro.getProperty("driverClass"));
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		try {
			//获取连接
			conn = DriverManager.getConnection(pro.getProperty("url"),pro.getProperty("user"),pro.getProperty("password"));
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	/**
	 * 关闭连接的流
	 */
	public static void close(){
		try {
			//关闭的流
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
