package mypage.db;

public class ProgressDto {
	private String movement_start_time;
	private String truck_leave_time;
	private String depart_time;
	private String complete_time;
	private String payment_num;
	
	public String getMovement_start_time() {
		return movement_start_time;
	}
	public void setMovement_start_time(String movement_start_time) {
		this.movement_start_time = movement_start_time;
	}
	public String getTruck_leave_time() {
		return truck_leave_time;
	}
	public void setTruck_leave_time(String truck_leave_time) {
		this.truck_leave_time = truck_leave_time;
	}
	public String getDepart_time() {
		return depart_time;
	}
	public void setDepart_time(String depart_time) {
		this.depart_time = depart_time;
	}
	public String getComplete_time() {
		return complete_time;
	}
	public void setComplete_time(String complete_time) {
		this.complete_time = complete_time;
	}
	public String getPayment_num() {
		return payment_num;
	}
	public void setPayment_num(String payment_num) {
		this.payment_num = payment_num;
	}
}
