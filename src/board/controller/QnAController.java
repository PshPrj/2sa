/*

 	담당 : 정효진
	최종 수정 일자 : 6/16
	qna 게시판 컨트롤러.

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
import qna.model.FactoryCommand;

public class QnAController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		
		String cmd=req.getParameter("cmd");	
		System.out.println(cmd+"qnaCONTROLLER");
		
		String url=null;
		Command command = null;
		
		FactoryCommand factory = FactoryCommand.newInstance();
        command = factory.createCommand(cmd);
		
		
		try {
			url=(String)command.processCommand(req, resp);
		} catch (SerialException e) {
			System.out.println("QnAController 에러 : "+e);
		}
	
		RequestDispatcher view = req.getRequestDispatcher("main/index.jsp");
		System.out.println(url+"qnaCONTROLLER URL");
		req.setAttribute("page", url);
		view.forward(req, resp);
	}
	
}
