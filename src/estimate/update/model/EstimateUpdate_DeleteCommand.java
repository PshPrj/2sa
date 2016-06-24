/*

 	담당 : 정효진
	최종 수정 일자 : 6/19
	견적 삭제

 */

package estimate.update.model;

import java.io.File;
import java.io.IOException;
import java.util.Vector;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import board.model.Command;
import move.db.EstimateDao;
import move.db.EstimateDto;
import move.db.PictureDto;

public class EstimateUpdate_DeleteCommand implements Command {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
req.setAttribute("board", "../move/estimate_update/estimateDelete.jsp");
		
		EstimateDto dto = new EstimateDto();
		EstimateDao dao = new EstimateDao();
		
		//삭제하고자 하는 견적 번호 받아오기.
		dto.setEstimate_board_num(Integer.parseInt((String)req.getParameter("estimate_board_num")));
		
		try {
			dao.deleteBoard(dto);//견적 삭제
		} catch (Exception e) {
			System.out.println("estimateDelete에러"+e);
		}
		
		Vector picture_list = dao.searchPicture(dto.getEstimate_board_num());//견적과 함께 저장한 사진 정보 가져오기.
		ServletContext context = req.getSession().getServletContext();
		
		for(int i=0;i<picture_list.size();i++){//삭제될 견적의 사진을 테이블에서 삭제
			PictureDto picture_data = (PictureDto)picture_list.get(i);
			dao.deletePicture(picture_data.getPicture_num());
			
			String path = context.getRealPath("upload/estimate");
			
			path=path+"\\"+picture_data.getImg();
			
			File f= new File(path);
			f.delete();
		}

		return "ESTIMATE";
	}

}
