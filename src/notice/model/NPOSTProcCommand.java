/*

 	��� : ��ȿ��
	���� ���� ���� : 6/08
	���� ������� Command

 */

package notice.model;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import board.model.Command;
import move.db.NoticeBoardDao;
import move.db.NoticeBoardDto;

public class NPOSTProcCommand implements Command{

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		req.setAttribute("board", "../company/PostProc.jsp");//���� ��� ���� ������
		
		req.setAttribute("keyWord", req.getParameter("keyWord"));
		req.setAttribute("keyField",req.getParameter("keyField"));
		
		notice_post(req);

		return "NOTICE";
	}
	
	public void notice_post(HttpServletRequest req){
		
		NoticeBoardDto dto = new NoticeBoardDto();
		NoticeBoardDao dao = new NoticeBoardDao();
		
		//�޾ƿ� ���� ����� ����, ����� ��ȣ
		dto.setNotice_content((String)req.getParameter("notice_content"));
		dto.setNotice_subject(req.getParameter("notice_subject"));
		dto.setStaff_num(Integer.parseInt(req.getParameter("staff_num")));
		
		try {
			dao.insertBoard(dto);//���� ���
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("NPOSTProcCommand ����"+e);
		}
	
	}
	
}
