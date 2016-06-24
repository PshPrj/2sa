package staff.db;

public class Paymentconfirm_Search_Dto {
	
	private String id,price1,price2,member_num,board_num;

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

	public String getMember_num() {
		return member_num;
	}

	public void setMember_num(String member_num) {
		this.member_num = member_num;
	}

	public String getBoard_num() {
		return board_num;
	}

	public void setBoard_num(String board_num) {
		this.board_num = board_num;
	}

	public Paymentconfirm_Search_Dto(String id, String price1, String price2, String member_num, String board_num) {
		
		this.id = id;
		this.price1 = price1;
		this.price2 = price2;
		this.member_num = member_num;
		this.board_num = board_num;
	}

	

}
