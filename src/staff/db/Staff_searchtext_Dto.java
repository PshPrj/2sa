package staff.db;

public class Staff_searchtext_Dto {

	private String date1,date2,name,id,dept,tel;

	public Staff_searchtext_Dto(String date1, String date2, String name, String id, String dept, String tel) {
		super();
		this.date1 = date1;
		this.date2 = date2;
		this.name = name;
		this.id = id;
		this.dept = dept;
		this.tel = tel;
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

	public String getDept() {
		return dept;
	}

	public void setDept(String dept) {
		this.dept = dept;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}
	
	
	
	
}
