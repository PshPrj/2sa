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
import staff.db.Calendarinfo_Dto;
import staff.db.Container_Dto;
import staff.db.Staff_Dto;
import staff.db.Truck_Dto;
import staff.db.Wasteitem_Dto;
import staff.db.staff_Dao;

public class CalendarInfo_Command implements Command {

	staff_Dao dao = new staff_Dao();
	Addr_Dto to = new Addr_Dto();
	Addr_Dto from = new Addr_Dto();
	Wasteitem_Dto wast = new Wasteitem_Dto();

	public boolean Check_Date(String date) {
		try {
			SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");

			Date get_date = fmt.parse(date);
			Calendar cal1 = Calendar.getInstance();
			Calendar cal2 = Calendar.getInstance();

			cal1.setTime(new Date());
			cal2.setTime(get_date);

			if (cal2.compareTo(cal1) <= 0) {
				return true;
			} else {
				return false;
			}
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

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

		String res_num = req.getParameter("res_num");
		String res_date = req.getParameter("res_date");
		String member_name = req.getParameter("member_name");
		String member_id = req.getParameter("member_id");

		if (Check_Date(res_date)) {
			req.setAttribute("is_past", "false");

		} else {
			req.setAttribute("is_past", "true");
		}

		Calendarinfo_Dto dto = dao.get_CalendarInfoData(res_num);

		Vector<Truck_Dto> truck = dao.get_TruckData(1, " where truck_num=" + dto.getTruck_num());
		req.setAttribute("truck", truck.get(0));
		Vector<Container_Dto> container = dao.get_ContainerData(2, " where container_num=" + dto.getCon_num());

		if (container.size() != 0) {
			req.setAttribute("container", container.get(0));
		}
		if (dto.getStaff_num() != 0) {
			Vector<Staff_Dto> staff_list = dao.get_StaffData(" where staff_num=" + dto.getStaff_num());
			Staff_Dto staff = staff_list.get(0);
			req.setAttribute("staff", staff);
		}
		Vector<item_data> item_list = get_ItemList(dto.getEstimate_content());

		req.setAttribute("waste", wast);
		req.setAttribute("from", from);
		req.setAttribute("to", to);
		req.setAttribute("item_size", item_list.size());
		req.setAttribute("item_list", item_list);

		req.setAttribute("res_date", res_date);
		req.setAttribute("member_name", member_name);
		req.setAttribute("member_id", member_id);
		req.setAttribute("time", dto.getTime());
		req.setAttribute("price", dto.getPrice());
		return "mypage/staff/main/content/info_data.jsp";
	}

}
