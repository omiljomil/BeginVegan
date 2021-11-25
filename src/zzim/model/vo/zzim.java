package zzim.model.vo;

public class zzim {
	private int zzim_no;
	private String userId;
	private String prod_name;
	private int price;
	private int postal;
	public zzim() {
		super();
	}
	public zzim(int zzim_no, String userId, String prod_name, int price, int postal) {
		super();
		this.zzim_no = zzim_no;
		this.userId = userId;
		this.prod_name = prod_name;
		this.price = price;
		this.postal = postal;
	}
	public int getZzim_no() {
		return zzim_no;
	}
	public void setZzim_no(int zzim_no) {
		this.zzim_no = zzim_no;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getProd_name() {
		return prod_name;
	}
	public void setProd_name(String prod_name) {
		this.prod_name = prod_name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getPostal() {
		return postal;
	}
	public void setPostal(int postal) {
		this.postal = postal;
	}
	@Override
	public String toString() {
		return "zzim [zzim_no=" + zzim_no + ", userId=" + userId + ", prod_name=" + prod_name + ", price=" + price
				+ ", postal=" + postal + "]";
	}
	
}
