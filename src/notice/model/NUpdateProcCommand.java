/*

 	��� : ��ȿ��
	���� ���� ���� : 6/19
	���� ���� ���� Command

 */

package notice.model;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import board.model.Command;
import move.db.NoticeBoardDao;
import move.db.NoticeBoardDto;

public class NUpdateProcCommand implements Command{

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		req.setAttribute("board", "../company/company_notice.jsp");//���� ���� ���� ������
		
		 boardupdate(req);
				
		return "NOTICE";
	}
	
	public void boardupdate(HttpServletRequest req){
		NoticeBoardDto dto = new NoticeBoardDto();
		NoticeBoardDao dao = new NoticeBoardDao();
		
		//���������� �޾ƿ´�.
		dto.setNotice_board_num(Integer.parseInt(req.getParameter("notice_board_num")));
		dto.setNotice_subject(req.getParameter("notice_subject"));
		dto.setNotice_content(req.getParameter("notice_content"));
		
		try {
			dao.updateBoard(dto);//���� ����
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("updateproccommand ���� "+e);
		}
	}

}
