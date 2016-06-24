package drawing.model;

import board.model.Command;

public class FactoryCommand {//�ν��Ͻ� ������ ���ô� Ŭ����.
	//Factory������ �⺻ ���� : �̱��� �����̾�� �Ѵ�.
	
	private FactoryCommand(){}
	private static FactoryCommand instance = new FactoryCommand();
	
	public static FactoryCommand newInstance(){
		return instance;
	}
	
	public Command createCommand(String cmd){
		System.out.println("����� Ŀ�ǵ����丮"+cmd);
		
		if(cmd.equals("D_1")){
			return new Drawing_1Command();
		}else if(cmd.equals("D_2")){
			return new Drawing_2Command();
		}
		
		return null;
	}

}
