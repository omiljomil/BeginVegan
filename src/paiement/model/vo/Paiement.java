package paiement.model.vo;

public class Paiement {
	private int prodNo;
	private String prodName;
	private int amount;
	private int price;
	private int total;
	private String userId;
	
	public Paiement() {}
	
	public Paiement(int prodNo, String prodName, int amount, int price, int total, String userId) {
		super();
		this.prodNo = prodNo;
		this.prodName = prodName;
		this.amount = amount;
		this.price = price;
		this.total = total;
		this.userId = userId;
	}
	
	public int getProdNo() {
		return prodNo;
	}
	public void setProdNo(int prodNo) {
		this.prodNo = prodNo;
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
	
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	@Override
	public String toString() {
		return "Paiement [prodNo=" + prodNo + ", prodName=" + prodName + ", amount=" + amount + ", price=" + price
				+ ", total=" + total + ", userId=" + userId + "]";
	}
}
