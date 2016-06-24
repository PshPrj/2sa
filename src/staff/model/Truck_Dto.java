package staff.model;

public class Truck_Dto {

	private String car_type,car_name;
	private int truck_num,staff_num;
	private double capacity;
	
	public double getCapacity() {
		return capacity;
	}
	public void setCapacity(double capacity) {
		this.capacity = capacity;
	}
	public int getStaff_num() {
		return staff_num;
	}
	public void setStaff_num(int staff_num) {
		this.staff_num = staff_num;
	}
	public String getCar_type() {
		return car_type;
	}
	public void setCar_type(String car_type) {
		this.car_type = car_type;
	}
	public String getCar_name() {
		return car_name;
	}
	public void setCar_name(String car_name) {
		this.car_name = car_name;
	}
	public int getTruck_num() {
		return truck_num;
	}
	public void setTruck_num(int truck_num) {
		this.truck_num = truck_num;
	}
	
	
	
}
