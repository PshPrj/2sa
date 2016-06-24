/*

 	��� : ��ȿ��
	���� ���� ���� : 6/08
	���� �о���� Command

 */

package notice.model;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import board.model.Command;
import move.db.CommentDao;
import move.db.CommentDto;
import move.db.NoticeBoardDao;
import move.db.NoticeBoardDto;

public class NReadCommand implements Command{

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		req.setAttribute("board", "../company/Read.jsp");//���� �о���̴� ������
		
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
	
		req.setAttribute("keyWord", req.getParameter("keyWord"));
		req.setAttribute("keyField",req.getParameter("keyField"));
		
		req.setAttribute("dto", getRead(req));//�о�� ���� ���� ������.
		
		CommentDto c_dto = new CommentDto();
		CommentDao c_dao = new CommentDao();
		
		req.setAttribute("board_num","1");
		c_dto.setBoard_num(1);//���� �Խ����� �Խ��� ��ȣ�� 1���̴�.
		c_dto.setContent_num(Integer.parseInt(req.getParameter("num")));
		Vector commentList = (Vector)c_dao.commentList(c_dto);
		
		req.setAttribute("commentList", commentList);
	
		return "NOTICE";
	}
	
	public NoticeBoardDto getRead(HttpServletRequest req){
		
		NoticeBoardDto dto = new NoticeBoardDto();
		NoticeBoardDao dao = new NoticeBoardDao();
		
		dto.setNotice_board_num(Integer.parseInt(req.getParameter("num")));
		
		try {
			dto=dao.getBoard(dto.getNotice_board_num(), true);//���� �б�
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("NREADCommand ����"+e);
		}
		
		return dto;
	}

}
