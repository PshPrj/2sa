package mypage.db;

public class StuffListDto {
	private String estimate_content;
	private int member_num;
	private int estimate_board_num;
	private String estimate_date;
	
	public String getEstimate_content() {
		return estimate_content;
	}
	public void setEstimate_content(String estimate_content) {
		this.estimate_content = estimate_content;
	}
	public int getMember_num() {
		return member_num;
	}
	public void setMember_num(int member_num) {
		this.member_num = member_num;
	}
	public int getEstimate_board_num() {
		return estimate_board_num;
	}
	public void setEstimate_board_num(int estimate_board_num) {
		this.estimate_board_num = estimate_board_num;
	}
	public String getEstimate_date() {
		return estimate_date;
	}
	public void setEstimate_date(String estimate_date) {
		this.estimate_date = estimate_date;
	}
}
