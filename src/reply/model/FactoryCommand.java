package reply.model;

import board.model.Command;

public class FactoryCommand {//�ν��Ͻ� ������ ���ô� Ŭ����.
	//Factory������ �⺻ ���� : �̱��� �����̾�� �Ѵ�.
	
	private FactoryCommand(){}
	private static FactoryCommand instance = new FactoryCommand();
	
	public static FactoryCommand newInstance(){
		return instance;
	}
	
	public Command createCommand(String cmd){
		System.out.println(cmd);
		
		if(cmd.equals("C_1")){
			return new CPOSTCommand();
		}else if(cmd.equals("CDELETE")){
			return new CDELETECommand();
		}else if(cmd.equals("CUPDATE")){
			return new CUPDATECommand();
		}else if(cmd.equals("CCANCEL")){
			return new CCANCELCommand();
		}
		
		return null;
	}

}
