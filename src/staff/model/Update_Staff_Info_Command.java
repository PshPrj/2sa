package staff.model;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import mypage.model.Command;
import staff.db.Staff_Dto;
import staff.db.staff_Dao;

public class Update_Staff_Info_Command implements Command {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		String staff_num=req.getParameter("staff_num");
		staff_Dao dao=new staff_Dao();
		
		
		if(req.getParameter("type").equals("2")){
			
			String name=req.getParameter("name");
			String id=req.getParameter("id");
			String tel=req.getParameter("tel");
			String dept=req.getParameter("dept");
			
			String subsql=set_sql(name, id, tel, dept);
			
			dao.Update_Staffinfo(subsql,staff_num);

		}
		
		Vector<Staff_Dto> list=dao.get_StaffData(" where staff_num="+staff_num);
		
		
		req.setAttribute("list", list.get(0));
		return "/mypage/staff/member/modal/update_staff_info_modal.jsp";
	}
	
	public String set_sql(String name,String id,String tel,String dept){
		String sql="";
		
		if(!name.equals("")){
			sql+=" staff_name='"+name+"' , ";
		}
		
		if(!id.equals("")){
			sql+=" staff_id='"+id+"' , ";
		}
		
		if(!tel.equals("")){
			sql+=" staff_tel='"+tel+"' , ";
		}
		

			sql+=" dept_type="+dept;

		return sql;
	
	}

}


