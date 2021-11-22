package category.model.vo;

public class Category {

	private String ctgryName;
	private String ctgryCode;
	private String ctgryRef;
	
	public Category() {}

	public Category(String ctgryName, String ctgryCode, String ctgryRef) {
		super();
		this.ctgryName = ctgryName;
		this.ctgryCode = ctgryCode;
		this.ctgryRef = ctgryRef;
	}

	public String getCtgryName() {
		return ctgryName;
	}

	public void setCtgryName(String ctgryName) {
		this.ctgryName = ctgryName;
	}

	public String getCtgryCode() {
		return ctgryCode;
	}

	public void setCtgryCode(String ctgryCode) {
		this.ctgryCode = ctgryCode;
	}

	public String getCtgryRef() {
		return ctgryRef;
	}

	public void setCtgryRef(String ctryRef) {
		this.ctgryRef = ctryRef;
	}

	@Override
	public String toString() {
		return "Category [ctgryName=" + ctgryName + ", ctgryCode=" + ctgryCode + ", ctryRef=" + ctgryRef + "]";
	}
	
	
	
}
