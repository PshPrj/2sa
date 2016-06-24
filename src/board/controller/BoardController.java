/*

 	��� : ��ȿ��
	���� ���� ���� : 6/4
	�� �Խ������� �Ѿ �� �ֵ��� ���۵� ��Ʈ�ѷ�

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

		String cmd=req.getParameter("cmd");//���ϴ� �������� �̵��ϱ� ���� ���� �ٸ� ���� �޴´�.
		
		String url=null;
		Command command = null;
		
		board.model.FactoryCommand factory = board.model.FactoryCommand.newInstance();
        command = factory.createCommand(cmd);
        System.out.println(cmd+"boardcontroller");
		
		
		try {
			url=(String)command.processCommand(req, resp);
		} catch (SerialException e) {
			System.out.println("BoardController ���� : "+e);
		}
	
		RequestDispatcher view = req.getRequestDispatcher("main/index.jsp");
		System.out.println(url+"BOARDCONTROLLER URL");
		req.setAttribute("page", url);//boardpage�� ���� �ѱ��.
		view.forward(req, resp);
	}
	
}
