
/*

 	담당 : 박승현
	최종 수정 일자 : 6/19
	견적 등록 dao

 */

package move.db;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.util.Base64;

import javax.imageio.ImageIO;

public class UploadDao {
	public void UploadDao(UploadDto upload) {
				
		/*
			파일 업로드
		*/
		String base64Str = upload.getImgBase64();
		base64Str = base64Str.substring(base64Str.indexOf(",") + 1, base64Str.length());

		byte[] decodedBytes = Base64.getDecoder().decode(base64Str); // java.util.Base64
		try {
			BufferedImage bm = ImageIO.read(new ByteArrayInputStream(decodedBytes));
			ImageIO.write(bm, "png", new File(upload.getPath()+upload.getName()+upload.getType()));/* path + name + type = 경로 */
			System.err.println(upload.getPath()+upload.getName()+upload.getType());
			
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	

}
