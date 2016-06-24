/*

 	담당 : 정효진
	최종 수정 일자 : 6/17
	견적 2 페이지로 이동

 */

package estimate.update.model;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import board.model.Command;

public class EstimateUpdate_2Command implements Command{

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		req.setAttribute("board", "../move/estimate_update/estimateUpdate_2.jsp");

		//다음 페이지롤 넘어갈 때 축적시킨 변경 데이터와 기존의 데이터, 견적 번호를 넘긴다.
		req.setAttribute("JsonData", req.getParameter("JsonData"));
		req.setAttribute("estimate_board_num", req.getParameter("estimate_board_num"));
		req.setAttribute("estimate_content", req.getParameter("estimate_content"));
		return "ESTIMATE";
	}

}
