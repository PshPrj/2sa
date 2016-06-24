package move.db;

public class PageDto {
	private int totalRecord = 0;//�Խù��� ��
	private int numPerPage = 5; //�� �������� ����Ʈ �� ���� ����
	private int pagePerBlock = 3; //�� �� ���� �������� �� �������ΰ�.
	//ex:< 1 2 3 >
	private int totalPage = 0; //��ü �������� �� �������ΰ�?
	private int totalBlock = 0;//��ü ���� �� ���ΰ�?
	private int nowPage =0;//���� ������
	private int nowBlock = 0;//���� ��
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
