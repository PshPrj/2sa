
/*

 	담당 : 정효진
	최종 수정 일자 : 6/16
	문의글 dto

 */

package move.db;

import java.util.Date;

public class QNABoardDto {
	private int qna_board_num;
	private String qna_date;
	private String qna_subject;
	private String qna_content;
	private int member_num;
	private boolean is_confirm;
	private int qna_views_cnt;
	private boolean is_secret;
	private int pos;
	private int depth;
	private String member_id;
	
	
	
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getQna_board_num() {
		return qna_board_num;
	}
	public void setQna_board_num(int qna_board_num) {
		this.qna_board_num = qna_board_num;
	}
	public String getQna_date() {
		return qna_date;
	}
	public void setQna_date(String qna_date) {
		this.qna_date = qna_date;
	}
	public String getQna_subject() {
		return qna_subject;
	}
	public void setQna_subject(String qna_subject) {
		this.qna_subject = qna_subject;
	}
	public String getQna_content() {
		return qna_content;
	}
	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}
	public int getMember_num() {
		return member_num;
	}
	public void setMember_num(int member_num) {
		this.member_num = member_num;
	}
	public boolean isIs_confirm() {
		return is_confirm;
	}
	public void setIs_confirm(boolean is_confirm) {
		this.is_confirm = is_confirm;
	}
	public int getQna_views_cnt() {
		return qna_views_cnt;
	}
	public void setQna_views_cnt(int qna_views_cnt) {
		this.qna_views_cnt = qna_views_cnt;
	}
	public boolean isIs_secret() {
		return is_secret;
	}
	public void setIs_secret(boolean is_secret) {
		this.is_secret = is_secret;
	}
	public int getPos() {
		return pos;
	}
	public void setPos(int pos) {
		this.pos = pos;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	
	
}