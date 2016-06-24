package model;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialException;

import dao.Mypage_dao;
import dto.Container_info_Dto;

public class Container_manager implements Command {
	
	int totalRecord = 0; //��ü ���ǰ����� ������
	int numPerpage = 5;//���������� �ѷ��� ���� ����
	int pagePerBlock = 5; //������ �̵�(������ : ���� 10������, ���� 10������ �̷�������)
	//���⼭�� 3�������� �ϳ���
	int totalPage = 0; //��ü �� ��������
	int totalBlock = 0;
	int nowPage = 0;//���� �������� ��ġ
	int nowBlock = 0;
	int beginPerPage = 0; //�������� ���۹�ȣ(1����5, 6����10...-)
	
	

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
	
		Mypage_dao dao=new Mypage_dao();
		Vector<Container_info_Dto> list=dao.getContainerData();
		
		totalRecord = list.size();
		totalPage = ((int)Math.ceil((double)totalRecord/numPerpage));

		if(req.getParameter("nowPage") != null)
			nowPage = Integer.parseInt(req.getParameter("nowPage"));

		if(req.getParameter("nowBlock") != null)
			nowBlock = Integer.parseInt(req.getParameter("nowBlock"));

		totalBlock = ((int)Math.ceil((double)totalPage/pagePerBlock));

		beginPerPage = nowPage * numPerpage;
		
		req.setAttribute("totalRecord", totalRecord);
		req.setAttribute("totalPage",totalPage);
		req.setAttribute("nowPage",nowPage);
		req.setAttribute("nowBlock",nowBlock);
		req.setAttribute("totalBlock", totalBlock);
		req.setAttribute("beginPerPage", beginPerPage);
		req.setAttribute("con_data", list);
		
		return "./staff/container/container_manager.jsp";
	}

}
