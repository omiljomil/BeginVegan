package material.model.vo;

import java.sql.Date;

public class Material {
	private int mtrlNo;
	private int prodNo;
	private String mtrlName;
	private String mtrlPrice;
	private String status;
	private Date enrollDate;
	
	public Material() {}

	public Material(int mtrlNo, int prodNo, String mtrlName, String mtrlPrice, String status, Date enrollDate) {
		super();
		this.mtrlNo = mtrlNo;
		this.prodNo = prodNo;
		this.mtrlName = mtrlName;
		this.mtrlPrice = mtrlPrice;
		this.status = status;
		this.enrollDate = enrollDate;
	}

	public int getMtrlNo() {
		return mtrlNo;
	}

	public void setMtrlNo(int mtrlNo) {
		this.mtrlNo = mtrlNo;
	}

	public int getProdNo() {
		return prodNo;
	}

	public void setProdNo(int prodNo) {
		this.prodNo = prodNo;
	}

	public String getMtrlName() {
		return mtrlName;
	}

	public void setMtrlName(String mtrlName) {
		this.mtrlName = mtrlName;
	}

	public String getMtrlPrice() {
		return mtrlPrice;
	}

	public void setMtrlPrice(String mtrlPrice) {
		this.mtrlPrice = mtrlPrice;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	@Override
	public String toString() {
		return "Material [mtrlNo=" + mtrlNo + ", prodNo=" + prodNo + ", mtrlName=" + mtrlName + ", mtrlPrice="
				+ mtrlPrice + ", status=" + status + ", enrollDate=" + enrollDate + "]";
	}
	
	
}
