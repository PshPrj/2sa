/*

 	담당 : 정효진
	최종 수정 일자 : 6/16
	리플글 등록 Command

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
		
		
		//리플글을 등록할 회원 번호와 게시판 이름을 가져온다.
		dto.setMember_num(Integer.parseInt(req.getParameter("member_num")));
		dto.setBoard_num(Integer.parseInt(req.getParameter("board_num")));
		
		String is_secret = (String)req.getParameter("is_secret");//비밀 댓글 여부를 받아온다.
		if(is_secret==null){
			dto.setIs_secret(false);
		}else{
			dto.setIs_secret(true);
		}
		
		dto.setComment_content((String) req.getParameter("comment_content"));
		dto.setContent_num(Integer.parseInt(req.getParameter("content_num")));
		System.out.println(Integer.parseInt(req.getParameter("content_num")));
	
		insertComment(dto);//댓글 등록
				
		return searchBoard_nic(dto);
	}
	
	public void insertComment(CommentDto dto){//댓글 등록
		CommentDao dao = new CommentDao();
		
		dao.insertComment(dto);
	}
	
	public String searchBoard_nic(CommentDto dto){//등록된 댓글을 어느 게시판에 등록했는지 확인.
		CommentDao dao = new CommentDao();
		
		String board_nic=dao.searchBoard_nic(dto);
		
		return board_nic.toString();
	}

}
