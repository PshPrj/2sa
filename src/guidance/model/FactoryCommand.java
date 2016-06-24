package guidance.model;

import board.model.Command;

public class FactoryCommand {//인스턴스 생성을 도맡는 클래스.
	//Factory패턴의 기본 조건 : 싱글톤 패턴이어야 한다.
	
	private FactoryCommand(){}
	private static FactoryCommand instance = new FactoryCommand();
	
	public static FactoryCommand newInstance(){
		return instance;
	}
	
	public Command createCommand(String cmd){
		System.out.println("이용안내 커맨드팩토리"+cmd);
		
		if(cmd.equals("GUIDANCE")){
			return new GuidanceCommand();
		}
		
		return null;
	}

}
