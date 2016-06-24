package staff.db;

public class Member_searchtext_Dto {
	
	private String date1,date2,name,id,member_num,refund,history;

	public Member_searchtext_Dto(String date1, String date2, String name, String id, String member_num, String refund,
			String history) {
		
		this.date1 = date1;
		this.date2 = date2;
		this.name = name;
		this.id = id;
		this.member_num = member_num;
		this.refund = refund;
		this.history = history;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getMember_num() {
		return member_num;
	}

	public void setMember_num(String member_num) {
		this.member_num = member_num;
	}

	public String getRefund() {
		return refund;
	}

	public void setRefund(String refund) {
		this.refund = refund;
	}

	public String getHistory() {
		return history;
	}

	public void setHistory(String history) {
		this.history = history;
	}
	
	

}
