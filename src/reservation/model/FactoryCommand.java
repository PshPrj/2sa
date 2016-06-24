/*

 	��� : ��ȿ��
	���� ���� ���� : 6/15
	���� Factory Command

 */

package reservation.model;

import reservation.model.Command;

public class FactoryCommand {//�ν��Ͻ� ������ ���ô� Ŭ����.
	//Factory������ �⺻ ���� : �̱��� �����̾�� �Ѵ�.
	
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
