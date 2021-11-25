package review.model.vo;

public class Photo {
	private int imgNo;
	 private int prodNo;
	 private String imgName;
	 private String imgChangeName;
	 private String filePath;
	 private int fileLevel;
	 private String type;
	 private String status;
	 private int reviewNo;
	 
	public Photo() {
		super();
	}

	public Photo(int imgNo, int prodNo, String imgName, String imgChangeName, String filePath, int fileLevel, String type,
			String status, int reviewNo) {
		super();
		this.imgNo = imgNo;
		this.prodNo = prodNo;
		this.imgName = imgName;
		this.imgChangeName = imgChangeName;
		this.filePath = filePath;
		this.fileLevel = fileLevel;
		this.type = type;
		this.status = status;
		this.reviewNo = reviewNo;
	}

	public int getImgNo() {
		return imgNo;
	}

	public void setImgNo(int imgNo) {
		this.imgNo = imgNo;
	}

	public int getProdNo() {
		return prodNo;
	}

	public void setProdNo(int prodNo) {
		this.prodNo = prodNo;
	}

	public String getImgName() {
		return imgName;
	}

	public void setImgName(String imgName) {
		this.imgName = imgName;
	}

	public String getImgChangeName() {
		return imgChangeName;
	}

	public void setImgChangeName(String imgChangeName) {
		this.imgChangeName = imgChangeName;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public int getFileLevel() {
		return fileLevel;
	}

	public void setFileLevel(int fileLevel) {
		this.fileLevel = fileLevel;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	@Override
	public String toString() {
		return "Photo [imgNo=" + imgNo + ", prodNo=" + prodNo + ", imgName=" + imgName + ", imgChangeName=" + imgChangeName
				+ ", filePath=" + filePath + ", fileLevel=" + fileLevel + ", type=" + type + ", status=" + status
				+ ", reviewNo=" + reviewNo + "]";
	}
}