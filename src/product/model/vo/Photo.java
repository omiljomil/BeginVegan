package product.model.vo;

import java.sql.Date;

public class Photo {
	private int imgNo;//시퀀스
	private int prodNo;//상품번호
	private String imgName;//파일본이름
	private String imgChangeName;//저장할때 같은파일이름으면 충돌되기때문에 리네이밍됨
	private String path;//파일 저장 경로
	private int fileLevel;//썸네일(0), 일반적인 사진(1
	private int type;
	private String status;
	
	public Photo() {}

	public Photo(int imgNo, int prodNo, String imgName, String imgChangeName, String path, int fileLevel, int type,
			String status) {
		super();
		this.imgNo = imgNo;
		this.prodNo = prodNo;
		this.imgName = imgName;
		this.imgChangeName = imgChangeName;
		this.path = path;
		this.fileLevel = fileLevel;
		this.type = type;
		this.status = status;
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

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public int getFileLevel() {
		return fileLevel;
	}

	public void setFileLevel(int fileLevel) {
		this.fileLevel = fileLevel;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Photo [imgNo=" + imgNo + ", prodNo=" + prodNo + ", imgName=" + imgName + ", imgChangeName="
				+ imgChangeName + ", path=" + path + ", fileLevel=" + fileLevel + ", type=" + type + ", status="
				+ status + "]";
	}

	
	
	


}
	