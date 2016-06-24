/*

 	담당 : 정효진
	최종 수정 일자 : 6/19
	후기 게시판 Command

 */

package review.model;

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
		
		if(cmd.equals("RPOST")){
			return new RPOSTCommand();
		}else if(cmd.equals("RPOSTProc")){
			return new RPOSTProcCommand();
		}else if(cmd.equals("RREAD")){
			return new RREADCommand();
		}else if(cmd.equals("RDELETE")){
			return new RDELETECommand();
		}else if(cmd.equals("RUPDATE")){
			return new RUPDATECommand();
		}else if(cmd.equals("RUPDATEProc")){
			return new RUPDATEProcCommand();
		}
		
		return null;
	}

}
