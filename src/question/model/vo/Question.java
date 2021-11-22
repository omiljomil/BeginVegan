package question.model.vo;

import java.util.Date;

public class Question {

		private int qst_no;
		private String qst_title;
		private String qst_cont;
		private String user_id;
		private Date enroll_date;
		private Date modify_date;
		private String status;

		public Question() {
		}

		public Question(int qst_no, String qst_title, String qst_cont, String user_id, Date enroll_date, Date modify_date,
				String status) {
			this.qst_no = qst_no;
			this.qst_title = qst_title;
			this.qst_cont = qst_cont;
			this.user_id = user_id;
			this.enroll_date = enroll_date;
			this.modify_date = modify_date;
			this.status = status;
		}

		public int getQst_no() {
			return this.qst_no;
		}

		public void setQst_no(int qst_no) {
			this.qst_no = qst_no;
		}

		public String getQst_title() {
			return this.qst_title;
		}

		public void setQst_title(String qst_title) {
			this.qst_title = qst_title;
		}

		public String getQst_cont() {
			return this.qst_cont;
		}

		public void setQst_cont(String qst_cont) {
			this.qst_cont = qst_cont;
		}

		public String getUser_id() {
			return this.user_id;
		}

		public void setUser_id(String user_id) {
			this.user_id = user_id;
		}

		public Date getEnroll_date() {
			return this.enroll_date;
		}

		public void setEnroll_date(Date enroll_date) {
			this.enroll_date = enroll_date;
		}

		public Date getModify_date() {
			return this.modify_date;
		}

		public void setModify_date(Date modify_date) {
			this.modify_date = modify_date;
		}

		public String getStatus() {
			return this.status;
		}

		public void setStatus(String status) {
			this.status = status;
		}

		public String toString() {
			return "Question [qst_no=" + this.qst_no + ", qst_title=" + this.qst_title + ", qst_cont=" + this.qst_cont
					+ ", user_id=" + this.user_id + ", enroll_date=" + this.enroll_date + ", modify_date="
					+ this.modify_date + ", status=" + this.status + "]";
		}
}
