/*

 	��� : ��ȿ��
	���� ���� ���� : 6/20
	�ı� ��� Command

 */

package review.model;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import board.model.Command;

public class RPOSTCommand implements Command{

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		req.setAttribute("board", "../community/review_Post.jsp");
		
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");

		req.setAttribute("keyWord", req.getParameter("keyWord"));
		req.setAttribute("keyField",req.getParameter("keyField"));
		
		return "REVIEW";
	}

}
