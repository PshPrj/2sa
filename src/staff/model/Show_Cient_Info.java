package staff.model;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import mypage.model.Command;
import staff.db.Member_reservation_info;
import staff.db.Memeber_Detail_Dto;
import staff.db.staff_Dao;

public class Show_Cient_Info implements Command {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		String member_num=req.getParameter("num");
		
		staff_Dao dao=new staff_Dao();
		
		Memeber_Detail_Dto dto=dao.get_MemberDetailData(member_num);
		
		Vector<Member_reservation_info> list=dao.get_MemberreservationData(member_num);
		
		for(int i=0;i<list.size();i++){
			list.get(i).setEstimate_content(list.get(i).getEstimate_content().replace("_", " "));
		}
		
		req.setAttribute("list_size", list.size());
		req.setAttribute("list", list);
		req.setAttribute("dto",dto);
		return "/mypage/staff/member/modal/show_client_info_modal.jsp";
	}

}
