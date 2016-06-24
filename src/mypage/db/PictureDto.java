package mypage.db;

public class PictureDto {
	private int estimate_board_num;
	private int picture_num;
	private String img;
	
	
	public int getEstimate_board_num() {
		return estimate_board_num;
	}
	public void setEstimate_board_num(int estimate_board_num) {
		this.estimate_board_num = estimate_board_num;
	}
	public int getPicture_num() {
		return picture_num;
	}
	public void setPicture_num(int picture_num) {
		this.picture_num = picture_num;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
}
