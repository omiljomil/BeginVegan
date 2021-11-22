package review.model.vo;

import java.sql.Date;

public class Review {
	
	 private  int reviewNo;
	 private String reviewTitle;
	 private String reviewCon;
		/* private int prodNo; */
		 private String userId; 
	 private String userName;
	 private Date enrollDate;
	 private Date modifyDate;
	 private String status;
	 
	 
	public Review() {
		super();
		
	}


	public Review(int reviewNo, String reviewTitle, String reviewCon, String userId, String userName, Date enrollDate,
			Date modifyDate, String status) {
		super();
		this.reviewNo = reviewNo;
		this.reviewTitle = reviewTitle;
		this.reviewCon = reviewCon;
		this.userId = userId;
		this.userName = userName;
		this.enrollDate = enrollDate;
		this.modifyDate = modifyDate;
		this.status = status;
	}


	public int getReviewNo() {
		return reviewNo;
	}


	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}


	public String getReviewTitle() {
		return reviewTitle;
	}


	public void setReviewTitle(String reviewTitle) {
		this.reviewTitle = reviewTitle;
	}


	public String getReviewCon() {
		return reviewCon;
	}


	public void setReviewCon(String reviewCon) {
		this.reviewCon = reviewCon;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}


	public Date getEnrollDate() {
		return enrollDate;
	}


	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}


	public Date getModifyDate() {
		return modifyDate;
	}


	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	@Override
	public String toString() {
		return "Review [reviewNo=" + reviewNo + ", reviewTitle=" + reviewTitle + ", reviewCon=" + reviewCon + ", userId="
				+ userId + ", userName=" + userName + ", enrollDate=" + enrollDate + ", modifyDate=" + modifyDate
				+ ", status=" + status + "]";
	}
}
