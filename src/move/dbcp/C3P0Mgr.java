package move.dbcp;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import com.mchange.v2.c3p0.ComboPooledDataSource;

public class C3P0Mgr {
	private static C3P0Mgr mgr = new C3P0Mgr();
	private C3P0Mgr(){	}
	
	public static C3P0Mgr getInstance(){
		return mgr;
	}
	
	public static Connection getConnection(){
		
		try{
			ComboPooledDataSource cpds = new ComboPooledDataSource();
			cpds.setDriverClass("oracle.jdbc.driver.OracleDriver");      
			cpds.setJdbcUrl("jdbc:oracle:thin:@localhost:1521:orcl");
			cpds.setUser("scott");                                  
			cpds.setPassword("1111");  
			cpds.setInitialPoolSize(10);//�⺻������ �������� ������
			cpds.setMaxPoolSize(50);//�ִ� �����
			cpds.setMinPoolSize(3);//�ּ� ������
			cpds.setMaxIdleTime(0);//������ �ð� ���� (�ʴ���) ������ �ʴ� Ŀ�ؼ��� �����Ѵ�.
			//�⺻���� 0 �� �������� �ʰڴٴ��ǹ��̴�. ���α׷��� ������ �����ϴ� ���ð�.
			cpds.setCheckoutTimeout(0);//Ŀ�ؼ� Ǯ���� Ŀ�ؼ��� ������ �� ��ٸ��� �ð�
			//�⺻���� 0�� �����ϸ� ������ ��ٸ��� ���̴�. ���α׷��� ��� ���� ����. ���ӵǸ� �������°� ��������.
			//���߿� ������ �ð� ���� ���� ��ü�� �޾ƿ������ϴ� ��찡 ���� �� �����Ƿ� SQLException ���� try catch ó�� �� �ش�.
			cpds.setIdleConnectionTestPeriod(300);
			//�ð����� ���� ������ �ֱ������� �˻��� �ش�.
			
			Connection con = cpds.getConnection();
			return con;
		}catch(Exception err){
			System.out.println("db���� ���� : "+err);
		}
		return null;
	}
	
	public static void freeConnection(Connection con){
		if(con!=null){
			try{con.close();}catch(Exception err){}
		}
	}
	
	public static void freeConnection(Connection con, Statement stmt){
		if(con!=null){
			try{con.close();}catch(Exception err){}
		}
		if(stmt!=null){
			try{stmt.close();}catch(Exception err){}
		}
	}
	
	public static void freeConnection(Connection con, Statement stmt, ResultSet rs){
		if(con!=null){
			try{con.close();}catch(Exception err){}
		}
		if(stmt!=null){
			try{stmt.close();}catch(Exception err){}
		}
		if(rs!=null){
			try{rs.close();}catch(Exception err){}
		}
	}
}
