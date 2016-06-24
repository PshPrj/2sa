
/*

 	담당 : 정효진
	최종 수정 일자 : 6/15
	예약 dto

 */

package move.db;

public class ReservationDto {
	
	private String reservation_date;
	private int reservation_num;
	private String my_reservation_date;
	private int member_num;
	private String estimate_date;
	private int estimate_board_num;
	private int keep_item_date;
	private boolean template;
	private int price;
	private int reservation_time;
	
	public String getReservation_date() {
		return reservation_date;
	}
	public void setReservation_date(String reservation_date) {
		this.reservation_date = reservation_date;
	}
	public int getReservation_num() {
		return reservation_num;
	}
	public void setReservation_num(int reservation_num) {
		this.reservation_num = reservation_num;
	}
	public String getMy_reservation_date() {
		return my_reservation_date;
	}
	public void setMy_reservation_date(String my_reservation_date) {
		this.my_reservation_date = my_reservation_date;
	}
	public int getMember_num() {
		return member_num;
	}
	public void setMember_num(int member_num) {
		this.member_num = member_num;
	}
	
	public String getEstimate_date() {
		return estimate_date;
	}
	public void setEstimate_date(String estimate_date) {
		this.estimate_date = estimate_date;
	}
	public int getEstimate_board_num() {
		return estimate_board_num;
	}
	public void setEstimate_board_num(int estimate_board_num) {
		this.estimate_board_num = estimate_board_num;
	}
	public int getKeep_item_date() {
		return keep_item_date;
	}
	public void setKeep_item_date(int days) {
		this.keep_item_date = days;
	}
	public boolean getTemplate() {
		return template;
	}
	public void setTemplate(boolean template) {
		this.template = template;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getReservation_time() {
		return reservation_time;
	}
	public void setReservation_time(int reservation_time) {
		this.reservation_time = reservation_time;
	}
	
	
	
}
