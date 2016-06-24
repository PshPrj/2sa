/*

 	담당 : 정효진
	최종 수정 일자 : 6/17
	견적 3 페이지로 이동

 */

package estimate.model;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import board.model.Command;

public class Estimate_3Command implements Command{

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		req.setAttribute("board", "../move/estimate/estimate_3.jsp");
		return "ESTIMATE";
	}

}
