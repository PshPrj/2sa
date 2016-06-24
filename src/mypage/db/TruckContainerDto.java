package mypage.db;

public class TruckContainerDto {
	private int truck_num;
	private int staff_num_tr;
	private int payment_num;
	private int truck_capacity;
	private String car_type;
	private String car_num;
	private String regi_date_truck;
	private String staff_name_tr;
	// 트럭
	private int container_num;
	private int staff_num_con;
	private int container_capacity;
	private String regi_date_container;
	private String staff_name_con;
	// 컨테이너
	
	public int getTruck_num() {
		return truck_num;
	}
	public void setTruck_num(int truck_num) {
		this.truck_num = truck_num;
	}
	public int getStaff_num_tr() {
		return staff_num_tr;
	}
	public void setStaff_num_tr(int staff_num) {
		this.staff_num_tr = staff_num;
	}
	public int getPayment_num() {
		return payment_num;
	}
	public void setPayment_num(int payment_num) {
		this.payment_num = payment_num;
	}
	public int getTruck_capacity() {
		return truck_capacity;
	}
	public void setTruck_capacity(int truck_capacity) {
		this.truck_capacity = truck_capacity;
	}
	public String getCar_type() {
		return car_type;
	}
	public void setCar_type(String car_type) {
		this.car_type = car_type;
	}
	public String getCar_num() {
		return car_num;
	}
	public void setCar_num(String car_num) {
		this.car_num = car_num;
	}
	public String getRegi_date_truck() {
		return regi_date_truck;
	}
	public void setRegi_date_truck(String regi_date_truck) {
		this.regi_date_truck = regi_date_truck;
	}
	public int getContainer_num() {
		return container_num;
	}
	public void setContainer_num(int container_num) {
		this.container_num = container_num;
	}
	public int getStaff_num_con() {
		return staff_num_con;
	}
	public void setStaff_num_con(int staff_num_con) {
		this.staff_num_con = staff_num_con;
	}
	public int getContainer_capacity() {
		return container_capacity;
	}
	public void setContainer_capacity(int container_capacity) {
		this.container_capacity = container_capacity;
	}
	public String getRegi_date_container() {
		return regi_date_container;
	}
	public void setRegi_date_container(String regi_date_container) {
		this.regi_date_container = regi_date_container;
	}
	public String getStaff_name_tr() {
		return staff_name_tr;
	}
	public void setStaff_name_tr(String staff_name_tr) {
		this.staff_name_tr = staff_name_tr;
	}
	public String getStaff_name_con() {
		return staff_name_con;
	}
	public void setStaff_name_con(String staff_name_con) {
		this.staff_name_con = staff_name_con;
	}
}