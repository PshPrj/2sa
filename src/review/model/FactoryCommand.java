/*

 	��� : ��ȿ��
	���� ���� ���� : 6/19
	�ı� �Խ��� Command

 */

package review.model;

import board.model.Command;

public class FactoryCommand {//�ν��Ͻ� ������ ���ô� Ŭ����.
	//Factory������ �⺻ ���� : �̱��� �����̾�� �Ѵ�.
	
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
