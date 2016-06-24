package staffpagecontroller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import main.model.CalendarData_Main_Command;
import mypage.model.Command;
import staff.model.CalendarData_Command;
import staff.model.CalendarInfo_Command;


public class Calendar_Controller extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String cmd = req.getParameter("cmd");
		System.out.println(cmd);
		String url = "";
		
		try {

			if(cmd.equals("CALENDAR_DATA")){
				CalendarData_Command command=new CalendarData_Command();
				url = "./" + (String)command.processCommand(req, resp);
			}else if(cmd.equals("CALENDAR_INFO")){
				CalendarInfo_Command command=new CalendarInfo_Command();
				url = "./" + (String)command.processCommand(req, resp);
			}
			
		} catch (SerialException e) {
			System.out.println("Servlet : " + e);
		}
		resp.setContentType("application/json");
		resp.setCharacterEncoding("utf-8");
		RequestDispatcher view = req.getRequestDispatcher(url);
		view.forward(req, resp);
	}

	
	
}
