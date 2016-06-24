/*

 	담당 : 정효진
	최종 수정 일자 : 6/20
	게시판 수정사항을 위한 컨트롤러

 */

package board.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FileRenamePolicy;

import board.model.Command;
import estimate.update.model.FactoryCommand;
import move.db.EstimateDto;

public class EstimateUpdateController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		String type=req.getContentType();
		
		String cmd=req.getParameter("cmd");	
	 
		if(type.contains("multipart/form-data")){
		   int postMaxSize = 10 * 1024 * 1024;
		   String folderPath =req.getServletContext().getRealPath("upload/estimate"); // 파일이 저장될 경로
		   String encoding = "UTF-8";
		   ArrayList filePath = new ArrayList();
		   Enumeration enumer=null;
	    	MultipartRequest multiReq = new MultipartRequest(req, folderPath,
	            postMaxSize, encoding, new DefaultFileRenamePolicy());
	    	
	    	enumer=multiReq.getFileNames();
	    	ArrayList fileNameList = new ArrayList();
	    	
	    	int i=0;
	    	while(enumer.hasMoreElements()){
	    		String name = (String)enumer.nextElement();
	    		fileNameList.add(multiReq.getFilesystemName(name));
	    	}
	    	
	    	
	    	//수정 사항을 dto에 저장.
	    	EstimateDto dto = new EstimateDto();
	    	dto.setDistance(Double.parseDouble(multiReq.getParameter("distance")));
	    	dto.setAddr1(multiReq.getParameter("addr1"));
	    	dto.setAddr2(multiReq.getParameter("addr2"));
	    	dto.setEstimate_content(multiReq.getParameter("DataArray"));
	    	dto.setPre_price(Integer.parseInt(multiReq.getParameter("price")));
	    	dto.setMember_num(Integer.parseInt(multiReq.getParameter("member_num")));
	    	dto.setEstimate_board_num(Integer.parseInt((String)multiReq.getParameter("estimate_board_num")));
	    	req.setAttribute("dto",dto);
	    	req.setAttribute("picture_list", multiReq.getParameter("picture_list"));
	    	req.setAttribute("picture_name", multiReq.getParameter("picture_name"));
	    	
	    	req.setAttribute("fileNameList", fileNameList);

	    	cmd=multiReq.getParameter("cmd");

	   }
	    
	  
		
		System.out.println(cmd+"estimateUpdateCONTROLLER");
		
		String url=null;
		Command command = null;
		
		FactoryCommand factory = FactoryCommand.newInstance();
        command = factory.createCommand(cmd);
		
		try {
			url=(String)command.processCommand(req, resp);
		} catch (SerialException e) {
			System.out.println("EstimateUpdateController 에러 : "+e);
		}
	
		RequestDispatcher view = req.getRequestDispatcher("main/index.jsp");
		System.out.println(url+"estimateUpdateCONTROLLER URL");
		req.setAttribute("page", url);

		req.setAttribute("JsonData", req.getAttribute("JsonData"));
		req.setAttribute("estimate_content", req.getAttribute("estimate_content"));
		view.forward(req, resp);
	}
}
