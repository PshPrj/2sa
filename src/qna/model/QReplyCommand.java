/*

 	��� : ��ȿ��
	���� ���� ���� : 6/16
	���Ǳ� �亯 Command

 */
package qna.model;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import board.model.Command;

public class QReplyCommand implements Command{

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		req.setAttribute("board", "../community/qna_Reply.jsp");
		
		req.setAttribute("keyWord", req.getParameter("keyWord"));
		req.setAttribute("keyField",req.getParameter("keyField"));
		
		return "QNA";
	}

}
