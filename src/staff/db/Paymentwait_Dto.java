package staff.db;

public class Paymentwait_Dto {
	
	private String member_num,board_num,date,price,id,dedline_date;
	private int dedline;

	
	
	
	
	public String getDedline_date() {
		return dedline_date;
	}

	public void setDedline_date(String dedline_date) {
		this.dedline_date = dedline_date;
	}

	public int getDedline() {
		return dedline;
	}

	public void setDedline(int dedline) {
		this.dedline = dedline;
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



	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

}
