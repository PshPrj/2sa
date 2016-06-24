package notice.model;

import board.model.Command;

public class FactoryCommand {//인스턴스 생성을 도맡는 클래스.
	//Factory패턴의 기본 조건 : 싱글톤 패턴이어야 한다.
	
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
