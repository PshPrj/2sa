package staffpagecontroller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import mypage.model.Command;
import staff.model.AllContainerResetvation_Command;
import staff.model.AllTruckreservation_modal_Command;
import staff.model.Assign_Reservation_Command;
import staff.model.Container_Itemlist_Command;
import staff.model.Container_Status_Command;
import staff.model.Current_Reservation_truck_Command;
import staff.model.Insert_Truck_Command;
import staff.model.Member_Detail_Info_Command;
import staff.model.Payment_Approve_modal_Command;
import staff.model.Refund_Modal_Command;
import staff.model.Register_Container_Command;
import staff.model.Register_Staff_Command;
import staff.model.Show_Cient_Info;
import staff.model.Show_progress_Command;
import staff.model.Show_reservation_info_Command;
import staff.model.Staff_Detail_Info_Command;
import staff.model.Staff_Info_Command;
import staff.model.Truck_Register_Command;
import staff.model.Truck_status_Command;
import staff.model.UpdateTruckStaff_Command;
import staff.model.UpdateTruck_Command;
import staff.model.Update_Staff_Info_Command;
import staff.model.Updatemovestatus_Command;

public class Modal_Controller extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String cmd = req.getParameter("cmd");
		String url = "";
		Command command = null;

		try {

			if (cmd.equals("TRUCKSTATUS")) {
				command = new Truck_status_Command();
			} else if (cmd.equals("UPDATE_TRUCK_STAFF")) {
				command = new UpdateTruckStaff_Command();
			} else if (cmd.equals("UPDATE_TRUCK_INFO")) {
				command = new UpdateTruck_Command();
			} else if (cmd.equals("REGISTER_TRUCK")) {
				command = new Truck_Register_Command();
			} else if (cmd.equals("REGISTER_TRUCK_DB")) {
				command = new Insert_Truck_Command();
			} else if (cmd.equals("ALL_TRUCK_INFO")) {
				command = new AllTruckreservation_modal_Command();
			} else if (cmd.equals("SHOW_PROGRESS")) {
				command = new Show_progress_Command();
			} else if (cmd.equals("UPDATE_MOVE_STATUS")) {
				command = new Updatemovestatus_Command();
			} else if (cmd.equals("CURRENTRESTURCK")) {
				command = new Current_Reservation_truck_Command();
			} else if (cmd.equals("CLIENT_INFO")) {
				command = new Show_Cient_Info();
			} else if (cmd.equals("STAFF_INFO")) {
				command = new Staff_Info_Command();
			} else if (cmd.equals("UPDATESTAFF_INFO")) {
				command = new Update_Staff_Info_Command();
			} else if (cmd.equals("PAYMENTAPPROVE_MODAL")) {
				command = new Payment_Approve_modal_Command();
			} else if (cmd.equals("ASSIGN_RESERVATION")) {
				command = new Assign_Reservation_Command();
			} else if (cmd.equals("REFUNDMODAL")) {
				command = new Refund_Modal_Command();
			} else if (cmd.equals("REGISTER_CON")) {
				command = new Register_Container_Command();
			}else if(cmd.equals("CONTAINERSTATUS")){
				command=new Container_Status_Command();
			}else if(cmd.equals("ALL_CONRESERVATION")){
				command=new AllContainerResetvation_Command(); 
			}else if(cmd.equals("ITEMLIST_CONTAINER")){
				command=new Container_Itemlist_Command();
			}else if(cmd.equals("REGISTER_STAFF")){
				command=new Register_Staff_Command();
			}else if(cmd.equals("SHOWRESERVATIONINFO")){
				command=new Show_reservation_info_Command();
			}else if(cmd.equals("MEMBERDETAIL")){
				command=new Member_Detail_Info_Command();
			}else if(cmd.equals("STAFFDETAIL")){
				command=new Staff_Detail_Info_Command();
			}

			url = (String) command.processCommand(req, resp);
			System.out.println(url);

		} catch (SerialException e) {
			System.out.println("Servlet : " + e);
		}

		RequestDispatcher view = req.getRequestDispatcher(url);
		view.forward(req, resp);
	}

}
