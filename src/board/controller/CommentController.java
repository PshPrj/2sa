/*

 	��� : ��ȿ��
	���� ���� ���� : 6/16
	��� ��Ʈ�ѷ�

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
import reply.model.FactoryCommand;

public class CommentController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		
		String cmd=req.getParameter("cmd");	
		System.out.println(cmd+"commentCONTROLLER");
		
		String url=null;
		Command command = null;
		
		FactoryCommand factory = FactoryCommand.newInstance();
        command = factory.createCommand(cmd);
		
		try {
			url=(String)command.processCommand(req, resp);
		} catch (SerialException e) {
			System.out.println("commentController ���� : "+e);
		}
	
		RequestDispatcher view = req.getRequestDispatcher("main/index.jsp");
		System.out.println(url+"commentCONTROLLER URL");
		
		
		//���� �ٸ� �Խ��ǿ� ��ϵ� ��۵��� �����ϱ� ���� ��.
		if(url.equals("NOTICE")){
			req.setAttribute("page", "NOTICE");
		}else if(url.equals("QNA")){
			req.setAttribute("page", "QNA");
		}else if(url.equals("REVIEW")){
			req.setAttribute("page", "REVIEW");
		}

		view.forward(req, resp);
	}
	

}
