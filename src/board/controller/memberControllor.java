package board.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialException;

import register.model.command;
import register.model.completeCommand;
import register.model.confirmCommand;
import register.model.findCommand;
import register.model.idcheckCommand;
import register.model.logCommand;
import register.model.registerCommand;
import register.model.registerDto;
import register.model.testCommand;

public class memberControllor extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("euc-kr");
		resp.setCharacterEncoding("euc-kr");
		
		String ur ="";
		String cmd = req.getParameter("cmd");
		command command = null;
		
		if(cmd.equals("LOG")){
			command = new logCommand();
		}
		else if(cmd.equals("AGREE")){
			command = new registerCommand();
		}
		else if(cmd.equals("CONFIRM")){
			command = new confirmCommand();
		}
		else if(cmd.equals("COMPLETE")){
			command = new completeCommand();
		}
		else if(cmd.equals("LW")){
			command = new testCommand();
		}
		else if(cmd.equals("FIND")){
			command = new findCommand();
		}
		else if(cmd.equals("LAP")){
			command = new idcheckCommand();
		}
		
		try {
			ur = (String)command.processCommand(req, resp);
		} catch (SerialException e) {	}
		
		RequestDispatcher view = req.getRequestDispatcher(ur);
		view.forward(req, resp);
	}
}
