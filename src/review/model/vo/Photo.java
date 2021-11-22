package review.model.vo;

public class Photo {
 private int imgNo;
 private int reviewNo;
 private String imgName;
 private String imgChangeName;
 private String filePath;
 private int fileLevel;
 private String status;
 
public Photo() {
	super();
}

public Photo(int imgNo, int reviewNo, String imgName, String imgChangeName, String filePath, int fileLevel,
		String status) {
	super();
	this.imgNo = imgNo;
	this.reviewNo = reviewNo;
	this.imgName = imgName;
	this.imgChangeName = imgChangeName;
	this.filePath = filePath;
	this.fileLevel = fileLevel;
	this.status = status;
}

public int getImgNo() {
	return imgNo;
}

public void setImgNo(int imgNo) {
	this.imgNo = imgNo;
}

public int getReviewNo() {
	return reviewNo;
}

public void setReviewNo(int reviewNo) {
	this.reviewNo = reviewNo;
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

public String getStatus() {
	return status;
}

public void setStatus(String status) {
	this.status = status;
}

@Override
public String toString() {
	return "Photo [imgNo=" + imgNo + ", reviewNo=" + reviewNo + ", imgName=" + imgName + ", imgChangeName="
			+ imgChangeName + ", filePath=" + filePath + ", fileLevel=" + fileLevel + ", status=" + status + "]";
}

}