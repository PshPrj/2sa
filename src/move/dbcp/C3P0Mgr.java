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
			cpds.setInitialPoolSize(10);//기본적으로 만들어놓는 사이즈
			cpds.setMaxPoolSize(50);//최대 상시즈
			cpds.setMinPoolSize(3);//최소 사이즈
			cpds.setMaxIdleTime(0);//지정한 시간 동안 (초단위) 사용되지 않는 커넥션을 제거한다.
			//기본값인 0 은 제거하지 않겠다는의미이다. 프로그램의 성능을 제어하는 세팅값.
			cpds.setCheckoutTimeout(0);//커넥션 풀에서 커넥션을 가져올 때 기다리는 시간
			//기본값인 0을 지정하면 끝까지 기다리는 것이다. 프로그램은 계속 중지 상태. 지속되면 교착상태가 벌어진다.
			//나중에 지정된 시간 내에 연결 객체를 받아오지못하는 경우가 생길 수 있으므로 SQLException 으로 try catch 처리 해 준다.
			cpds.setIdleConnectionTestPeriod(300);
			//시간마다 문제 없는지 주기적으로 검사해 준다.
			
			Connection con = cpds.getConnection();
			return con;
		}catch(Exception err){
			System.out.println("db연결 실패 : "+err);
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
