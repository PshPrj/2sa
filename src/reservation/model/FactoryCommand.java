/*

 	담당 : 정효진
	최종 수정 일자 : 6/15
	예약 Factory Command

 */

package reservation.model;

import reservation.model.Command;

public class FactoryCommand {//인스턴스 생성을 도맡는 클래스.
	//Factory패턴의 기본 조건 : 싱글톤 패턴이어야 한다.
	
	private FactoryCommand(){}
	private static FactoryCommand instance = new FactoryCommand();
	
	public static FactoryCommand newInstance(){
		return instance;
	}
	
	public Command createCommand(String cmd){
		System.out.println(cmd);
		
		if(cmd.equals("R_1")){
			return new Reservation_1Command();
		}else if(cmd.equals("R_2")){
			return new Reservation_2Command();
		}else if(cmd.equals("R_3")){
			return new Reservation_3Command();
		}else if(cmd.equals("R_4")){
			return new Reservation_4Command();
		}
		
		return null;
	}

}
