package myPage.model.vo;

public class PageInfo {
	private int cuurentPage;
	private int listCount;
	private int pageLimit;
	private int boardLimit;
	private int maxPage;
	private int startPage;
	private int endPage;
	
	public PageInfo() {}

	public PageInfo(int cuurentPage, int listCount, int pageLimit, int boardLimit, int maxPage, int startPage,
			int endPage) {
		super();
		this.cuurentPage = cuurentPage;
		this.listCount = listCount;
		this.pageLimit = pageLimit;
		this.boardLimit = boardLimit;
		this.maxPage = maxPage;
		this.startPage = startPage;
		this.endPage = endPage;
	}

	public int getCuurentPage() {
		return cuurentPage;
	}

	public void setCuurentPage(int cuurentPage) {
		this.cuurentPage = cuurentPage;
	}

	public int getListCount() {
		return listCount;
	}

	public void setListCount(int listCount) {
		this.listCount = listCount;
	}

	public int getPageLimit() {
		return pageLimit;
	}

	public void setPageLimit(int pageLimit) {
		this.pageLimit = pageLimit;
	}

	public int getBoardLimit() {
		return boardLimit;
	}

	public void setBoardLimit(int boardLimit) {
		this.boardLimit = boardLimit;
	}

	public int getMaxPage() {
		return maxPage;
	}

	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	@Override
	public String toString() {
		return "PageInfo [cuurentPage=" + cuurentPage + ", listCount=" + listCount + ", pageLimit=" + pageLimit
				+ ", boardLimit=" + boardLimit + ", maxPage=" + maxPage + ", startPage=" + startPage + ", endPage="
				+ endPage + "]";
	}
	
	
}
