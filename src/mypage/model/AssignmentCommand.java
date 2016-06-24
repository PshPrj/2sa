package mypage.model;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import mypage.db.MyPageDao;
import mypage.db.TruckContainerDto;

public class AssignmentCommand implements Command {
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		req.setAttribute("boardpage","ASSIGNMENT");
		MyPageDao dao = new MyPageDao(Integer.parseInt(req.getSession().getAttribute("member_num").toString()));
		ArrayList<TruckContainerDto> truckList = dao.getTruckList();
		ArrayList<TruckContainerDto> containerList = dao.getContainerList();
		
		req.setAttribute("truckList", truckList);
		req.setAttribute("containerList", containerList);
		return "mypage/member/assignment.jsp";
	}
}
