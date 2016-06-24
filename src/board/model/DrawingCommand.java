/*

 	담당 : 정효진
	최종 수정 일자 : 6/7
	배치도 게시판 첫 번째 페이지로 이동

 */

package board.model;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

public class DrawingCommand implements Command{

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		req.setAttribute("board", "../move/drawing/drawing_1.jsp");
		return "DRAWING";	
	}
}
