package User.model.vo;

public class Shpping {
	private int ship_no;
	private String user_id;
	private int postal_code;
	private String address;
	private String de_address;
	private String alias;
	private String basics;
	private String recipient;
	private String sp_phone;
	public Shpping() {
		super();
	}
	
	public Shpping(int ship_no, String user_id, int postal_code, String address, String de_address, String alias,
			String basics, String recipient, String sp_phone) {
		super();
		this.ship_no = ship_no;
		this.user_id = user_id;
		this.postal_code = postal_code;
		this.address = address;
		this.de_address = de_address;
		this.alias = alias;
		this.basics = basics;
		this.recipient = recipient;
		this.sp_phone = sp_phone;
	}

	public int getShip_no() {
		return ship_no;
	}
	public void setShip_no(int ship_no) {
		this.ship_no = ship_no;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getPostal_code() {
		return postal_code;
	}
	public void setPostal_code(int postal_code) {
		this.postal_code = postal_code;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getDe_address() {
		return de_address;
	}
	public void setDe_address(String de_address) {
		this.de_address = de_address;
	}
	public String getAlias() {
		return alias;
	}
	public void setAlias(String alias) {
		this.alias = alias;
	}
	public String getBasics() {
		return basics;
	}
	public void setBasics(String basics) {
		this.basics = basics;
	}
	public String getRecipient() {
		return recipient;
	}
	public void setRecipient(String recipient) {
		this.recipient = recipient;
	}
	public String getSp_phone() {
		return sp_phone;
	}
	public void setSp_phone(String sp_phone) {
		this.sp_phone = sp_phone;
	}
	@Override
	public String toString() {
		return "Shpping [ship_no=" + ship_no + ", user_id=" + user_id + ", postal_code=" + postal_code + ", address="
				+ address + ", de_address=" + de_address + ", alias=" + alias + ", basics=" + basics + ", recipient="
				+ recipient + ", sp_phone=" + sp_phone + "]";
	}
	
	
	
	
}
