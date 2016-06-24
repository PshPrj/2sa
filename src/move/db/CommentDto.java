
/*

 	담당 : 정효진
	최종 수정 일자 : 6/16
	앳글 dto

 */
package move.db;

public class CommentDto {
	private int member_num;//댓글을 작성한 회원 번호
	private String member_id;//댓글을 작성한 회우너 아이디
	private String comment_content;//댓글 내용
	private int board_num;//댓글을 작성한 게시판 번호
	private int content_num;//댓글을 작성한 게시물 번호
	private String comment_date;//댓글 작성 날짜
	private boolean is_secret;//비밀 댓글 설정
	private int comment_num;//댓글 번호
	
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
