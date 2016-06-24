package staff.db;

public class Memeber_Detail_Dto {
	private String member_num,member_id,member_name,date,res_cnt,es_cnt,tel,refund_cnt,pay_cnt;
	
	public String getPay_cnt() {
		return pay_cnt;
	}

	public void setPay_cnt(String pay_cnt) {
		this.pay_cnt = pay_cnt;
	}

	public String getRefund_cnt() {
		return refund_cnt;
	}

	public void setRefund_cnt(String refund_cnt) {
		this.refund_cnt = refund_cnt;
	}

	public String getMember_num() {
		return member_num;
	}

	public void setMember_num(String member_num) {
		this.member_num = member_num;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getRes_cnt() {
		return res_cnt;
	}

	public void setRes_cnt(String res_cnt) {
		this.res_cnt = res_cnt;
	}

	public String getEs_cnt() {
		return es_cnt;
	}

	public void setEs_cnt(String es_cnt) {
		this.es_cnt = es_cnt;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}
	
	
}
