
package product.model.vo;

import java.sql.Date;

public class ProductList {
	private int prodNo;
	private String prodName;
	private int price;
	private String ctgryName;
	private String mtrlName;
	private Date enrollDate;
	private String shortInfo;
	private String prodExple;
	private String prodTag;
	private String status;
	
	private String imgNo;
	private String imgChangeName;
	private String imgName;
	
	

	public ProductList() {}

	public ProductList(int prodNo, String prodName, int price, String ctgryName, 
					String mtrlName, Date enrollDate, String shortInfo, String prodExple,
					String prodTag, String status
					, String imgNo, String imgChangeName, String imgName
			) {
		super();
		this.prodNo = prodNo;
		this.prodName = prodName;
		this.price = price;
		this.ctgryName = ctgryName;
		this.mtrlName = mtrlName;
		this.enrollDate = enrollDate;
		this.shortInfo = shortInfo;
		this.prodExple = prodExple;
		this.prodTag = prodTag;
		this.status = status;
		
		this.imgNo = imgNo;
		this.imgChangeName = imgChangeName;
		this.imgName = imgName;

		
	}
	
	
	public ProductList(int prodNo, String prodName, int price) {
		super();
		this.prodNo = prodNo;
		this.prodName = prodName;
		this.price = price;
	}

	public String getShortInfo() {
		return shortInfo;
	}

	public void setShortInfo(String shortInfo) {
		this.shortInfo = shortInfo;
	}

	public String getProdExple() {
		return prodExple;
	}

	public void setProdExple(String prodExple) {
		this.prodExple = prodExple;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
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

	public int getPrice() {
		return price;
	}
	
	
	
	
	
	

	public String getImgNo() {
		return imgNo;
	}

	public void setImgNo(String imgNo) {
		this.imgNo = imgNo;
	}

	public String getImgChangeName() {
		return imgChangeName;
	}

	public void setImgChangeName(String imgChangeName) {
		this.imgChangeName = imgChangeName;
	}

	public String getImgName() {
		return imgName;
	}

	public void setImgName(String imgName) {
		this.imgName = imgName;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getCtgryName() {
		return ctgryName;
	}

	public void setCtgryName(String ctgryName) {
		this.ctgryName = ctgryName;
	}

	public String getMtrlName() {
		return mtrlName;
	}

	public void setMtrlName(String mtrlName) {
		this.mtrlName = mtrlName;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public String getProdTag() {
		return prodTag;
	}

	public void setProdTag(String prodTag) {
		this.prodTag = prodTag;
	}

	@Override
	public String toString() {
		return "ProductList [prodNo=" + prodNo + ", prodName=" + prodName + ", price=" + price + ", ctgryName="
				+ ctgryName + ", mtrlName=" + mtrlName + ", enrollDate=" + enrollDate + ", shortInfo=" + shortInfo
				+ ", prodExple=" + prodExple + ", prodTag=" + prodTag + ", status=" + status + ", imgNo=" + imgNo
				+ ", imgChangeName=" + imgChangeName + ", imgName=" + imgName + "]";
	}

	

}
