package staff.model;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.StringTokenizer;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import mypage.model.Command;
import staff.db.Addr_Dto;
import staff.db.Staff_Dto;
import staff.db.Wasteitem_Dto;
import staff.db.staff_Dao;

public class Show_reservation_info_Command implements Command{

	staff_Dao dao = new staff_Dao();
	Addr_Dto to = new Addr_Dto();
	Addr_Dto from = new Addr_Dto();
	Wasteitem_Dto wast = new Wasteitem_Dto();


	public Vector<item_data> get_ItemList(String item_data) {

		Vector<item_data> list = new Vector<>();

		StringTokenizer st = new StringTokenizer(item_data, ",");
		int cnt = 0;
		while (st.hasMoreTokens()) {

			String item = st.nextToken();

			if (item.contains("[")) {

				if (cnt == 0) {
					int el = item.indexOf("el");
					int pk = item.indexOf("pk");
					int addr = item.indexOf("+");
					to.setEl(String.valueOf(item.charAt(el + 2)));
					to.setPk(String.valueOf(item.charAt(pk + 2)));
					to.setAddr(item.substring(addr + 1, item.length()).replace("]", ""));
					cnt++;
				} else {
					int el = item.indexOf("el");
					int pk = item.indexOf("pk");
					int addr = item.indexOf("+");
					from.setEl(String.valueOf(item.charAt(el + 2)));
					from.setPk(String.valueOf(item.charAt(pk + 2)));
					from.setAddr(item.substring(addr + 1, item.length()).replace("]", ""));
				}

			} else if (item.contains("버리는 물건")) {
				int first = item.indexOf("_");
				wast.setItem(item.substring(first + 1, item.length()));

			} else {

				item_data data = new item_data(item.replace("_", ""));
				list.add(data);
			}
		}

		return list;
	}
	
	
	
	
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
	
		String res_date = req.getParameter("res_date");
		String staff_num=req.getParameter("staff_num");
		
		Vector<Staff_Dto> staff_list = dao.get_StaffData(" where staff_num=" + staff_num);
		Staff_Dto staff = staff_list.get(0);
		req.setAttribute("staff", staff);
		
		Vector<item_data> item_list = get_ItemList(req.getParameter("content"));

		req.setAttribute("waste", wast);
		req.setAttribute("from", from);
		req.setAttribute("to", to);
		req.setAttribute("item_size", item_list.size());
		req.setAttribute("item_list", item_list);
		req.setAttribute("res_date", res_date);
		req.setAttribute("time", req.getParameter("time"));
		req.setAttribute("id",req.getParameter("id"));
		return "/mypage/staff/statistics/modal/show_detail_info.jsp";
	}

}
