/*

 	담당 : 정효진
	최종 수정 일자 : 6/4
	각 게시판으로 넘어갈 수 있도록 제작된 컨트롤러

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
import board.model.FactoryCommand;

public class BoardController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("euc-kr");
		resp.setCharacterEncoding("euc-kr");

		String cmd=req.getParameter("cmd");//원하는 페이지로 이동하기 위해 각기 다른 값을 받는다.
		
		String url=null;
		Command command = null;
		
		board.model.FactoryCommand factory = board.model.FactoryCommand.newInstance();
        command = factory.createCommand(cmd);
        System.out.println(cmd+"boardcontroller");
		
		
		try {
			url=(String)command.processCommand(req, resp);
		} catch (SerialException e) {
			System.out.println("BoardController 에러 : "+e);
		}
	
		RequestDispatcher view = req.getRequestDispatcher("main/index.jsp");
		System.out.println(url+"BOARDCONTROLLER URL");
		req.setAttribute("page", url);//boardpage의 값을 넘긴다.
		view.forward(req, resp);
	}
	
}
