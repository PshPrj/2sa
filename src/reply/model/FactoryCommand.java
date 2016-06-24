package reply.model;

import board.model.Command;

public class FactoryCommand {//인스턴스 생성을 도맡는 클래스.
	//Factory패턴의 기본 조건 : 싱글톤 패턴이어야 한다.
	
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
