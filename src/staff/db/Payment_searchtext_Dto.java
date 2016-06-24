package staff.db;

public class Payment_searchtext_Dto {
	String id,date1,date2,num,price1,price2;
	
	public Payment_searchtext_Dto(String id, String date1, String date2, String num, String price1, String price2) {

		this.id = id;
		this.date1 = date1;
		this.date2 = date2;
		this.num = num;
		this.price1 = price1;
		this.price2 = price2;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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

	public String getNum() {
		return num;
	}

	public void setNum(String num) {
		this.num = num;
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
