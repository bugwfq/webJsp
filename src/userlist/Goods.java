package userlist;
/**
 * ��Ʒʵ����
 * @author Administrator
 *
 */
public class Goods {
	private String id;//��Ʒid
	private String gname;//��Ʒ����
	private String model;//��Ʒ����
	private String stock;//���ڵ�
	private double price;//����
	private String imagepath;//ͼƬ·��
	private String descp;//��Ʒ��ע
	public Goods() {}
	public Goods(String id, String gname, String model, String stock,
			double price, String imagepath, String descp) {
		super();
		this.id = id;
		this.gname = gname;
		this.model = model;
		this.stock = stock;
		this.price = price;
		this.imagepath = imagepath;
		this.descp = descp;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getGname() {
		return gname;
	}
	public void setGname(String gname) {
		this.gname = gname;
	}
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
	public String getStock() {
		return stock;
	}
	public void setStock(String stock) {
		this.stock = stock;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getImagepath() {
		return imagepath;
	}
	public void setImagepath(String imagepath) {
		this.imagepath = imagepath;
	}
	public String getDescp() {
		return descp;
	}
	public void setDescp(String descp) {
		this.descp = descp;
	}
	
}
