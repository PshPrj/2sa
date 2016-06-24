package register.model;

public class registerDto {
	private String id = "";
	private String name = "";
	private String pw = "";

	private String member_no = "";
	private String staff_no = "";
	private String staff_type = "";
	
	//전화번호
	private	String headNum;
	private String midNum;
	private String footNum;

	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getHeadNum() {
		return headNum;
	}
	public void setHeadNum(String headNum) {
		this.headNum = headNum;
	}
	public String getMidNum() {
		return midNum;
	}
	public void setMidNum(String midNum) {
		this.midNum = midNum;
	}
	public String getFootNum() {
		return footNum;
	}
	public void setFootNum(String footNum) {
		this.footNum = footNum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMember_no() {
		return member_no;
	}
	public void setMember_no(String member_no) {
		this.member_no = member_no;
	}
	public String getStaff_no() {
		return staff_no;
	}
	public void setStaff_no(String staff_no) {
		this.staff_no = staff_no;
	}
	public String getStaff_type() {
		return staff_type;
	}
	public void setStaff_type(String staff_type) {
		this.staff_type = staff_type;
	}
}