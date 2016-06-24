/*

 	담당 : 정효진
	최종 수정 일자 : 6/19
	견적 저장을 위한 컨트롤러.

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
import estimate.model.FactoryCommand;
import move.db.EstimateDto;

public class EstimateController extends HttpServlet{
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
	 
		
		//사진 저장 시 이를 담당하는 부분.
		if(type.contains("multipart/form-data")){
		   int postMaxSize = 10 * 1024 * 1024;
		   String folderPath =req.getServletContext().getRealPath("upload/estimate"); // 파일이 저장될 경로 (19일 수정)
		   String encoding = "UTF-8";
		   ArrayList filePath = new ArrayList();
		   Enumeration enumer=null;
	    	MultipartRequest multiReq = new MultipartRequest(req, folderPath,
	            postMaxSize, encoding, new DefaultFileRenamePolicy());
	    	
	    	enumer=multiReq.getFileNames();
	    	
	    	ArrayList fileNameList = new ArrayList();//파일 이름 저장
	    	
	    	int i=0;
	    	while(enumer.hasMoreElements()){
	    		String name = (String)enumer.nextElement();
	    		fileNameList.add(multiReq.getFilesystemName(name));
	    	}
	    	
	    	
	    	//견적을 통해 알아낸 주소, 거리, 가격 정보를 dto에 담는다.
	    	EstimateDto dto = new EstimateDto();
	    	dto.setDistance(Double.parseDouble(multiReq.getParameter("distance")));
	    	dto.setAddr1(multiReq.getParameter("addr1"));
	    	dto.setAddr2(multiReq.getParameter("addr2"));
	    	dto.setEstimate_content(multiReq.getParameter("DataArray"));
	    	dto.setPre_price(Integer.parseInt(multiReq.getParameter("price")));
	    	dto.setMember_num(Integer.parseInt(multiReq.getParameter("member_num")));
	    	req.setAttribute("dto",dto);
	    	
	    	req.setAttribute("fileNameList", fileNameList);

	    	cmd=multiReq.getParameter("cmd");

	   }
	    
	  
		
		System.out.println(cmd+"estimateCONTROLLER");
		
		String url=null;
		Command command = null;
		
		FactoryCommand factory = FactoryCommand.newInstance();
        command = factory.createCommand(cmd);
		
		try {
			url=(String)command.processCommand(req, resp);
		} catch (SerialException e) {
			System.out.println("EstimateController 에러 : "+e);
		}
	
		RequestDispatcher view = req.getRequestDispatcher("main/index.jsp");
		System.out.println(url+"estimateCONTROLLER URL");
		req.setAttribute("page", url);

		req.setAttribute("JsonData", req.getAttribute("JsonData"));
		view.forward(req, resp);
	}
}
