package staffpagecontroller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import mypage.model.Command;
import staff.model.CommandFactory_staff;



public class Staff_Controller extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);;
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("utf-8");
		String cmd = req.getParameter("cmd");
		
		String url = "";
		Command command = null;
		CommandFactory_staff factory = CommandFactory_staff.getInstance();
		
		
		try {
			command = factory.createCom(cmd);
			url = "../" + (String)command.processCommand(req, resp);
			req.setAttribute("staffpage", url);				
			
		} catch (SerialException e) {
			System.out.println("Servlet : " + e);
		}
		
		req.setAttribute("page", req.getAttribute("boaderpage"));
		
		
		RequestDispatcher view = req.getRequestDispatcher("main/index.jsp");
		view.forward(req, resp);
	}
}
