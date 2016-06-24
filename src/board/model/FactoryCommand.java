/*

 	��� : ��ȿ��
	���� ���� ���� : 6/7
	�ν��Ͻ� ���� Ŭ����.

 */

package board.model;

public class FactoryCommand {//�ν��Ͻ� ������ ���ô� Ŭ����.
	//Factory������ �⺻ ���� : �̱��� �����̾�� �Ѵ�.
	
	private FactoryCommand(){}
	private static FactoryCommand instance = new FactoryCommand();
	
	public static FactoryCommand newInstance(){
		return instance;
	}
	
	public Command createCommand(String cmd){
		
		
		//�� �Խ��� �ν��Ͻ��� �����.
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
