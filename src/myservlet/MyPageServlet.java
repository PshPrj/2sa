package myservlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import mypage.model.Command;
import mypage.model.CommandFactory;

public class MyPageServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String cmd = req.getParameter("cmd");
		String url = "";
		Command command = null;
		
		CommandFactory factory = CommandFactory.getInstance();
		command = factory.createCom(cmd);
		
		try {
			url = "../" + (String)command.processCommand(req, resp);
		} catch (SerialException e) {
			System.out.println("Servlet : " + e);
		}
		
		req.setAttribute("mypage", url);
		req.setAttribute("boardpage", req.getAttribute("boardpage"));
		RequestDispatcher view = req.getRequestDispatcher("main/index.jsp");
		System.out.println(url+"servlet");
		view.forward(req, resp);
	}
}
