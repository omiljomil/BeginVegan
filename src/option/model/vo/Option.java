package option.model.vo;

public class Option {
	private int optionNo;
	private String optionName;
	private int optionCount;
	private int prodNo;
	
	public Option() {}
	
	public Option(int optionNo, String optionName, int optionCount, int prodNo) {
		super();
		this.optionNo = optionNo;
		this.optionName = optionName;
		this.optionCount = optionCount;
		this.prodNo = prodNo;
	}

	public int getOptionNo() {
		return optionNo;
	}

	public void setOptionNo(int optionNo) {
		this.optionNo = optionNo;
	}

	public String getOptionName() {
		return optionName;
	}

	public void setOptionName(String optionName) {
		this.optionName = optionName;
	}

	public int getOptionCount() {
		return optionCount;
	}

	public void setOptionCount(int optionCount) {
		this.optionCount = optionCount;
	}

	public int getProdNo() {
		return prodNo;
	}

	public void setProdNo(int prodNo) {
		this.prodNo = prodNo;
	}

	@Override
	public String toString() {
		return "Option [optionNo=" + optionNo + ", optionName=" + optionName + ", optionCount=" + optionCount
				+ ", prodNo=" + prodNo + "]";
	}
	
	
}
