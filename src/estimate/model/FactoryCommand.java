package estimate.model;

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
		
		if(cmd.equals("E_1")){
			return new Estimate_1Command();
		}else if(cmd.equals("E_2")){
			return new Estimate_2Command();
		}else if(cmd.equals("E_3")){
			return new Estimate_3Command();
		}else if(cmd.equals("E_4")){
			return new Estimate_4Command();
		}else if(cmd.equals("E_5")){
			return new Estimate_5Command();
		}else if(cmd.equals("E_6")){
			return new Estimate_6Command();
		}else if(cmd.equals("E_7")){
			return new Estimate_7Command();
		}else if(cmd.equals("E_8")){
			return new Estimate_8Command();
		}
		
		return null;
	}

}
