package drawing.model;

import board.model.Command;

public class FactoryCommand {//인스턴스 생성을 도맡는 클래스.
	//Factory패턴의 기본 조건 : 싱글톤 패턴이어야 한다.
	
	private FactoryCommand(){}
	private static FactoryCommand instance = new FactoryCommand();
	
	public static FactoryCommand newInstance(){
		return instance;
	}
	
	public Command createCommand(String cmd){
		System.out.println("드로잉 커맨드팩토리"+cmd);
		
		if(cmd.equals("D_1")){
			return new Drawing_1Command();
		}else if(cmd.equals("D_2")){
			return new Drawing_2Command();
		}
		
		return null;
	}

}
