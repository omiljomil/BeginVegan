package review.model.vo;

import java.sql.Date;

public class Comment {
	private int commentNo;
	private String commentCont;
	private String userId;
	private String userName;
	private int  reviewNo;
	private Date enrollDate;
	private Date modifyDate;
	
	
	public Comment() {
		super();
		
	}

	public Comment(int commentNo, String commentCont, String userId, String userName, int reviewNo, Date enrollDate,
			Date modifyDate) {
		super();
		this.commentNo = commentNo;
		this.commentCont = commentCont;
		this.userId = userId;
		this.userName = userName;
		this.reviewNo = reviewNo;
		this.enrollDate = enrollDate;
		this.modifyDate = modifyDate;
	}

	public int getCommentNo() {
		return commentNo;
	}

	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}

	public String getCommentCont() {
		return commentCont;
	}

	public void setCommentCont(String commentCont) {
		this.commentCont = commentCont;
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

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
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

	@Override
	public String toString() {
		return "Comment [commentNo=" + commentNo + ", commentCont=" + commentCont + ", userId=" + userId + ", userName="
				+ userName + ", reviewNo=" + reviewNo + ", enrollDate=" + enrollDate + ", modifyDate=" + modifyDate
				+ "]";
	}
}
