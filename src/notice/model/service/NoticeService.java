package notice.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import notice.model.dao.NoticeDAO;
import notice.model.vo.Notice;

public class NoticeService {
	
	private NoticeDAO nDAO=new NoticeDAO();

	public ArrayList<Notice> selectList(page.PageInfo pi) {
	  Connection conn=getConnection();
	  ArrayList<Notice> list=nDAO.selectList(conn, pi);
	  
	    close(conn);
		return list;
	}

	public int getListCount() {
		Connection conn=getConnection();
		int listCount=nDAO.getListCount(conn);
		close(conn);
		return listCount;
	}

	public Notice bringNoitce(int no) {
		Connection conn=getConnection();
		
	
		Notice notice=nDAO.bringNotice(conn,no);
		if( notice!=null) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return notice;
	}

	public int insertNotice(Notice n) {
		Connection conn=getConnection();
		int result=nDAO.insertNotice(conn,n);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}

	public int updateNotice(Notice n) {
		Connection conn=getConnection();
		int result=nDAO.updateNotice(conn,n);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public int deleteNotice(int no) {
		Connection conn=getConnection();
		int result=nDAO.deleteNotice(conn,no);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	public ArrayList<Notice> selectNTitle() {
		Connection conn=getConnection();
		ArrayList<Notice>list=nDAO.selectNTitle(conn);
        close(conn);
		return list;
	}
	public Notice selectNoticeBack(int noticeNo) {
		Connection conn=getConnection();
		Notice n=nDAO.selectNoticeBack(conn,noticeNo);
		close(conn);
		return n;
	}

	public Notice selectNoticeNext(int noticeNo) {
		Connection conn=getConnection();
		Notice n=nDAO.selectNoticeNext(conn,noticeNo);
		close(conn);
		return n;
	}
	
}	
