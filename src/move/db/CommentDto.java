
/*

 	��� : ��ȿ��
	���� ���� ���� : 6/16
	�ܱ� dto

 */
package move.db;

public class CommentDto {
	private int member_num;//����� �ۼ��� ȸ�� ��ȣ
	private String member_id;//����� �ۼ��� ȸ��� ���̵�
	private String comment_content;//��� ����
	private int board_num;//����� �ۼ��� �Խ��� ��ȣ
	private int content_num;//����� �ۼ��� �Խù� ��ȣ
	private String comment_date;//��� �ۼ� ��¥
	private boolean is_secret;//��� ��� ����
	private int comment_num;//��� ��ȣ
	
	public int getMember_num() {
		return member_num;
	}
	public void setMember_num(int member_num) {
		this.member_num = member_num;
	}
	public String getComment_content() {
		return comment_content;
	}
	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public int getContent_num() {
		return content_num;
	}
	public void setContent_num(int content_num) {
		this.content_num = content_num;
	}
	public String getComment_date() {
		return comment_date;
	}
	public void setComment_date(String comment_date) {
		this.comment_date = comment_date;
	}
	public boolean isIs_secret() {
		return is_secret;
	}
	public void setIs_secret(boolean b) {
		this.is_secret = b;
	}
	public int getComment_num() {
		return comment_num;
	}
	public void setComment_num(int comment_num) {
		this.comment_num = comment_num;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	
	
}
