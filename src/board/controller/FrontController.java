/*

 	��� : ��ȿ��
	���� ���� ���� : 6/4
	�Խ��� �̵��� ���� ù ��° ��Ʈ�ѷ�.

 */

package board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import main.model.CalendarData_Main_Command;
import main.model.Calendar_Command;
import model.Calendar;
import mypage.model.Command;


public class FrontController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("euc-kr");
		resp.setCharacterEncoding("euc-kr");
		
		String cmd=req.getParameter("cmd");	
		String url=null;
		
		Command command;
		
		//�� �Խ����� ���� ù ��° �������� �̵��� �� �ֵ��� ���� �ޤ����.
		if(cmd.equals("INTRODUCE")){
			url="/board.do?cmd=INTRODUCE";
		}else if(cmd.equals("HISTORY")){
			url="/board.do?cmd=HISTORY";
		}else if(cmd.equals("NOTICE")){
			url="/board.do?cmd=NOTICE";
		}else if(cmd.equals("DRAWING")){
			url="/board.do?cmd=DRAWING";
		}else if(cmd.equals("ESTIMATE")){
			url="/board.do?cmd=ESTIMATE";
		}else if(cmd.equals("RESERVATION")){
			url="/board.do?cmd=RESERVATION";
		}else if(cmd.equals("REVIEW")){
			url="/board.do?cmd=REVIEW";
		}else if(cmd.equals("QNA")){
			url="/board.do?cmd=QNA";
		}else if(cmd.equals("GUIDANCE")){
			url="/board.do?cmd=GUIDANCE";
		}else if(cmd.equals("CALENDAR")){
			command=new Calendar_Command();
			try {
				url=(String) command.processCommand(req, resp);				
				System.out.println(url);
			} catch (SerialException e) {
				e.printStackTrace();
			}
		}else if(cmd.equals("CALENDAR_DATA_MAIN")){
			command=new CalendarData_Main_Command();
			try {
				url=(String) command.processCommand(req, resp);				
				System.out.println(url+"ddkk");
			} catch (SerialException e) {
				e.printStackTrace();
			}
		}
	
		
		RequestDispatcher view = req.getRequestDispatcher(url);
		view.forward(req, resp);	
		
	}
	
}
