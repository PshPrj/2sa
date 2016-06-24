package mypage.db;

public class ReservationDto {
	private int reservation_num;
	private String reservation_date;
	private int is_confirm;
	private boolean template;
	
	public boolean isTemplate() {
		return template;
	}
	public void setTemplate(boolean template) {
		this.template = template;
	}
	public int getReservation_num() {
		return reservation_num;
	}
	public void setReservation_num(int reservation_num) {
		this.reservation_num = reservation_num;
	}
	public String getReservation_date() {
		return reservation_date;
	}
	public void setReservation_date(String reservation_date) {
		this.reservation_date = reservation_date;
	}
	public int getIs_confirm() {
		return is_confirm;
	}
	public void setIs_confirm(int is_confirm) {
		this.is_confirm = is_confirm;
	}
}
