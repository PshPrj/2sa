package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import model.Calendar;
import model.Command;
import model.Container_manager;

public class MyPage_Controller extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("euc-kr");
		resp.setCharacterEncoding("euc-kr");

		String cmd = req.getParameter("cmd");
		String url = "";

		Command command;

		try {
				if (cmd.equals("CALENDAR")) {
					command = new Calendar();
					url = (String) command.processCommand(req, resp);
				}else if(cmd.equals("CONTAINER")){
					command = new Container_manager();
					url = (String) command.processCommand(req, resp);
				}
				
			} catch (SerialException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		

		RequestDispatcher views = req.getRequestDispatcher(url);
		views.forward(req, resp);

	}

}
