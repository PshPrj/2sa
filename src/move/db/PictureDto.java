
/*

 	담당 : 정효진
	최종 수정 일자 : 6/14
	사진 dto

 */

package move.db;

import java.io.InputStream;

public class PictureDto {
	private int picture_num;
	private int member_num;
	private String img;
	private int estimate_board_num;
	
	public int getPicture_num() {
		return picture_num;
	}
	public void setPicture_num(int picture_num) {
		this.picture_num = picture_num;
	}
	public int getMember_num() {
		return member_num;
	}
	public void setMember_num(int member_num) {
		this.member_num = member_num;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public int getEstimate_board_num() {
		return estimate_board_num;
	}
	public void setEstimate_board_num(int estimate_board_num) {
		this.estimate_board_num = estimate_board_num;
	}
}
