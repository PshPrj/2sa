package notice.model;

import board.model.Command;

public class FactoryCommand {//�ν��Ͻ� ������ ���ô� Ŭ����.
	//Factory������ �⺻ ���� : �̱��� �����̾�� �Ѵ�.
	
	private FactoryCommand(){}
	private static FactoryCommand instance = new FactoryCommand();
	
	public static FactoryCommand newInstance(){
		return instance;
	}
	
	public Command createCommand(String cmd){
		
		if(cmd.equals("NPOST")){
			return new NPostCommand();
		}else if(cmd.equals("POSTProc")){
			return new NPOSTProcCommand();
		}else if(cmd.equals("READ")){
			return new NReadCommand();
		}else if(cmd.equals("DELETE")){
			return new NDeleteCommand();
		}else if(cmd.equals("UPDATE")){
			return new NUpdateCommand();
		}else if(cmd.equals("UPDATEProc")){
			return new NUpdateProcCommand();
		}
		
		return null;
	}

}
