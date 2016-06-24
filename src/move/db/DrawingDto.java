
/*

 	담당 : 박승현
	최종 수정 일자 : 6/19
	견적 dto

 */

package move.db;

import java.util.Date;

public class DrawingDto {
	
	private int member_num;    
	public int getMember_num() {
		return member_num;
	}
	public void setMember_num(int member_num) {
		this.member_num = member_num;
	}
	public String getImg_name() {
		return img_name;
	}
	public void setImg_name(String img_name) {
		this.img_name = img_name;
	}
	private String img_name;
	
}