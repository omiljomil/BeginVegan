package question.model.vo;

import java.sql.Date;

public class Question_Comment {
	private int qst_comt_no;
	private String qst_cont;
	private String user_id;
	private int qst_no;
	private Date enroll_date;
	private Date medify_date;
	private String status;
	public Question_Comment() {
		super();
	}
	public Question_Comment(int qst_comt_no, String qst_cont, String user_id, int qst_no, Date enroll_date,
			Date medify_date, String status) {
		super();
		this.qst_comt_no = qst_comt_no;
		this.qst_cont = qst_cont;
		this.user_id = user_id;
		this.qst_no = qst_no;
		this.enroll_date = enroll_date;
		this.medify_date = medify_date;
		this.status = status;
	}
	public int getQst_comt_no() {
		return qst_comt_no;
	}
	public void setQst_comt_no(int qst_comt_no) {
		this.qst_comt_no = qst_comt_no;
	}
	public String getQst_cont() {
		return qst_cont;
	}
	public void setQst_cont(String qst_cont) {
		this.qst_cont = qst_cont;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getQst_no() {
		return qst_no;
	}
	public void setQst_no(int qst_no) {
		this.qst_no = qst_no;
	}
	public Date getEnroll_date() {
		return enroll_date;
	}
	public void setEnroll_date(Date enroll_date) {
		this.enroll_date = enroll_date;
	}
	public Date getMedify_date() {
		return medify_date;
	}
	public void setMedify_date(Date medify_date) {
		this.medify_date = medify_date;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "Question_Comment [qst_comt_no=" + qst_comt_no + ", qst_cont=" + qst_cont + ", user_id=" + user_id
				+ ", qst_no=" + qst_no + ", enroll_date=" + enroll_date + ", medify_date=" + medify_date + ", status="
				+ status + "]";
	}
	
	
	
}
