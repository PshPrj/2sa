/*

 	��� : ��ȿ��
	���� ���� ���� : 6/16
	���Ǳ� �亯 ���� Command

 */


package qna.model;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import board.model.Command;
import move.db.QNABoardDao;
import move.db.QNABoardDto;

public class QReplyProcCommand implements Command{

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		req.setAttribute("board", "../community/community_qna.jsp");
		
		QNABoardDto dto = new QNABoardDto();
		QNABoardDao dao = new QNABoardDao();
		
		
		//�޾ƿ� �亯�� ���� dto�� ���
		dto.setQna_subject(req.getParameter("qna_subject"));
		dto.setQna_content(req.getParameter("qna_content"));
		dto.setMember_num(Integer.parseInt(req.getParameter("member_num")));
		dto.setQna_board_num(Integer.parseInt(req.getParameter("qna_board_num")));
		System.out.println(Integer.parseInt(req.getParameter("qna_board_num"))+"board_num");
		dto.setIs_confirm(true);//�亯���̹Ƿ� ������ confirm�ǵ���
		dto.setIs_secret(true);//�亯���� ������ ��б�
		
		try {
			dao.replyBoard(dto);//�亯�� ���
		} catch (Exception e) {
			System.out.println("replyqna����"+e);
		}
		
		
		
		return "QNA";
	}

}
