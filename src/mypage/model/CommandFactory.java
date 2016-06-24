package mypage.model;

public class CommandFactory {
	private static CommandFactory instance = new CommandFactory();

	private CommandFactory() {
	};

	public static CommandFactory getInstance() {
		return instance;
	}

	public Command createCom(String cmd) {
		if (cmd.equals("floorplan")) {
			return new FloorplanCommand();
		} else if (cmd.equals("reservation")) {
			return new ReservationCommand();
		} else if (cmd.equals("pay")) {
			return new PayCommand();
		} else if (cmd.equals("progress")) {
			return new ProgressCommand();
		} else if (cmd.equals("stuffList")) {
			return new StuffCommand();
		} else if (cmd.equals("assignment")) {
			return new AssignmentCommand();
		} else if (cmd.equals("pay_modal")) {
			return new PayModalCommand();
		} else if (cmd.equals("payConfirm")) {
			return new PayConfirmCommand();
		} else if (cmd.equals("refund_modal")) {
			return new RefundModalCommand();
		} else if (cmd.equals("refundRequest")) {
			return new RefundRequestCommand();
		} else if (cmd.equals("mymain")) {
			return new MyModifyCommand();
		} else if(cmd.equals("modify")) {
			return new MyModifyCommand2();
		} else if (cmd.equals("modify_proc")) {
			return new MyModifyCommand3();
		}
		return null;
	}
}
