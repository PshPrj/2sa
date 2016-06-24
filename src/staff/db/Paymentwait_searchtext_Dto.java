package staff.db;

public class Paymentwait_searchtext_Dto {
	
	private String id ,price1 , price2, board_num, member_num ,date1,date2;

	
	
	
	public Paymentwait_searchtext_Dto(String id, String price1, String price2, String board_num, String member_num,
			String date1, String date2) {
	
		this.id = id;
		this.price1 = price1;
		this.price2 = price2;
		this.board_num = board_num;
		this.member_num = member_num;
		this.date1 = date1;
		this.date2 = date2;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPrice1() {
		return price1;
	}

	public void setPrice1(String price1) {
		this.price1 = price1;
	}

	public String getPrice2() {
		return price2;
	}

	public void setPrice2(String price2) {
		this.price2 = price2;
	}

	public String getBoard_num() {
		return board_num;
	}

	public void setBoard_num(String board_num) {
		this.board_num = board_num;
	}

	public String getMember_num() {
		return member_num;
	}

	public void setMember_num(String member_num) {
		this.member_num = member_num;
	}

	public String getDate1() {
		return date1;
	}

	public void setDate1(String date1) {
		this.date1 = date1;
	}

	public String getDate2() {
		return date2;
	}

	public void setDate2(String date2) {
		this.date2 = date2;
	}

}
