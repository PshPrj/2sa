package estimate.update.model;

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
		
		if(cmd.equals("EU_1")){
			return new EstimateUpdate_1Command();
		}else if(cmd.equals("EU_2")){
			return new EstimateUpdate_2Command();
		}else if(cmd.equals("EU_3")){
			return new EstimateUpdate_3Command();
		}else if(cmd.equals("EU_4")){
			return new EstimateUpdate_4Command();
		}else if(cmd.equals("EU_5")){
			return new EstimateUpdate_5Command();
		}else if(cmd.equals("EU_6")){
			return new EstimateUpdate_6Command();
		}else if(cmd.equals("EU_7")){
			return new EstimateUpdate_7Command();
		}else if(cmd.equals("EU_8")){
			return new EstimateUpdate_8Command();
		}else if(cmd.equals("EU_S")){
			return new EstimateUpdate_SelectCommand();
		}else if(cmd.equals("EDELETE")){
			return new EstimateUpdate_Delete_SCommand();
		}else if(cmd.equals("DELETE_S")){
			return new EstimateUpdate_DeleteCommand();
		}
		
		return null;
	}

}
