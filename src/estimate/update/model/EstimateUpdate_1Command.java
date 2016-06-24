/*

 	담당 : 정효진
	최종 수정 일자 : 6/17
	견적수정 1 페이지로 이동

 */

package estimate.update.model;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import board.model.Command;
import move.db.EstimateDao;
import move.db.EstimateDto;

public class EstimateUpdate_1Command implements Command{

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		req.setAttribute("board", "../move/estimate_update/estimateUpdate_1.jsp");
		
		EstimateDto dto = new EstimateDto();
		EstimateDao dao = new EstimateDao();
		
		//견적 번호를 넘긴다.
		dto.setEstimate_board_num(Integer.parseInt((String)req.getParameter("estimate_board_num")));
		
		
		//견적 번호를 통해 저장된 견적 내용을 가져간다.
		dto=dao.getEstimate(dto.getEstimate_board_num());
		
		req.setAttribute("dto", dto);
		
		return "ESTIMATE";
	}

}
