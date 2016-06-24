package staff.db;

public class Paymentrefund_Search_Dto {

	private String id,board_num,member_num,price1,price2;

	public Paymentrefund_Search_Dto(String id, String board_num, String member_num, String price1, String price2) {
		this.id = id;
		this.board_num = board_num;
		this.member_num = member_num;
		this.price1 = price1;
		this.price2 = price2;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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
	
	
	
	
}
