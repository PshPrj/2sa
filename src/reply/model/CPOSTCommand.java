/*

 	��� : ��ȿ��
	���� ���� ���� : 6/16
	���ñ� ��� Command

 */
package reply.model;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import board.model.Command;
import move.db.CommentDao;
import move.db.CommentDto;

public class CPOSTCommand implements Command{

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		req.setAttribute("board", "../comment/c_proc.jsp");
		CommentDto dto = new CommentDto();
		
		
		//���ñ��� ����� ȸ�� ��ȣ�� �Խ��� �̸��� �����´�.
		dto.setMember_num(Integer.parseInt(req.getParameter("member_num")));
		dto.setBoard_num(Integer.parseInt(req.getParameter("board_num")));
		
		String is_secret = (String)req.getParameter("is_secret");//��� ��� ���θ� �޾ƿ´�.
		if(is_secret==null){
			dto.setIs_secret(false);
		}else{
			dto.setIs_secret(true);
		}
		
		dto.setComment_content((String) req.getParameter("comment_content"));
		dto.setContent_num(Integer.parseInt(req.getParameter("content_num")));
		System.out.println(Integer.parseInt(req.getParameter("content_num")));
	
		insertComment(dto);//��� ���
				
		return searchBoard_nic(dto);
	}
	
	public void insertComment(CommentDto dto){//��� ���
		CommentDao dao = new CommentDao();
		
		dao.insertComment(dto);
	}
	
	public String searchBoard_nic(CommentDto dto){//��ϵ� ����� ��� �Խ��ǿ� ����ߴ��� Ȯ��.
		CommentDao dao = new CommentDao();
		
		String board_nic=dao.searchBoard_nic(dto);
		
		return board_nic.toString();
	}

}
