package cart.model.vo;

import java.sql.Date;

public class Order {
	private String userId;
	private int orderType;
	private String orderNo;
	private String prodName;
	private int price;
	private String receiver;
	private int postal;
	private String address;
	private String deAddress;
	private String normalPhone;
	private String phone;
	private String message;
	private Date enrollDate;
	private int amount;
	private int prodNo;
	
	public Order() {}
	
	
	
	public Order(String userId, int orderType, String orderNo, String prodName, int price, String receiver, int postal,
			String address, String deAddress, String normalPhone, String phone, String message, Date enrollDate,
			int amount, int prodNo) {
		super();
		this.userId = userId;
		this.orderType = orderType;
		this.orderNo = orderNo;
		this.prodName = prodName;
		this.price = price;
		this.receiver = receiver;
		this.postal = postal;
		this.address = address;
		this.deAddress = deAddress;
		this.normalPhone = normalPhone;
		this.phone = phone;
		this.message = message;
		this.enrollDate = enrollDate;
		this.amount = amount;
		this.prodNo = prodNo;
	}


	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getOrderType() {
		return orderType;
	}
	public void setOrderType(int orderType) {
		this.orderType = orderType;
	}
	public String getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}
	public String getProdName() {
		return prodName;
	}
	public void setProdName(String prodName) {
		this.prodName = prodName;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	public int getPostal() {
		return postal;
	}
	public void setPostal(int postal) {
		this.postal = postal;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getDeAddress() {
		return deAddress;
	}
	public void setDeAddress(String deAddress) {
		this.deAddress = deAddress;
	}
	public String getNormalPhone() {
		return normalPhone;
	}
	public void setNormalPhone(String normalPhone) {
		this.normalPhone = normalPhone;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public Date getEnrollDate() {
		return enrollDate;
	}
	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	
	
	public int getProdNo() {
		return prodNo;
	}



	public void setProdNo(int prodNo) {
		this.prodNo = prodNo;
	}



	@Override
	public String toString() {
		return "Order [userId=" + userId + ", orderType=" + orderType + ", orderNo=" + orderNo + ", prodName="
				+ prodName + ", price=" + price + ", receiver=" + receiver + ", postal=" + postal + ", address="
				+ address + ", deAddress=" + deAddress + ", normalPhone=" + normalPhone + ", phone=" + phone
				+ ", message=" + message + ", enrollDate=" + enrollDate + ", amount=" + amount + ", prodNo=" + prodNo
				+ "]";
	}




}
