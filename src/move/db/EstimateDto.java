
/*

 	담당 : 정효진
	최종 수정 일자 : 6/17
	견적 dto

 */

package move.db;

public class EstimateDto {
	private int estimate_board_num;
	private int member_num;
	private String estimate_content;
	private int pre_price;
	private int pre_estimate_time;
	private String addr1;
	private String addr2;
	private double distance;
	private double n_lat;
	private double n_lng;
	private double l_lat;
	private double l_lng;
	private String estimate_date;
	
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
	public int getMember_num() {
		return member_num;
	}
	public void setMember_num(int member_num) {
		this.member_num = member_num;
	}
	public String getEstimate_content() {
		return estimate_content;
	}
	public void setEstimate_content(String estimate_content) {
		this.estimate_content = estimate_content;
	}
	public int getPre_price() {
		return pre_price;
	}
	public void setPre_price(int pre_price) {
		this.pre_price = pre_price;
	}
	public int getPre_estimate_time() {
		return pre_estimate_time;
	}
	public void setPre_estimate_time(int pre_estimate_time) {
		this.pre_estimate_time = pre_estimate_time;
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
	public double getDistance() {
		return distance;
	}
	public void setDistance(double distance) {
		this.distance = distance;
	}
	public double getN_lat() {
		return n_lat;
	}
	public void setN_lat(Double string) {
		this.n_lat = string;
	}
	public double getN_lng() {
		return n_lng;
	}
	public void setN_lng(double n_lng) {
		this.n_lng = n_lng;
	}
	public double getL_lat() {
		return l_lat;
	}
	public void setL_lat(double l_lat) {
		this.l_lat = l_lat;
	}
	public double getL_lng() {
		return l_lng;
	}
	public void setL_lng(double l_lng) {
		this.l_lng = l_lng;
	}
	
	
	
	
}
