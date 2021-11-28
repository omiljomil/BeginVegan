package paiement.model.vo;

public class OrderPay {
	private int prodNo;
	private String prodName;
	private int amount;
	private int price;
	private int total;
	private String userId;
	private String optionName;
	private String optionCount;	
	
	public OrderPay() {}

	public OrderPay(int prodNo, String prodName, int amount, int price, int total, String userId, String optionName,
			String optionCount) {
		super();
		this.prodNo = prodNo;
		this.prodName = prodName;
		this.amount = amount;
		this.price = price;
		this.total = total;
		this.userId = userId;
		this.optionName = optionName;
		this.optionCount = optionCount;
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

	public String getOptionName() {
		return optionName;
	}

	public void setOptionName(String optionName) {
		this.optionName = optionName;
	}

	public String getOptionCount() {
		return optionCount;
	}

	public void setOptionCount(String optionCount) {
		this.optionCount = optionCount;
	}

	@Override
	public String toString() {
		return "Order [prodNo=" + prodNo + ", prodName=" + prodName + ", amount=" + amount + ", price=" + price
				+ ", total=" + total + ", userId=" + userId + ", optionName=" + optionName + ", optionCount="
				+ optionCount + "]";
	}
	
	

}
