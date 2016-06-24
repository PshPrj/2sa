package staff.model;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import mypage.model.Command;
import staff.db.Site_info_Dto;
import staff.db.Stastiticsstaff_Dto;
import staff.db.staff_Dao;

public class Statisticsstaff_Command implements Command {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		staff_Dao dao = new staff_Dao();
		String subsql = "";
		Site_info_Dto dto = dao.get_SiteinfoData();

		String params = req.getParameter("params");
		String id = req.getParameter("id");
		String name = req.getParameter("name");
		String date1 = req.getParameter("date1");
		String date2 = req.getParameter("date2");
		String dept_name = req.getParameter("dept");


		if (params != null) {

			if (!id.equals("")) {

				subsql += " and staff_id like '%" + id + "%'";

			}

			if (!name.equals("")) {

				subsql += " and  staff_name like '%" + name + "%'";

			}

			if (!dept_name.equals("")) {
				subsql += " and  dept_name like '%" + dept_name + "%'";
			}

			if (!date1.equals("") && !date2.equals("")) {

				subsql += " and regi_date_staff >= '" + date1 + "' and  regi_date_staff <= '" + date2 + "'";

			} else if (!date1.equals("")) {

				subsql += " and regi_date_staff >= '" + date1 + "'";

			} else if (!date2.equals("")) {

				subsql += " and regi_date_staff <= '" + date2 + "'";

			}
		}

		Vector<Stastiticsstaff_Dto> list = dao.get_StaffStastitics(subsql);

		int sum_staff = list.size();
		int dept_sum[] = { sum_staff, 0, 0, 0, 0 };

		for (int i = 0; i < list.size(); i++) {
			Stastiticsstaff_Dto data = list.get(i);

			if (data.getDept_type() == 1) {
				dept_sum[1] += 1;
			} else if (data.getDept_type() == 2) {
				dept_sum[2] += 1;
			} else if (data.getDept_type() == 3) {
				dept_sum[3] += 1;
			} else if (data.getDept_type() == 4) {
				dept_sum[4] += 1;
			}

		
		}

		req.setAttribute("data", dto);
		req.setAttribute("list", list);
		req.setAttribute("sum", dept_sum);
		req.setAttribute("boardpage", "STATISTICS_STAFF");
		return "mypage/staff/statistics/content/staff_statistics_content.jsp";
	}

}
