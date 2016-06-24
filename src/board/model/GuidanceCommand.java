/*

 	담당 : 정효진
	최종 수정 일자 : 6/1
	연혁 게시판으로 이동

 */

package board.model;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

public class GuidanceCommand implements Command{

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		req.setAttribute("board", "../guidance/guidance.jsp");
		return "GUIDANCE";
	}

}
