
/*

 	담당 : 정효진
	최종 수정 일자 : 6/1
	공지 dto

 */

package move.db;

import java.util.Date;

public class NoticeBoardDto {
	private int notice_board_num;
	private String notice_date;
	private String notice_subject;
	private String notice_content;
	private int notice_views_cnt;
	private int staff_num;
	
	public int getNotice_board_num() {
		return notice_board_num;
	}
	public void setNotice_board_num(int notice_board_num) {
		this.notice_board_num = notice_board_num;
	}
	public String getNotice_date() {
		return notice_date;
	}
	public void setNotice_date(String notice_date) {
		this.notice_date = notice_date;
	}
	
	public String getNotice_subject() {
		return notice_subject;
	}
	public void setNotice_subject(String notice_subject) {
		this.notice_subject = notice_subject;
	}
	public String getNotice_content() {
		return notice_content;
	}
	public void setNotice_content(String notice_board_content) {
		this.notice_content = notice_board_content;
	}
	public int getNotice_views_cnt() {
		return notice_views_cnt;
	}
	public void setNotice_views_cnt(int notice_views_cnt) {
		this.notice_views_cnt = notice_views_cnt;
	}
	public int getStaff_num() {
		return staff_num;
	}
	public void setStaff_num(int staff_num) {
		this.staff_num = staff_num;
	}
	
	
	
	
	
}
