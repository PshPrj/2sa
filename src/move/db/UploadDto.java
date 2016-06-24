
/*

 	담당 : 박승현
	최종 수정 일자 : 6/19
	배치도 dto
 */

package move.db;

public class UploadDto {
	private String imgBase64;
	private String path; //  C:/Users/p_ave/Downloads/
	private String name; //abced
	private String type; //.png   
	
	/* path + name + type = 경로 */
	
	
	public String getImgBase64() {
		return imgBase64;
	}
	public void setImgBase64(String imgBase64) {
		this.imgBase64 = imgBase64;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}

}



