package staff.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Vector;

import move.db.ReservationDto;
import move.dbcp.DBconnectionMgr;


public class staff_Dao {

	private Connection con;
	private PreparedStatement stmt;
	private DBconnectionMgr pool;
	
	private ResultSet rs;
	private String sql;

	public staff_Dao() {
		try {
			pool = DBconnectionMgr.getInstance();
		} catch (Exception err) {
			System.out.println("DB 연결 객체 생성 실패 : " + err);
		}
	}
	
	public Vector<Stastistictrcuk_Dto> get_StastisticTruckData(String subsql){
		Vector<Stastistictrcuk_Dto> list=new Vector<>();
		try{
			
			sql="SELECT * from truck t inner join (select truck_num,count(truck_num) cnt from payment group by truck_num) tp "
					+ "on tp.truck_num=t.truck_num "+subsql;
			
			System.out.println(sql);
			
			con = pool.getConnection();
			stmt = con.prepareStatement(sql);
			rs=stmt.executeQuery();
			
			while(rs.next()){
				Stastistictrcuk_Dto dto=new Stastistictrcuk_Dto();
				dto.setTruck_num(rs.getString(1));
				dto.setCapacity(rs.getString(3));
				dto.setCar_type(rs.getString(4));
				dto.setCar_num(rs.getString(5));
				dto.setDate(rs.getString(6));
				dto.setCnt(rs.getString(8));
				list.add(dto);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}catch(Exception er){
			er.printStackTrace();
		}finally {
			pool.freeConnection(con, stmt);
			return list;
		}
	}
	public Vector<StastistictContainer_Dto> get_StastisticContainerData(String subsql){
		Vector<StastistictContainer_Dto> list=new Vector<>();
		try{
			
			sql="SELECT * from container c inner join (select container_num,count(container_num) cnt from payment group by container_num) cp"
					+ "  on cp.container_num=c.container_num "+subsql;
			
			System.out.println(sql);
			
			con = pool.getConnection();
			stmt = con.prepareStatement(sql);
			rs=stmt.executeQuery();
			
			while(rs.next()){
				StastistictContainer_Dto dto=new StastistictContainer_Dto();
				dto.setCon_num(rs.getString(1));
				dto.setCapacity(rs.getString(3));
				dto.setDate(rs.getString(4));
				dto.setCon_name(rs.getString(5));
				dto.setCnt(rs.getInt(7));
				list.add(dto);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}catch(Exception er){
			er.printStackTrace();
		}finally {
			pool.freeConnection(con, stmt);
			return list;
		}
	}
	
	public void Insert_Staff(String name,String id,String pw,String dept,String tel){
				
		try{
			
			sql="insert into staff(staff_name,staff_id,staff_pw,dept_type,staff_tel,regi_date_staff)  "
					+ "values('"+name+"','"+id+"','"+pw+"','"+dept+"','"+tel+"',sysdate())";
			
			System.out.println(sql);
			
			con = pool.getConnection();
			stmt = con.prepareStatement(sql);
			stmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}catch(Exception er){
			er.printStackTrace();
		}finally {
			pool.freeConnection(con, stmt);
		}
	}
	
	
	public void Update_Container(String subsql){
		try{
				
				sql="update container set "+subsql;
				
				System.out.println(sql);
				
				con = pool.getConnection();
				stmt = con.prepareStatement(sql);
				stmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			}catch(Exception er){
				er.printStackTrace();
			}finally {
				pool.freeConnection(con, stmt);
			}
	}
	
	
	public void Delete_Container(String con_num){
		try{
			
			sql="delete from container where container_num="+con_num;
			
			System.out.println(sql);
			
			con = pool.getConnection();
			stmt = con.prepareStatement(sql);
			stmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}catch(Exception er){
			er.printStackTrace();
		}finally {
			pool.freeConnection(con, stmt);
		}
	}
	
	public void Insert_Container(String staff_num,String capacity,String con_name){
		try{
			
			sql="insert into container (staff_num,container_capacity,regi_date_container,con_name)"
					+ " values("+staff_num+","+capacity+",now(),"+con_name+")";
			
			System.out.println(sql);
			
			con = pool.getConnection();
			stmt = con.prepareStatement(sql);
			stmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}catch(Exception er){
			er.printStackTrace();
		}finally {
			pool.freeConnection(con, stmt);
		}
	}
	public void Update_Refund(String pay_num,String member_num){
		try{
			
			sql="update payment set refund_check=true  where payment_num="+pay_num;
			
			System.out.println(sql);
			
			con = pool.getConnection();
			stmt = con.prepareStatement(sql);
			stmt.executeUpdate();
			
			sql="update member_history set refund_cnt=refund_cnt+1,history_cnt=history_cnt-1 where member_num="+member_num;
			System.out.println(sql);
			stmt = con.prepareStatement(sql);
			stmt.executeUpdate();
		
		} catch (SQLException e) {
			e.printStackTrace();
		}catch(Exception er){
			er.printStackTrace();
		}finally {
			pool.freeConnection(con, stmt);
		}
	}
	public void Update_Payment(String staff_num,String pay_num,String subsql,String res_num,String member_num){
		try{
			
			sql="update payment set "+subsql+"  where payment_num="+pay_num;
			
			System.out.println(sql);
			
			con = pool.getConnection();
			stmt = con.prepareStatement(sql);
			stmt.executeUpdate();
			
			sql="update reservation set staff_num="+staff_num+"  where reservation_num="+res_num;
			System.out.println(sql);
			stmt = con.prepareStatement(sql);
			stmt.executeUpdate();
			
			sql="update member_history set history_cnt=history_cnt+1 where member_num="+member_num;
			System.out.println(sql);
			stmt = con.prepareStatement(sql);
			stmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}catch(Exception er){
			er.printStackTrace();
		}finally {
			pool.freeConnection(con, stmt);
		}
	}
	public void Update_Reservation(String res_num){
		try{
			sql="update reservation set is_confirm = true where reservation_num="+res_num;
			
			System.out.println(sql);
			
			con = pool.getConnection();
			stmt = con.prepareStatement(sql);
			stmt.executeUpdate();
			
			payment(res_num);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}catch(Exception er){
			er.printStackTrace();
		}finally {
			pool.freeConnection(con, stmt);
		}
	}
	
	public void payment(String reservation_num){
		try{
			sql="insert into payment (price, payment_type, cash_bill, member_num, is_refund, refund_check, reservation_num, payment_deadline) "
					+ "values(?, ?, ?, ?, ?, ?,?,now())";
		
			System.out.println(sql);
			
			String sql2 = "select * from reservation where reservation_num="+reservation_num;
			
			ReservationDto dto = new ReservationDto();
			
			con = pool.getConnection();
			stmt = con.prepareStatement(sql2);
			rs=stmt.executeQuery();
			
			while(rs.next()){
				dto.setMember_num(rs.getInt("member_num"));
				dto.setPrice(rs.getInt("price"));				
			}
			
			stmt=con.prepareStatement(sql);
			stmt.setInt(1, dto.getPrice());
			stmt.setInt(2, 0);
			stmt.setBoolean(3, false);
			stmt.setInt(4, dto.getMember_num());
			stmt.setBoolean(5, false);
			stmt.setBoolean(6, false);
			stmt.setInt(7, Integer.parseInt(reservation_num));
			
			
			stmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}catch(Exception er){
			er.printStackTrace();
		}finally {
			pool.freeConnection(con, stmt);
		}
		
	}
	
	public void Delete_Staff(String staff_num)
	{
		try{
			sql="delete from staff  where staff_num="+staff_num;
			
			System.out.println(sql);
			
			con = pool.getConnection();
			stmt = con.prepareStatement(sql);
			stmt.executeUpdate();
			
			sql="update container set staff_num=null where staff_num="+staff_num;
			stmt = con.prepareStatement(sql);
			stmt.executeUpdate();
			
			sql="update truck set staff_num=null where staff_num="+staff_num;
			stmt = con.prepareStatement(sql);
			stmt.executeUpdate();
			
			
			sql="update payment set staff_num=0 where staff_num="+staff_num;
			stmt = con.prepareStatement(sql);
			stmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}catch(Exception er){
			er.printStackTrace();
		}finally {
			pool.freeConnection(con, stmt);
		}
		
	}
	public void Update_Staffinfo(String subsql,String staff_num){
		try{
			sql="update staff set "+subsql+"  where staff_num="+staff_num;
			
			System.out.println(sql);
			
			con = pool.getConnection();
			stmt = con.prepareStatement(sql);
			stmt.executeUpdate();
			
		
			
		} catch (SQLException e) {
			e.printStackTrace();
		}catch(Exception er){
			er.printStackTrace();
		}finally {
			pool.freeConnection(con, stmt);
		}
		
	}
	
	public Vector<Member_reservation_info> get_MemberreservationData(String member_num){
		
		Vector<Member_reservation_info> list=new Vector<>();
		try{
			sql="select r.reservation_num,r.reservation_date,r.reservation_time,r.price,p.payment_date,e.estimate_content,e.distance,e.addr1,e.addr2,r.staff_num,r.is_confirm,p.is_refund "
					+ " from reservation r inner join payment p on p.reservation_num=r.reservation_num "
					+ " inner join estimate_board e on e.estimate_board_num=r.estimate_board_num where r.member_num="+member_num;
			
			System.out.println(sql);
			
			con = pool.getConnection();
			stmt = con.prepareStatement(sql);
			rs=stmt.executeQuery();
			
			while(rs.next()){
				Member_reservation_info dto=new Member_reservation_info();
				dto.setRs_num(rs.getString(1));
				dto.setDate(rs.getString(2));
				dto.setTime(rs.getString(3));
				dto.setPrice(rs.getString(4));
				dto.setPay_date(rs.getString(5));
				dto.setEstimate_content(rs.getString(6));
				dto.setDistance(rs.getString(7));
				dto.setAddr1(rs.getString(8));
				dto.setAddr2(rs.getString(9));
				dto.setStaff_num(rs.getString(10));
				dto.setIs_confirm(rs.getString(11));
				dto.setIs_refund(rs.getString(12));
				list.add(dto);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}catch(Exception er){
			er.printStackTrace();
		}finally {
			pool.freeConnection(con, stmt);
			return list;
		}
	}
	public Memeber_Detail_Dto get_MemberDetailData(String member_num){
		Memeber_Detail_Dto dto=new Memeber_Detail_Dto();
		try{
			sql="select member_num,member_id,member_name,member_tel,regi_date from member where member_num="+member_num;
			
			System.out.println(sql);
			
			con = pool.getConnection();
			stmt = con.prepareStatement(sql);
			rs=stmt.executeQuery();
			
			while(rs.next()){
				dto.setMember_num(rs.getString(1));
				dto.setMember_id(rs.getString(2));
				dto.setMember_name(rs.getString(3));
				dto.setTel(rs.getString(4));
				dto.setDate(rs.getString(5));
			}
			
			sql="select count(*) from reservation where member_num="+member_num;
			
			System.out.println(sql);
			stmt = con.prepareStatement(sql);
			rs=stmt.executeQuery();
			
			while(rs.next()){
				dto.setRes_cnt(rs.getString(1));
			}
			
			sql="select count(*) from estimate_board where member_num="+member_num;
			
			System.out.println(sql);
			stmt = con.prepareStatement(sql);
			rs=stmt.executeQuery();
			
			while(rs.next()){
				dto.setEs_cnt(rs.getString(1));
			}
			
			sql="select count(*) from payment where payment_date is not null and is_refund=false and member_num="+member_num;
			
			System.out.println(sql);
			stmt = con.prepareStatement(sql);
			rs=stmt.executeQuery();
			
			while(rs.next()){
				dto.setPay_cnt(rs.getString(1));
			}
			
			sql="select count(*) from payment where payment_date is not null and is_refund=true and member_num="+member_num;
			
			System.out.println(sql);
			stmt = con.prepareStatement(sql);
			rs=stmt.executeQuery();
			
			while(rs.next()){
				dto.setRefund_cnt(rs.getString(1));
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}catch(Exception er){
			er.printStackTrace();
		}finally {
			pool.freeConnection(con, stmt);
			return dto;
		}
	}
	
	public Vector<All_Reservation_Info_Dto> get_All_reservationData(String subsql){
		Vector<All_Reservation_Info_Dto> list=new Vector<>();
		try{
			sql="select r.reservation_date,member_id,member_name,addr1,addr2,distance "
					+ "from reservation r inner join payment p on p.reservation_num=r.reservation_num "
					+ "inner join member m on m.member_num=p.member_num "
					+ "inner join estimate_board e on e.estimate_board_num=r.estimate_board_num "
					+ subsql;
			
			System.out.println(sql);
			
			con = pool.getConnection();
			stmt = con.prepareStatement(sql);
			rs=stmt.executeQuery();
			
			while(rs.next()){
				All_Reservation_Info_Dto dto=new All_Reservation_Info_Dto();
				dto.setDate(rs.getString(1));
				dto.setMember_id(rs.getString(2));
				dto.setMember_name(rs.getString(3));
				dto.setAddr1(rs.getString(4));
				dto.setAddr2(rs.getString(5));
				dto.setDistant(rs.getInt(6));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}catch(Exception er){
			er.printStackTrace();
		}finally {
			pool.freeConnection(con, stmt);
			return list;
		}
	}
	
	
	
	public void Delete_Truck(String truck_num){
	try{
			sql="delete from truck where truck_num="+truck_num;
			
			System.out.println(sql);
			
			con = pool.getConnection();
			stmt = con.prepareStatement(sql);
			stmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}catch(Exception er){
			er.printStackTrace();
		}finally {
			pool.freeConnection(con, stmt);
			
		}
	}
	public void Update_Movestatus(int type,String pay_num){

		try{
			
			if(type==1){
				sql="update movement_status set movement_statrt_time=now() where payment_num="+pay_num;
			}else if(type==2){
				sql="update movement_status set truck_leave_time=now() where payment_num="+pay_num;
			}else if(type==3){
				sql="update movement_status set depart_time=now() where payment_num="+pay_num;
			}else if(type==4){
				sql="update movement_status set complete_time=now() where payment_num="+pay_num;
			}
			System.out.println(sql);
			
			con = pool.getConnection();
			stmt = con.prepareStatement(sql);
			stmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}catch(Exception er){
			er.printStackTrace();
		}finally {
			pool.freeConnection(con, stmt);
			
		}
	}
	
	
	
	public ShowProgress_Dto get_Progress(String pay_num){
		ShowProgress_Dto dto=new ShowProgress_Dto();
		try{
			
			sql="SELECT p.payment_num,s.staff_name,s.staff_tel,ms.movement_statrt_time,ms.truck_leave_time,ms.depart_time,ms.complete_time "
					+ " FROM payment p inner join reservation r on r.reservation_num=p.reservation_num "
					+ " inner join staff s on s.staff_num=r.staff_num "
					+ " inner join movement_status ms on ms.payment_num=p.payment_num where p.payment_num="+pay_num;
					
			
			
			System.out.println(sql);
			
			con = pool.getConnection();
			stmt = con.prepareStatement(sql);
			rs=stmt.executeQuery();		
			
			
			while(rs.next()){
				dto.setPay_num(rs.getInt(1));
				dto.setStaff_name(rs.getString(2));
				dto.setStaff_tel(rs.getString(3));
				dto.setTime1(rs.getString(4));
				dto.setTime2(rs.getString(5));
				dto.setTime3(rs.getString(6));
				dto.setTime4(rs.getString(7));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}catch(Exception er){
			er.printStackTrace();
		}finally {
			pool.freeConnection(con, stmt);	
			return dto;
		}
		
		
	}
	public void Insert_Truck(String staff_num,String capacity,String car_type,String car_num){
		
		try{
			sql="insert into truck (staff_num,truck_capacity,car_type,car_num,regi_date_truck) values ("+staff_num+","+ capacity+",'"+ car_type+"','"+car_num+"',now())";
			
			System.out.println(sql);
			
			con = pool.getConnection();
			stmt = con.prepareStatement(sql);
			stmt.executeUpdate();	
			
		} catch (SQLException e) {
			e.printStackTrace();
		}catch(Exception er){
			er.printStackTrace();
		}finally {
			pool.freeConnection(con, stmt);	
			
		}
	}
	
	
	public Truck_Dto UpdateTruck(String subsql,String truck_num){
		Truck_Dto dto=new Truck_Dto();
		
		try{
			sql="udate truck set "+subsql+"  where truck_num="+truck_num;
			
			System.out.println(sql);
			
			con = pool.getConnection();
			stmt = con.prepareStatement(sql);
			stmt.executeUpdate();
			
			sql="select truck_num,staff_num,truck_capacity,car_type,car_num from truck where truck_num="+truck_num;
			
			stmt = con.prepareStatement(sql);
			rs=stmt.executeQuery();
			
			while(rs.next()){
				dto.setTruck_num(rs.getInt(1));
				dto.setStaff_num(rs.getInt(2));
				dto.setCapacity(rs.getDouble(3));
				dto.setCar_type(rs.getString(4));
				dto.setCar_name(rs.getString(5));
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}catch(Exception er){
			er.printStackTrace();
		}finally {
			pool.freeConnection(con, stmt);
			return dto;
		}
	}
	
	public Staff_Dto Updatetruckstaff(String truck_num,String staff_num){
		Staff_Dto dto=new Staff_Dto();
		
		try{
			sql="update truck set staff_num="+staff_num+" where truck_num="+truck_num;
			
			System.out.println(sql);
			
			con = pool.getConnection();
			stmt = con.prepareStatement(sql);
			stmt.executeUpdate();
			
			sql="select s.staff_num,s.staff_name,s.staff_id,s.dept_type,s.regi_date_staff,d.dept_name,s.staff_tel "
					+ "from staff s inner join staff_dept d " + "on d.dept_type=s.dept_type where staff_num="+staff_num;
			stmt = con.prepareStatement(sql);
			rs=stmt.executeQuery();
			
			while(rs.next()){
				dto.setNum(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setId(rs.getString(3));
				dto.setDate(rs.getString(5));
				dto.setDept(rs.getString(6));
				dto.setTel(rs.getString(7));
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}catch(Exception er){
			er.printStackTrace();
		}finally {
			pool.freeConnection(con, stmt);
			return dto;
		}
	}
	
	
	public Calendarinfo_Dto get_CalendarInfoData(String res_num){
		Calendarinfo_Dto dto=new Calendarinfo_Dto();
		
		try{
			sql="select e.estimate_content,p.member_num,p.truck_num,p.container_num,r.staff_num,r.reservation_time,p.price "
					+ " from reservation r inner join payment p on p.reservation_num=r.reservation_num "
					+ " inner join estimate_board e on e.estimate_board_num=r.estimate_board_num "
					+ " where r.reservation_num="+res_num;
			
			System.out.println(sql);
			
			con = pool.getConnection();
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			
			while(rs.next()){
			
				dto.setEstimate_content(rs.getString(1));
				dto.setMember_num(rs.getInt(2));
				dto.setTruck_num(rs.getInt(3));
				dto.setCon_num(rs.getInt(4));
				dto.setStaff_num(rs.getInt(5));
				dto.setTime(rs.getInt(6));
				dto.setPrice(rs.getInt(7));
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, stmt);
			return dto;
		}
	}
	
	
	public Vector <Calendar_Dto> get_CalendarData(){
		Vector<Calendar_Dto> list=new Vector<>();
		try{
			sql="select m.member_num, r.reservation_num,p.payment_num,r.staff_num,p.container_num,p.truck_num,r.reservation_date,r.reservation_time,m.member_id,m.member_name "
					+ " from reservation r inner join payment p on p.reservation_num=r.reservation_num "
					+ " inner join member m on p.member_num=m.member_num "
					+ " where p.payment_date is not null ";
			
			System.out.println(sql);
			
			con = pool.getConnection();
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			
			while(rs.next()){
				Calendar_Dto dto=new Calendar_Dto();
				dto.setMember_num(rs.getInt(1));
				dto.setRes_num(rs.getInt(2));
				dto.setPay_num(rs.getInt(3));
				dto.setStaff_num(rs.getInt(4));
				dto.setCon_num(rs.getInt(5));
				dto.setTruck_num(rs.getInt(6));
				dto.setRes_date(rs.getString(7));
				dto.setTime(rs.getInt(8));
				dto.setMember_id(rs.getString(9));
				dto.setMember_name(rs.getString(10));
				list.add(dto);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, stmt);
			return list;
		}
	}
	
	
	public Vector<Currentres_Progress_dto> get_progressData(String subsql){
		Vector<Currentres_Progress_dto> list=new Vector<>();
		
		try{
			sql="select e.distance,p.payment_num,r.reservation_date,m.member_num,m.member_id,m.member_name,r.reservation_num "
					+ " from reservation r inner join estimate_board e  on r.estimate_board_num=e.estimate_board_num "
					+ " inner join payment p on p.reservation_num=r.reservation_num "
					+ " inner join member m on p.member_num=m.member_num "
					+ " where reservation_date=(SELECT DATE_FORMAT(NOW(), '%Y-%c-%e')) "
					+ " and p.payment_date is not null and is_refund =false  "+subsql;
			
			System.out.println(sql);
			
			con = pool.getConnection();
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			
			while(rs.next()){
				Currentres_Progress_dto dto =new Currentres_Progress_dto();
				dto.setDist(rs.getDouble(1));
				dto.setPay_num(rs.getInt(2));
				dto.setDate(rs.getString(3));
				dto.setMember_num(rs.getInt(4));
				dto.setMember_id(rs.getString(5));
				dto.setMember_name(rs.getString(6));
				dto.setRes_num(rs.getInt(7));
				list.add(dto);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, stmt);
			return list;
		}
	}
	
	
	public Vector<CurrenrConresrvation_Dto> get_CurrentreservationConDto(String container_num){
		Vector <CurrenrConresrvation_Dto> list=new Vector<>();
		
		try{
			sql="select r.reservation_num,r.keep_item_date,r.member_num,p.payment_num,m.member_id,m.member_name,r.reservation_date "
					+ " from reservation r inner join payment p on p.reservation_num =r.reservation_num "
					+ " inner join member m on m.member_num=r.member_num "
					+ " where reservation_date<=now() and now() <= (SELECT DATE_ADD(r.reservation_date, INTERVAL r.keep_item_date DAY)) "
					+ " and p.is_refund=false and p.container_num="+container_num;
			
			System.out.println(sql);
			
			con = pool.getConnection();
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			
			while(rs.next()){
				CurrenrConresrvation_Dto dto =new CurrenrConresrvation_Dto();
				dto.setRes_num(rs.getInt(1));
				dto.setKeep_date(rs.getInt(2));
				dto.setMember_num(rs.getInt(3));
				dto.setPay_num(rs.getInt(4));
				dto.setMember_id(rs.getString(5));
				dto.setMember_name(rs.getString(6));
				dto.setDate(rs.getString(7));
				list.add(dto);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, stmt);
			return list;
		}
	}
	
	public Vector<Containerreservation_Dto> get_ContainerreservationData(String container_name,int type)
	{
		Vector<Containerreservation_Dto> list = new Vector<>();
		try {
			if(type==1){
				sql = "select c.container_num,r.reservation_num,r.keep_item_date,m.member_id,m.member_name,m.member_num,p.payment_num,r.reservation_date "
						+ " from reservation r inner join payment p on r.reservation_num=p.reservation_num  "
						+ " inner join container c on p.container_num = c.container_num "
						+ " inner join member m on p.member_num=m.member_num "
						+ " where is_refund=false and p.payment_date is not null and c.con_name like '%"+container_name+"%' limit 5";
			}else{
				sql = "select c.container_num,r.reservation_num,r.keep_item_date,m.member_id,m.member_name,m.member_num,p.payment_num,r.reservation_date "
						+ " from reservation r inner join payment p on r.reservation_num=p.reservation_num  "
						+ " inner join container c on p.container_num = c.container_num "
						+ " inner join member m on p.member_num=m.member_num "
						+ " where is_refund=false and p.payment_date is not null and c.container_num ="+container_name;
			}
			
			
			
			System.out.println(sql);

			con = pool.getConnection();
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();

			while (rs.next()) {
				Containerreservation_Dto dto = new Containerreservation_Dto();
				dto.setCon_num(rs.getInt(1));
				dto.setReservation_num(rs.getInt(2));
				dto.setKeep_date(rs.getInt(3));
				dto.setMember_id(rs.getString(4));
				dto.setMember_name(rs.getString(5));
				dto.setMember_num(rs.getInt(6));
				dto.setPay_num(rs.getInt(7));
				dto.setDate(rs.getString(8));
				list.add(dto);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, stmt);
			return list;
		}
		
	}
	
	public Vector<Container_Dto> get_ContainerData(int type,String subsql){
		
		Vector<Container_Dto> list = new Vector<>();

		try {
			if(type==1){
				sql = "select * from container";
			}else if(type==2){
				sql = "select * from container "+subsql;
			}
			
			System.out.println(sql);

			con = pool.getConnection();
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();

			while (rs.next()) {
				Container_Dto dto = new Container_Dto();
				dto.setContainer_num(rs.getInt("container_num"));
				dto.setStaff_num(rs.getInt("staff_num"));
				dto.setContainer_capacity(rs.getDouble("container_capacity"));
				dto.setRegi_date(rs.getString("regi_date_container"));
				dto.setContainer_name(rs.getString("con_name"));
				
				list.add(dto);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, stmt);
			return list;
		}
		
		
		
		
	}



	public CurrentTruckReservation_Dto get_CurrentReservationData(String truck_num,int type) {
		CurrentTruckReservation_Dto data =null;

		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String today=sdf.format(d);

		try {
			con = pool.getConnection();

					
			sql = "select p.payment_num ,m.member_id,r.reservation_date,r.reservation_num,"
					+ "p.container_num,m.member_num,t.truck_num,m.member_name,e.addr1,e.addr2,r.reservation_time,e.distance, p.price "
					+ "from reservation r inner join payment p on p.reservation_num=r.reservation_num "
					+ "inner join truck t on t.truck_num=p.truck_num "
					+ "inner join member m on m.member_num=p.member_num "
					+ "inner join esimate_board e on e.estimate_board_num=r.estimate_board_num "
					+ "where r.is_confirm=1 and t.truck_num ="+truck_num+" and r.reservation_date >= '"+today+"' limit 1";

			System.out.println(sql);
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();			
			while (rs.next()) {
				data = new CurrentTruckReservation_Dto();
				data.setPay_num(rs.getInt(1));
				data.setMember_id(rs.getString(2));
				data.setDate(rs.getString(3));
				data.setReservation_num(rs.getInt(4));
				data.setContainer_num(rs.getInt(5));
				data.setMember_num(rs.getInt(6));
				data.setTruck_num(rs.getInt(7));
				data.setMember_name(rs.getString(8));
				if(type==2){
					data.setAddr1(rs.getString(9));
					data.setAddr2(rs.getString(10));
					data.setTime(rs.getInt(11));
					data.setDistance(rs.getInt(12));
					data.setPrice(rs.getInt(13));
				}
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, stmt);
			return data;
		}

	}

	public Vector<Truckreservation_Dto> get_TruckreservationData(String name) {
		Vector<Truckreservation_Dto> list = new Vector<>();

		try {
			sql = "select p.payment_num,t.truck_num,m.member_id,m.member_name,p.payment_date "
					+ "from payment p inner join truck t on t.truck_num=p.truck_num "
					+ "inner join member m on m.member_num=p.member_num " + "where t.car_num like '%" + name
					+ "%' and payment_date is not null and is_refund=false "
					+ "order by p.payment_date,p.payment_num limit 5";
			System.out.println(sql);

			con = pool.getConnection();
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();

			while (rs.next()) {
				Truckreservation_Dto dto = new Truckreservation_Dto();
				dto.setPay_num(rs.getInt(1));
				dto.setTruck_num(rs.getInt(2));
				dto.setMember_id(rs.getString(3));
				dto.setMember_name(rs.getString(4));
				dto.setDate(rs.getString(5));
				list.add(dto);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, stmt);
			return list;
		}

	}

	public Vector<Truck_Dto> get_TruckData(int type,String subsql) {
		Vector<Truck_Dto> list = new Vector<>();

		try {
			if(type==1){
				sql = "select truck_num,staff_num,truck_capacity,car_type,car_num,regi_date_truck from truck ";
			}else if(type==2){
				sql = "select truck_num,staff_num,truck_capacity,car_type,car_num,regi_date_truck from truck "+subsql;
			}
			
			System.out.println(sql);

			con = pool.getConnection();
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();

			while (rs.next()) {
				Truck_Dto dto = new Truck_Dto();
				dto.setTruck_num(rs.getInt(1));
				dto.setStaff_num(rs.getInt(2));
				dto.setCapacity(rs.getDouble(3));
				dto.setCar_type(rs.getString(4));
				dto.setCar_name(rs.getString(5));
				dto.setDate(rs.getString(6));
				list.add(dto);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, stmt);
			return list;
		}
	}

	public Vector<Member_Dto> get_MemberData(String subsql) {
		Vector<Member_Dto> list = new Vector<>();

		try {
			sql = "select m.member_num,m.member_name,m.member_id,m.regi_date,mh.history_cnt,mh.refund_cnt"
					+ " from member m inner join member_history mh " + " on m.member_num=mh.member_num " + subsql;

			System.out.println(sql);

			con = pool.getConnection();
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();

			while (rs.next()) {
				Member_Dto dto = new Member_Dto();
				dto.setMember_num(rs.getInt(1));
				dto.setName(rs.getString(2));
				dto.setId(rs.getString(3));
				dto.setDate(rs.getString(4));
				dto.setHistory(rs.getInt(5));
				dto.setRefund(rs.getInt(6));
				list.add(dto);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, stmt);
			return list;
		}

	}

	public Vector<Staff_Dto> get_StaffData(String subsql) {
		Vector<Staff_Dto> list = new Vector<>();

		try {
			sql = "select s.staff_num,s.staff_name,s.staff_id,s.dept_type,s.regi_date_staff,d.dept_name,s.staff_tel,d.dept_type "
					+ "from staff s inner join staff_dept d " + "on d.dept_type=s.dept_type " + subsql;

			System.out.println(sql);

			con = pool.getConnection();
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();

			while (rs.next()) {
				Staff_Dto dto = new Staff_Dto();
				dto.setNum(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setId(rs.getString(3));
				dto.setDate(rs.getString(5));
				dto.setDept(rs.getString(6));
				dto.setTel(rs.getString(7));
				dto.setDept_type(rs.getString(8));
				list.add(dto);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, stmt);
			return list;
		}

	}

	public Vector<Paymentrefund_Dto> get_PaymentrefundData(String subsql) {
		Vector<Paymentrefund_Dto> list = new Vector<>();

		try {
			sql = "select r.reservation_num,m.member_num,m.member_id,p.price,p.payment_num,r.reservation_date "
					+ " from reservation r inner join member m on  r.member_num=m.member_num"
					+ " inner join payment p on r.reservation_num=p.reservation_num "
					+ " where p.payment_date is not null and p.is_refund=true and refund_check=false " + subsql;

			System.out.println(sql);

			con = pool.getConnection();
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();

			while (rs.next()) {
				Paymentrefund_Dto dto = new Paymentrefund_Dto();
				dto.setBoard_num(rs.getString(1));
				dto.setMember_num(rs.getString(2));
				dto.setId(rs.getString(3));
				dto.setPrice(rs.getString(4));
				dto.setPay_num(rs.getString(5));
				dto.setDate(rs.getString(6));
				list.add(dto);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, stmt);
			return list;
		}

	}

	public Vector<Paymentwait_Dto> get_PaymentwaitData(String subsql) {
		Vector<Paymentwait_Dto> list = new Vector<>();

		try {

			sql = "select p.member_num,e.estimate_board_num,p.payment_deadline,m.member_id,p.price "
					+ "from payment p inner join estimate_board e on p.member_num=e.member_num "
					+ "inner join member m on m.member_num=p.member_num where p.payment_date is null " + subsql;

			System.out.println(sql);

			con = pool.getConnection();
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();

			while (rs.next()) {
				Paymentwait_Dto dto = new Paymentwait_Dto();
				dto.setMember_num(rs.getString(1));
				dto.setBoard_num(rs.getString(2));
				dto.setDate(rs.getString(3));
				dto.setId(rs.getString(4));
				dto.setPrice(rs.getString(5));
				list.add(dto);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, stmt);
			return list;
		}
	}

	public Vector<Payment_Confirm_Dto> get_PaymentConfirmData(String subsql) {
		Vector<Payment_Confirm_Dto> list = new Vector<>();

		try {
			sql = "select r.reservation_num, m.member_num, m.member_id, p.price from member m inner join payment p on p.member_num=m.member_num inner join reservation r on r.reservation_num=p.reservation_num where p.payment_type >0 and p.is_refund=false "
					+ subsql;

			System.out.println(sql);

			con = pool.getConnection();
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();

			while (rs.next()) {
				Payment_Confirm_Dto dto = new Payment_Confirm_Dto();
				dto.setRes_num(rs.getInt(1));
				dto.setMember_num(rs.getInt(2));
				dto.setId(rs.getString(3));
				dto.setPrice(rs.getInt(4));
				//dto.setDate_cnt(rs.getString(5));
				//dto.setPay_num(rs.getInt(6));
				list.add(dto);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, stmt);
			return list;
		}
	}

	public Vector<Paymentapprove_Dto> get_PaymentApproveData(String subsql) {
		Vector<Paymentapprove_Dto> list = new Vector<>();

		try {

			sql = "select e.estimate_board_num,e.member_num,r.reservation_date,m.member_id, e.pre_price,e.pre_estimate_time,r.reservation_num  from estimate_board e inner join member m on e.member_num=m.member_num  inner join reservation r on e.estimate_board_num=r.estimate_board_num where r.is_confirm=false  "
					+ subsql + " order by estimate_date  ";

			System.out.println(sql);

			con = pool.getConnection();
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();

			while (rs.next()) {
				Paymentapprove_Dto dto = new Paymentapprove_Dto();
				dto.setBoard_num(rs.getInt(1));
				dto.setNum(rs.getInt(2));
				dto.setDate(rs.getString(3));
				dto.setId(rs.getString(4));
				dto.setPrice(rs.getInt(5));
				dto.setCnt(rs.getInt(6));
				dto.setRes_num(rs.getInt(7));
				list.add(dto);
				
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, stmt);
			return list;
		}
	}

	public Vector<Stastiticsstaff_Dto> get_StaffStastitics(String subsql) {

		Vector<Stastiticsstaff_Dto> list = new Vector<>();

		try {

			sql = "select s.staff_num,s.staff_name,s.staff_id,s.regi_date_staff,d.dept_name,d.dept_type "
					+ "from staff s,staff_dept d " + "where s.dept_type=d.dept_type " + subsql;

			System.out.println(sql);

			con = pool.getConnection();
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();

			while (rs.next()) {
				Stastiticsstaff_Dto dto = new Stastiticsstaff_Dto();
				dto.setNum(rs.getInt(1));
				dto.setName(rs.getString(2));
				dto.setId(rs.getString(3));
				dto.setDate(rs.getString(4));
				dto.setDept_name(rs.getString(5));
				dto.setDept_type(rs.getInt(6));
				list.add(dto);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, stmt);
			return list;
		}
	}

	public Vector<Stastisticsclient_Dto> get_ClientStastitics(String subsql) {
		Vector<Stastisticsclient_Dto> list = new Vector<>();

		try {

			if (!subsql.equals("")) {
				sql = "select m.member_id,m.regi_date,member_tel,member_name,p.count_pay,m.member_num "
						+ " from member m inner join (select count(*) count_pay ,member_num payment_member from payment group by member_num) p "
						+ " on p.payment_member=m.member_num where " + subsql;
			} else {
				sql = "select m.member_id,m.regi_date,member_tel,member_name,p.count_pay,m.member_num "
						+ "  from member m inner join (select count(*) count_pay ,member_num payment_member from payment group by member_num) p "
						+ " on p.payment_member=m.member_num;";
			}

			System.out.println(sql);

			con = pool.getConnection();
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();

			while (rs.next()) {
				Stastisticsclient_Dto dto = new Stastisticsclient_Dto();
				dto.setM_id(rs.getString(1));
				dto.setRegi_date(rs.getString(2));
				dto.setM_name(rs.getString(4));
				dto.setMove_cnt(rs.getInt(5));
				dto.setNum(rs.getString(6));
				list.add(dto);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, stmt);
			return list;
		}
	}

	public Vector<Statisticsite_Dto> get_AllStatisticsite(String subsql) {

		Vector<Statisticsite_Dto> list = new Vector<>();

		try {

			if (!subsql.equals("")) {
				sql = "select distinct p.payment_num,e.distance,p.price,p.member_num,p.is_refund,t.car_type,c.con_name,m.member_id ,p.payment_date,p.payment_num,r.reservation_num,r.staff_num,e.estimate_content,r.reservation_date,r.reservation_time "
						+ " from reservation r inner join estimate_board e on r.estimate_board_num=e.estimate_board_num "
						+ " inner join payment p on r.reservation_num=p.reservation_num inner join truck t on p.truck_num =t.truck_num "
						+ " inner join member m on p.member_num=m.member_num left join container c on c.container_num=p.container_num where " + subsql;
			} else {
				sql = "select distinct p.payment_num,e.distance,p.price,p.member_num,p.is_refund,t.car_type,c.con_name,m.member_id ,p.payment_date,p.payment_num,r.reservation_num,r.staff_num,e.estimate_content,r.reservation_date,r.reservation_time "
						+ " from reservation r inner join estimate_board e on r.estimate_board_num=e.estimate_board_num "
						+ " inner join payment p on r.reservation_num=p.reservation_num inner join truck t on p.truck_num =t.truck_num "
						+ " inner join member m on p.member_num=m.member_num left join container c on c.container_num=p.container_num ";
			}

			System.out.println(sql);
			con = pool.getConnection();
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();

			while (rs.next()) {
				Statisticsite_Dto dto = new Statisticsite_Dto();
				dto.setDistance(rs.getDouble(2));
				dto.setPrice(rs.getInt(3));
				dto.setMember_num(rs.getInt(4));
				dto.setIsrefund(rs.getInt(5));
				dto.setTruck(rs.getString(6));
				dto.setContainer(rs.getString(7));
				dto.setId(rs.getString(8));
				dto.setDate(rs.getString(9));
				dto.setPay_num(rs.getInt(10));
				dto.setRes_num(rs.getInt(11));
				dto.setStaff_num(rs.getInt(12));
				dto.setEsimate_content(rs.getString(13));
				dto.setRes_date(rs.getString(14));
				dto.setTime(rs.getString(15));
				list.add(dto);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, stmt);
			return list;
		}

	}

	public Site_info_Dto get_SiteinfoData() {

		Site_info_Dto dto = new Site_info_Dto();

		try {

			sql = "select count(*) from container ";

			con = pool.getConnection();
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			rs.next();

			dto.setAll_container(rs.getInt(1));

			sql = "select count(*) from member";

			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			rs.next();
			dto.setAll_member(rs.getInt(1));

			sql = "select count(*) from staff";

			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			rs.next();
			dto.setAll_staff(rs.getInt(1));

			sql = "select count(*) from truck";

			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			rs.next();
			dto.setAll_truck(rs.getInt(1));

			sql = "select count(*) from payment where is_refund=false";

			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			rs.next();
			dto.setAll_payment(rs.getInt(1));

			sql = "select count(*) from estimate_board";

			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			rs.next();
			dto.setAll_estimation(rs.getInt(1));

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, stmt);
			return dto;
		}

	}
}
