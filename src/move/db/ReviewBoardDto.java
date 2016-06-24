
/*

 	담당 : 정효진
	최종 수정 일자 : 6/17
	문의글 dto

 */

package move.db;

public class ReviewBoardDto {
	private int review_board_num;
	private String review_subject;
	private String review_content;
	private int star;
	private String review_date;
	private int review_views_cnt;
	private int member_num;
	private String member_id;
	public int getReview_board_num() {
		return review_board_num;
	}
	public void setReview_board_num(int review_board_num) {
		this.review_board_num = review_board_num;
	}
	public String getReview_subject() {
		return review_subject;
	}
	public void setReview_subject(String review_subject) {
		this.review_subject = review_subject;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public int getStar() {
		return star;
	}
	public void setStar(int star) {
		this.star = star;
	}
	public String getReview_date() {
		return review_date;
	}
	public void setReview_date(String review_date) {
		this.review_date = review_date;
	}
	public int getReview_views_cnt() {
		return review_views_cnt;
	}
	public void setReview_views_cnt(int review_views_cnt) {
		this.review_views_cnt = review_views_cnt;
	}
	public int getMember_num() {
		return member_num;
	}
	public void setMember_num(int member_num) {
		this.member_num = member_num;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	
	
	
}
