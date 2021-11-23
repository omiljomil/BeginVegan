package manager.model.vo;

import java.sql.Date;

public class OrderManager {
	private int orderNo;
	private String prodName;
	private int amount;
	private int orderPrice;
	private Date orderDate;
	private String userId;
	private String receiver;
//	private String address;
	private String phone;
	private String status;
	
	public OrderManager() {}

	public OrderManager(int orderNo, String prodName, int amount, int orderPrice, Date orderDate, String userId,
			String receiver, String phone, String status) {
		super();
		this.orderNo = orderNo;
		this.prodName = prodName;
		this.amount = amount;
		this.orderPrice = orderPrice;
		this.orderDate = orderDate;
		this.userId = userId;
		this.receiver = receiver;
		this.phone = phone;
		this.status = status;
	}
	
//	public OrderManager(int orderNo, String prodName, int amount, int orderPrice, Date orderDate, String userId,
//			String receiver, String address, String phone, String status) {
//		super();
//		this.orderNo = orderNo;
//		this.prodName = prodName;
//		this.amount = amount;
//		this.orderPrice = orderPrice;
//		this.orderDate = orderDate;
//		this.userId = userId;
//		this.receiver = receiver;
//		this.address = address;
//		this.phone = phone;
//		this.status = status;
//	}

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public String getProdName() {
		return prodName;
	}

	public void setProdName(String prodName) {
		this.prodName = prodName;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public int getOrderPrice() {
		return orderPrice;
	}

	public void setOrderPrice(int orderPrice) {
		this.orderPrice = orderPrice;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

//	public String getAddress() {
//		return address;
//	}
//
//	public void setAddress(String address) {
//		this.address = address;
//	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Order [orderNo=" + orderNo + ", prodName=" + prodName + ", amount=" + amount + ", orderPrice="
				+ orderPrice + ", orderDate=" + orderDate + ", userId=" + userId + ", receiver=" + receiver
				/* + ", address=" + address */ + ", phone=" + phone + ", status=" + status + "]";
	}
}
