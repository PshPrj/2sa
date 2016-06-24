package staff.model;

import mypage.model.AssignmentCommand;
import mypage.model.Command;
import mypage.model.CommandFactory;
import mypage.model.FloorplanCommand;
import mypage.model.MyModifyCommand;
import mypage.model.PayCommand;
import mypage.model.ProgressCommand;
import mypage.model.ReservationCommand;
import mypage.model.StuffCommand;

public class CommandFactory_staff {
	
	
		private static CommandFactory_staff instance = new CommandFactory_staff(); 
		
		private CommandFactory_staff(){};
		
		public static CommandFactory_staff getInstance() {
			return instance;
		}
		
		public Command createCom(String cmd) {
			
			System.out.println(cmd);			
			
			if(cmd.equals("CALENDAR")) {
				return new Calendar_Command();
			}else if(cmd.equals("MEMBER")){
				return new Member_Command();
			}else if(cmd.equals("PROGRESS")){
				return new Progress_Command();
			}else if(cmd.equals("TRUCK")){
				return new Truck_Command();
			}else if(cmd.equals("CONTAINER")){
				return new Container_Command();
			}else if(cmd.equals("PAYMENT")){
				return new Payment_Command();
			}else if(cmd.equals("STATISTICS")){
				return new Stastitics_Command();
			}else if(cmd.equals("CONTAINER_RESERVATION")){
				return new Container_reservation_Command();
			}else if(cmd.equals("TRUCK_RESERVATION")){
				return new Truck_reservation_Command();
			}else if(cmd.equals("REGISTERTRUCK")){
				return new Truck_Register_Command();
			}else if(cmd.equals("STAFF_MANAGER")){
				return new Staffmanager_Command();
			}else if(cmd.equals("PAYMENT_WAIT")){
				return new Paymentwait_Command();
			}else if(cmd.equals("PAYMENT_CONFIRM")){
				return new Paymentconfirm_Command();
			}else if(cmd.equals("PAYMENT_REFUND")){
				return new Paymentrefund_Command();
			}else if(cmd.equals("STATISTICS_CLIENT")){
				return new Statisticsclient_Command();
			}else if(cmd.equals("STATISTICS_STAFF")){
				return new Statisticsstaff_Command();
			}else if(cmd.equals("STATISTICS_CONTAINER")){
				return new Statisticscontainer_Command();
			}else if(cmd.equals("STATISTICS_TRUCK")){
				return new Statisticstruck_Command();
			}else if(cmd.equals("CALENDAR_DATA")){
				return new CalendarData_Command();
			}else if(cmd.equals("DELETE_TRUCK")){
				return new Delete_Truck_Command();
			}else if(cmd.equals("DELETE_STAFF")){
				return new Delete_Staff_Command();
			}else if(cmd.equals("DELETECONTAINER")){
				return new Delete_Container_Command();
			}
			
			return null;
		}
	
}
