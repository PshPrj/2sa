package staff.model;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;
import javax.swing.plaf.synth.SynthSeparatorUI;

import mypage.model.Command;
import staff.db.Container_Dto;
import staff.db.staff_Dao;

public class Container_Command implements Command{

	int totalRecord = 0; //전체 글의갯수를 가져옴
	int numPerpage = 6;//한페이지당 뿌려질 글의 갯수
	int pagePerBlock = 5; //페이지 이동(블럭단위 : 이전 10페이지, 다음 10페이지 이런식으로)
	//여기서는 3페이지를 하나로
	int totalPage = 0; //전체 몇 페이지냐
	int totalBlock = 0;
	int nowPage = 0;//현재 페이지의 위치
	int nowBlock = 0;
	int beginPerPage = 0; //페이지의 시작번호(1부터5, 6부터10...

	staff_Dao dao=new staff_Dao();
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		
		
		Vector<Container_Dto> data=dao.get_ContainerData(1,"");
		
		if(req.getParameter("nowPage") != null){			
			nowPage = Integer.parseInt(req.getParameter("nowPage"));
			beginPerPage=(nowPage-1)*numPerpage;
		}
			
		
		if(req.getParameter("nowBlock") != null){
			nowBlock = Integer.parseInt(req.getParameter("nowBlock"));
		}
		
		totalRecord=data.size();
		
		Vector<Container_Dto> list=new Vector<>();
		
		for(int i=beginPerPage;i<beginPerPage+numPerpage;i++){
			
			if(i==totalRecord){
				break;
			}
			
			list.add(data.get(i));

		}
		
		totalPage = ((int)Math.ceil((double)totalRecord/numPerpage));
		
		
		totalBlock=((int)Math.ceil((double)totalPage/pagePerBlock));
		
		
		
		req.setAttribute("nowPage", nowPage);
		req.setAttribute("nowBlock", nowBlock);
		req.setAttribute("list", list);
		req.setAttribute("list_size", list.size());
		req.setAttribute("beginPerPage",beginPerPage);
		req.setAttribute("totalRecord", totalRecord);
		req.setAttribute("totalPage", totalPage);
		req.setAttribute("totalBlock", totalBlock);
		req.setAttribute("pagePerBlock", pagePerBlock);
		req.setAttribute("boardpage","CONTAINER");
		return "mypage/staff/container/container_manager.jsp";
	}
	
	

}
