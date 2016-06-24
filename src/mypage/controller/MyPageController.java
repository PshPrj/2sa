package mypage.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import mypage.model.Command;
import mypage.model.CommandFactory;

public class MyPageController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		RequestDispatcher view = null;
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
		
		if(cmd.equals("pay_modal")) {
			view = req.getRequestDispatcher("mypage/member/pay_modal.jsp");
		} else if(cmd.equals("refund_modal")) {
			view = req.getRequestDispatcher("mypage/member/refund_modal.jsp");
		} else if(cmd.equals("payConfirm") || cmd.equals("refundRequest")) {
			return;
		} else if(cmd.equals("modify_proc")) {
			view = req.getRequestDispatcher("mypage/member/modify_success.jsp");
		} else {
			view = req.getRequestDispatcher("main/index.jsp");
		}
		System.out.println(url+"servlet");
		view.forward(req, resp);
	}
}
