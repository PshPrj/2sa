package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import move.dbcp.DBconnectionMgr;
import dto.Container_info_Dto;



public class Mypage_dao {
	private DBconnectionMgr pool;
	private Connection con;
	private ResultSet rs;
	private PreparedStatement stmt;
	private String sql;

	public Mypage_dao() {
		try{
			pool=DBconnectionMgr.getInstance();			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public Vector<Container_info_Dto> getContainerData(){
		Vector<Container_info_Dto> dtoList=new Vector<>();
		
		try{
			
			sql="select * from container";
			con = pool.getConnection();
			stmt=con.prepareStatement(sql);
			rs=stmt.executeQuery();
			
			while(rs.next()){
				Container_info_Dto dto=new Container_info_Dto();
				dto.setCon_num(rs.getInt("container_num"));
				dto.setCon_capacity(rs.getInt("container_capacity"));
				dto.setRegi_date_con(rs.getLong("regi_date_container"));
				dto.setStaff_num(rs.getInt("staff_num"));
				dtoList.add(dto);
			}			
			
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			return dtoList;
		}		
	}
	
	
}
