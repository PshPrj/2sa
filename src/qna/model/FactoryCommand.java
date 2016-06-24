package qna.model;

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
		
		if(cmd.equals("POST")){
			return new QPostCommand();
		}else if(cmd.equals("POSTProc")){
			return new QPOSTProcCommand();
		}else if(cmd.equals("READ")){
			return new QReadCommand();
		}else if(cmd.equals("DELETE")){
			return new QDeleteCommand();
		}else if(cmd.equals("UPDATE")){
			return new QUpdateCommand();
		}else if(cmd.equals("UPDATEProc")){
			return new QUpdateProcCommand();
		}else if(cmd.equals("REPLY")){
			return new QReplyCommand();
		}else if(cmd.equals("REPLYProc")){
			return new QReplyProcCommand();
		}
		
		return null;
	}

}
