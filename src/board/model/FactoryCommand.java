/*

 	담당 : 정효진
	최종 수정 일자 : 6/7
	인스턴스 생성 클래스.

 */

package board.model;

public class FactoryCommand {//인스턴스 생성을 도맡는 클래스.
	//Factory패턴의 기본 조건 : 싱글톤 패턴이어야 한다.
	
	private FactoryCommand(){}
	private static FactoryCommand instance = new FactoryCommand();
	
	public static FactoryCommand newInstance(){
		return instance;
	}
	
	public Command createCommand(String cmd){
		
		
		//각 게시판 인스턴스를 만든다.
		if(cmd.equals("INTRODUCE")){
			return new IntroduceCommand();
		}else if(cmd.equals("HISTORY")){
			return new HistoryCommand();
		}else if(cmd.equals("NOTICE")){
			return new NoticeCommand();
		}else if(cmd.equals("DRAWING")){
			return new DrawingCommand();
		}else if(cmd.equals("ESTIMATE")){
			return new EstimateCommand();
		}else if(cmd.equals("RESERVATION")){
			return new ReservationCommand();
		}else if(cmd.equals("QNA")){
			return new QnACommand();
		}else if(cmd.equals("REVIEW")){
			return new ReviewCommand();
		}else if(cmd.equals("GUIDANCE")){
			return new GuidanceCommand();
		}
		
		return null;
	}

}
