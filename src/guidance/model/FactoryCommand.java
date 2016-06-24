package guidance.model;

import board.model.Command;

public class FactoryCommand {//�ν��Ͻ� ������ ���ô� Ŭ����.
	//Factory������ �⺻ ���� : �̱��� �����̾�� �Ѵ�.
	
	private FactoryCommand(){}
	private static FactoryCommand instance = new FactoryCommand();
	
	public static FactoryCommand newInstance(){
		return instance;
	}
	
	public Command createCommand(String cmd){
		System.out.println("�̿�ȳ� Ŀ�ǵ����丮"+cmd);
		
		if(cmd.equals("GUIDANCE")){
			return new GuidanceCommand();
		}
		
		return null;
	}

}
