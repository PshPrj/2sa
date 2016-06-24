package mypage.db;

public class PaymentDto {
	private int payment_num;
	private int price;
	private String payment_date;
	private int payment_type;
	private int cash_bill;
	private int member_num;
	private int is_refund;
	private int refund_check;
	private int reservation_num;
	private String payment_deadline;
	private String member_name;
	
	private String reservation_date;
	private String addr1;
	private String addr2;
	
	public int getPayment_num() {
		return payment_num;
	}
	public void setPayment_num(int num) {
		this.payment_num = num;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getPayment_date() {
		return payment_date;
	}
	public void setPayment_date(String payment_date) {
		this.payment_date = payment_date;
	}
	public int getPayment_type() {
		return payment_type;
	}
	public void setPayment_type(int payment_type) {
		this.payment_type = payment_type;
	}
	public int getCash_bill() {
		return cash_bill;
	}
	public void setCash_bill(int cash_bill) {
		this.cash_bill = cash_bill;
	}
	public int getMember_num() {
		return member_num;
	}
	public void setMember_num(int member_num) {
		this.member_num = member_num;
	}
	public int getIs_refund() {
		return is_refund;
	}
	public void setIs_refund(int is_refund) {
		this.is_refund = is_refund;
	}
	public int getRefund_check() {
		return refund_check;
	}
	public void setRefund_check(int refund_check) {
		this.refund_check = refund_check;
	}
	public int getReservation_num() {
		return reservation_num;
	}
	public void setReservation_num(int reservation_num) {
		this.reservation_num = reservation_num;
	}
	public String getPayment_deadline() {
		return payment_deadline;
	}
	public void setPayment_deadline(String payment_deadline) {
		this.payment_deadline = payment_deadline;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getReservation_date() {
		return reservation_date;
	}
	public void setReservation_date(String reservation_date) {
		this.reservation_date = reservation_date;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
}
