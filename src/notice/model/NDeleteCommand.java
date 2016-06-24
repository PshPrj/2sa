
/*

 	담당 : 정효진
	최종 수정 일자 : 6/06
	공지삭제Command

 */

package notice.model;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import board.model.Command;

public class NDeleteCommand implements Command{

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		req.setAttribute("board", "../company/Delete.jsp");//공지 삭제 결과 페이지
		return "DELETE";
	}

}
