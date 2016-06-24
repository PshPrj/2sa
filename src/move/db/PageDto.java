package move.db;

public class PageDto {
	private int totalRecord = 0;//게시물의 수
	private int numPerPage = 5; //한 페이지당 프린트 될 글의 개수
	private int pagePerBlock = 3; //한 블럭 내의 페이지가 몇 페이지인가.
	//ex:< 1 2 3 >
	private int totalPage = 0; //전체 페이지가 몇 페이지인가?
	private int totalBlock = 0;//전체 블럭이 몇 개인가?
	private int nowPage =0;//현재 페이지
	private int nowBlock = 0;//현재 블럭
	private int beginPerPage = 0;
	public int getTotalRecord() {
		return totalRecord;
	}
	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}
	public int getNumPerPage() {
		return numPerPage;
	}
	public void setNumPerPage(int numPerPage) {
		this.numPerPage = numPerPage;
	}
	public int getPagePerBlock() {
		return pagePerBlock;
	}
	public void setPagePerBlock(int pagePerBlock) {
		this.pagePerBlock = pagePerBlock;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		totalPage=((int)Math.ceil((double)totalRecord/numPerPage));
		this.totalPage = totalPage;
	}
	public int getTotalBlock() {
		return totalBlock;
	}
	public void setTotalBlock(int totalBlock) {
		totalBlock=((int)Math.ceil((double)totalPage/pagePerBlock));
		this.totalBlock = totalBlock;
	}
	public int getNowPage() {
		return nowPage;
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}
	public int getNowBlock() {
		return nowBlock;
	}
	public void setNowBlock(int nowBlock) {
		beginPerPage = nowPage*numPerPage;
		this.nowBlock = nowBlock;
	}
	public int getBeginPerPage() {
		return beginPerPage;
	}
	public void setBeginPerPage(int beginPerPage) {
		this.beginPerPage = beginPerPage;
	}
	
	
}
