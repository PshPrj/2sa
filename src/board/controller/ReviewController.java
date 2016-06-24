/*

 	��� : ��ȿ��
	���� ���� ���� : 6/17
	���� �Խ��� ��Ʈ�ѷ�

 */

package board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import board.model.Command;
import review.model.FactoryCommand;

public class ReviewController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req,resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("euc-kr");
		resp.setCharacterEncoding("euc-kr");
		
		String cmd=req.getParameter("cmd");	
		System.out.println(cmd+"reviewCONTROLLER");
		
		String url=null;
		Command command = null;
		
		FactoryCommand factory = FactoryCommand.newInstance();
        command = factory.createCommand(cmd);
		
		try {
			url=(String)command.processCommand(req, resp);
		} catch (SerialException e) {
			System.out.println("reviewController ���� : "+e);
		}
	
		RequestDispatcher view = req.getRequestDispatcher("main/index.jsp");
		System.out.println(url+"ReviewCONTROLLER URL");
		req.setAttribute("page", url);
		view.forward(req, resp);
	}
	
}
