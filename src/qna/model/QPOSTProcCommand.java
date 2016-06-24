/*

 	��� : ��ȿ��
	���� ���� ���� : 6/07
	���Ǳ� ��� ���� Command

 */

package qna.model;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import board.model.Command;
import move.db.QNABoardDao;
import move.db.QNABoardDto;

public class QPOSTProcCommand implements Command{

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		req.setAttribute("board", "../community/PostProc2.jsp");
		
		QNABoardDao dao = new QNABoardDao();
		QNABoardDto dto = new QNABoardDto();
		
		
		//�޾ƿ� ȸ�� ��ȣ, ����, ������ ���
		dto.setMember_num(Integer.parseInt(req.getParameter("member_num")));
		dto.setQna_subject(req.getParameter("qna_subject"));
		dto.setQna_content(req.getParameter("qna_content"));
		
		if(req.getParameter("is_secret")!=null){//��б� ����
			dto.setIs_secret(true);
		}else{
			dto.setIs_secret(false);
		}
		
		try {
			dao.insertBoard(dto);//���� ����ϱ�.
		} catch (Exception e) {
			System.out.println("insertqna����"+e);
		}
		
		return "QNA";
	}
	
}
