select * from estimate_board;
select * from picture;


use 2sa;

CREATE TABLE notice_board
(
	notice_board_num      int NOT NULL auto_increment,
	notice_board_date     datetime not  NULL ,
	notice_content        varCHAR(500)  NULL ,
	notice_views_cnt      int not  NULL ,
	staff_num             int  NOT NULL,
    constraint pk_notice_board primary key(notice_board_num)
);

CREATE TABLE estimate_board
(
   estimate_board_num  int  NOT NULL auto_increment,
   member_num            int  NOT NULL ,
   estimate_content   varCHAR(500) not NULL ,
   estimate_date  datetime not NULL ,
   pre_price             int  not NULL ,
   pre_estimate_time  int not  NULL,
   addr1                 varCHAR(50) not  NULL ,
   addr2                 varCHAR(50) not NULL ,
      distance      int not null,
    constraint pk_estimate_board primary key(estimate_board_num)
);

select * from estimate_board;


drop table picture;

CREATE TABLE picture
(
   picture_num           int   auto_increment,
   member_num            int  NOT NULL,
    img                 varChar(200) not NULL,
    estimate_board_num    int not null,
    constraint pk_picture primary key(picture_num)
);

select * from picture;


SELECT ROUND(6371 * ACOS(COS(RADIANS(37.38367502882813))*COS(RADIANS(127.11225525089476))*COS(RADIANS(37.545589544321835)-RADIANS(127.0042547578951))+SIN(RADIANS(37.38367502882813))*SIN(RADIANS(127.11225525089476))),2)AS DISTANCE;

select * from notice_board order by notice_board_num;

use 2sa;

CREATE TABLE comment
(
   comment_num           int  auto_increment,
   member_num            int  NOT NULL ,
   comment_content       varCHAR(500) not NULL ,
   board_num             int  not NULL ,
   content_num           int  not NULL ,
   comment_date          datetime not NULL ,
   is_secrete            boolean not  NULL,
   constraint pk_comment primary key(comment_num)
);


CREATE TABLE container
(
   container_num         int  auto_increment,
   staff_num             int not  NULL ,
   container_capacity    int not  NULL,
    regi_date_container    datetime not null,
    con_name              varchar(50) not null,
   constraint pk_container primary key(container_num)
);

CREATE TABLE item_list
(
   item_name             varCHAR(50)  not null,
   member_num            int not  NULL ,
   item_list_num         int  NOT NULL ,
   box_cnt               int not  NULL,
    constraint pk_item_list primary key(item_list_num)
);


CREATE TABLE member
(
   member_num            int   auto_increment,
   member_name           varchar(50) not NULL ,
   member_pw             varchar(50) not NULL ,
   member_tel           varchar(50) not NULL ,
   member_id             varchar(50) not NULL ,
   regi_date             datetime  NULL,
    constraint pk_member primary key(member_num)
);


CREATE TABLE movement_status
(
   movement_statrt_time  datetime  NULL,
   truck_leave_time      datetime  NULL ,
   depart_time           datetime  NULL ,
   complete_time         datetime  NULL ,
   reservation_num       int  NOT NULL,
    constraint pk_movement_status primary key(reservation_num)
);



CREATE TABLE notice_board
(
   notice_board_num      int NOT NULL auto_increment,
   notice_date     datetime not  NULL ,
   notice_subject  varCHAR(50) not NULL,
   notice_content        varCHAR(500)  NULL ,
   notice_views_cnt      int not  NULL ,
   staff_num             int  NOT NULL,
    constraint pk_notice_board primary key(notice_board_num)
);






CREATE TABLE payment
(
   payment_num           int   auto_increment,
   price                 int not  NULL ,
   payment_date          datetime,
   payment_type          int not NULL ,
   cash_bill             boolean not NULL ,
   member_num            int  NOT NULL ,
   is_refund             boolean not NULL ,
   refund_check          boolean not NULL ,
   reservation_num       int not NULL ,
   payment_deadline      datetime not NULL ,
    truck_num int not null,
    container_num int ,
    constraint pk_payment primary key(payment_num)
);



CREATE TABLE picture
(
   picture_num           int   auto_increment,
   member_num            int  NOT NULL,
    img                 varChar(100) not null,
    estimate_board_num    int not null,
    constraint pk_picture primary key(picture_num)
);




CREATE TABLE qna_board
(
   qna_board_num         int  NOT NULL auto_increment,
   qna_date              datetime not NULL ,
   qna_subject      varChar(50) not NULL,
   qna_content           varCHAR(500) not NULL ,
   member_num            int  NOT NULL ,
   is_confirm            boolean not  NULL ,
   qna_views_cnt         int  not NULL ,
   is_secret            boolean  not NULL,
   pos         int not NULL,
   depth         int,
    constraint pk_qna_board primary key(qna_board_num)
);


CREATE TABLE reservation
(
   reservation_num       int   auto_increment,
   reservation_date      datetime not NULL ,
   template_num          int not NULL ,
   price                 int not NULL ,
   staff_num             int  NOT NULL ,
   is_confirm            boolean not  NULL ,
   estimate_board_num         int not NULL ,
   reservation_time       int not  NULL ,
   keep_item_date        int not  NULL ,
      member_num int not null,   
    constraint pk_reservation primary key(reservation_num)
);



CREATE TABLE estimate_board
(
	estimate_board_num  int  NOT NULL auto_increment,
	member_num            int  NOT NULL ,
	estimate_content   varCHAR(500) not NULL ,
	estimate_date  datetime not NULL ,
	pre_price             int  not NULL ,
	pre_estimate_time  int not  NULL,
	addr1                 varCHAR(50) not  NULL ,
	addr2                 varCHAR(50) not NULL ,
   	distance		int not null,
    constraint pk_estimate_board primary key(estimate_board_num)
);

drop table estimate_board;
select estimate_content from estimate_board;




CREATE TABLE review_board
(
   review_board_num      int  NOT NULL auto_increment,
   review_subject      varCHAR(50) not NULL,
   review_content        varCHAR(300) not NULL ,
   star                  int  not null ,
   review_date           datetime  not NULL ,
   review_views_cnt      int  NULL ,
   member_num            int  NOT NULL, 
   constraint pk_review_board primary key(review_board_num)
);




CREATE TABLE staff (
    staff_num INT  AUTO_INCREMENT,
    staff_name VARCHAR(30) NOT NULL,
    staff_id VARCHAR(50) NOT NULL,
    staff_pw VARCHAR(50) NOT NULL,
    dept_type INT NOT NULL,
    staff_tel VARCHAR(30) NULL,
    regi_date_staff datetime not null,
    constraint pk_staff primary key(staff_num)
);



CREATE TABLE template
(
   template_num          int  auto_increment,
   member_id            varchar(25)  not NULL ,
    img_name           varchar(30) not null,
constraint pk_template primary key(template_num)
);



CREATE TABLE truck
(
   truck_num             int  auto_increment,
   staff_num             int  NULL ,
   truck_capacity        int  NULL ,
   car_type              varchar(30)  NULL ,
   car_num               varchar(30)  NULL,
    regi_date_truck    datetime not null,
    constraint pk_truk primary key(truck_num)   
);


create table staff_dept(
   dept_type int auto_increment,
    dept_name varchar(50) not null,
    constraint pk_dept primary key(dept_type) 
);

create table member_history(
	history_num int auto_increment,
	member_num int not null,
	history_cnt int not null,
    refund_cnt int default '0' ,
	constraint pk_history primary key(history_num)
);


insert into member (member_name,member_pw,member_tel,member_id,regi_date)
 values('1번','1111','010-2','3member',sysdate());
insert into member (member_name,member_pw,member_tel,member_id,regi_date)
 values('2번','1111','010-2','3member',sysdate());
insert into member (member_name,member_pw,member_tel,member_id,regi_date)
 values('3번','1111','010-2','3member',sysdate());
 insert into member (member_name,member_pw,member_tel,member_id,regi_date)
 values('4번','1111','010-2','4member',sysdate());
 insert into member (member_name,member_pw,member_tel,member_id,regi_date)
 values('5번','1111','010-2','5member',sysdate());
 insert into member (member_name,member_pw,member_tel,member_id,regi_date)
 values('6번','1111','010-2','6member',sysdate());
 insert into member (member_name,member_pw,member_tel,member_id,regi_date)
 values('7번','1111','010-2','7member',sysdate());
 insert into member (member_name,member_pw,member_tel,member_id,regi_date)
 values('8번','1111','010-2','8member',sysdate());

insert into staff(staff_name,staff_id,staff_pw,dept_type,staff_tel,regi_date_staff)
values('1번 직원','1staff','1111','1','010',sysdate());
insert into staff(staff_name,staff_id,staff_pw,dept_type,staff_tel,regi_date_staff)
values('2번 직원','2staff','1111','2','010',sysdate());
insert into staff(staff_name,staff_id,staff_pw,dept_type,staff_tel,regi_date_staff)
values('3번 직원','3staff','1111','3','010',sysdate());
insert into staff(staff_name,staff_id,staff_pw,dept_type,staff_tel,regi_date_staff)
values('4번 직원','4staff','1111','4','010',sysdate());
insert into staff(staff_name,staff_id,staff_pw,dept_type,staff_tel,regi_date_staff)
values('5번 직원','5staff','1111','1','010',sysdate());
insert into staff(staff_name,staff_id,staff_pw,dept_type,staff_tel,regi_date_staff)
values('6번 직원','6staff','1111','2','010',sysdate());
insert into staff(staff_name,staff_id,staff_pw,dept_type,staff_tel,regi_date_staff)
values('7번 직원','7staff','1111','3','010',sysdate());
insert into staff(staff_name,staff_id,staff_pw,dept_type,staff_tel,regi_date_staff)
values('8번 직원','8staff','1111','4','010',sysdate()); 

insert into staff_dept(dept_name) values("사이트 관리부");
insert into staff_dept(dept_name) values("트럭 관리부");
insert into staff_dept(dept_name) values("컨테이너 관리부");
insert into staff_dept(dept_name) values("이삿짐부");

insert into truck (staff_num,truck_capacity,car_type,car_num,regi_date_truck) 
values(2,4,'트럭1','가23 다2541',sysdate());
insert into truck (staff_num,truck_capacity,car_type,car_num,regi_date_truck) 
values(6,3,'트럭2','가23 자2541',sysdate());
insert into truck (staff_num,truck_capacity,car_type,car_num,regi_date_truck) 
values(2,5,'트럭3','가23 아2541',sysdate());
insert into truck (staff_num,truck_capacity,car_type,car_num,regi_date_truck) 
values(6,4,'트럭4','가23 사2541',sysdate());
insert into truck (staff_num,truck_capacity,car_type,car_num,regi_date_truck) 
values(2,2,'트럭5','가23 마2541',sysdate());
insert into truck (staff_num,truck_capacity,car_type,car_num,regi_date_truck) 
values(6,4,'트럭6','가23 라551',sysdate());

insert into container (staff_num,container_capacity,regi_date_container,con_name)
values(3,20,sysdate(),'컨테이너1');
insert into container (staff_num,container_capacity,regi_date_container,con_name)
values(7,30,sysdate(),'컨테이너2');
insert into container (staff_num,container_capacity,regi_date_container,con_name)
values(3,20,sysdate(),'컨테이너3');
insert into container (staff_num,container_capacity,regi_date_container,con_name)
values(7,30,sysdate(),'컨테이너4');
insert into container (staff_num,container_capacity,regi_date_container,con_name)
values(3,20,sysdate(),'컨테이너5');
insert into container (staff_num,container_capacity,regi_date_container,con_name)
values(7,30,sysdate(),'컨테이너6');

insert into payment (price,payment_date,payment_type,cash_bill,member_num,is_refund,refund_check,reservation_num,payment_deadline,truck_num,container_num) 
values(250000,now(),1,false,1,false,false,1,now(),1,null);
insert into payment (price,payment_date,payment_type,cash_bill,member_num,is_refund,refund_check,reservation_num,payment_deadline,truck_num,container_num) 
values(285000,now(),1,false,2,false,false,2,now(),1,null);
insert into payment (price,payment_date,payment_type,cash_bill,member_num,is_refund,refund_check,reservation_num,payment_deadline,truck_num,container_num) 
values(250800,now(),1,false,3,false,false,3,now(),2,null);
insert into payment (price,payment_date,payment_type,cash_bill,member_num,is_refund,refund_check,reservation_num,payment_deadline,truck_num,container_num) 
values(254100,now(),1,false,4,false,false,4,now(),2,null);
insert into payment (price,payment_date,payment_type,cash_bill,member_num,is_refund,refund_check,reservation_num,payment_deadline,truck_num,container_num) 
values(271100,now(),1,false,1,false,false,5,now(),2,1);
insert into payment (price,payment_date,payment_type,cash_bill,member_num,is_refund,refund_check,reservation_num,payment_deadline,truck_num,container_num) 
values(250000,now(),1,false,2,false,false,6,now(),3,2);
insert into payment (price,payment_date,payment_type,cash_bill,member_num,is_refund,refund_check,reservation_num,payment_deadline,truck_num,container_num) 
values(250000,now(),1,false,3,false,false,7,now(),4,2);
insert into payment (price,payment_date,payment_type,cash_bill,member_num,is_refund,refund_check,reservation_num,payment_deadline,truck_num,container_num) 
values(250000,now(),1,false,4,false,false,8,now(),5,null);
insert into payment (price,payment_date,payment_type,cash_bill,member_num,is_refund,refund_check,reservation_num,payment_deadline,truck_num,container_num) 
values(250000,now(),1,false,5,false,false,9,now(),6,null);
insert into payment (price,payment_date,payment_type,cash_bill,member_num,is_refund,refund_check,reservation_num,payment_deadline,truck_num,container_num) 
values(250000,now(),1,false,6,false,false,10,now(),1,3);
insert into payment (price,payment_date,payment_type,cash_bill,member_num,is_refund,refund_check,reservation_num,payment_deadline,truck_num,container_num) 
values(250000,now(),1,false,5,true,false,11,now(),2,4);
insert into payment (price,payment_date,payment_type,cash_bill,member_num,is_refund,refund_check,reservation_num,payment_deadline,truck_num,container_num) 
values(250000,now(),1,false,6,true,false,12,now(),3,5);
insert into payment (price,payment_type,cash_bill,member_num,is_refund,refund_check,reservation_num,payment_deadline,truck_num,container_num) 
values(250000,1,false,6,true,false,12,now(),3,5);

insert into reservation (reservation_date,template_num,price,staff_num,is_confirm,estimate_board_num,reservation_time,keep_item_date,member_num)
value (now(),1,250000,1,false,1,18,0,1);
insert into reservation (reservation_date,template_num,price,staff_num,is_confirm,estimate_board_num,reservation_time,keep_item_date,member_num)
value (now(),1,250000,1,false,2,20,0,2);
insert into reservation (reservation_date,template_num,price,staff_num,is_confirm,estimate_board_num,reservation_time,keep_item_date,member_num)
value (now(),1,250000,1,false,3,8,0,3);
insert into reservation (reservation_date,template_num,price,staff_num,is_confirm,estimate_board_num,reservation_time,keep_item_date,member_num)
value (now(),1,250000,1,false,4,18,0,4);
insert into reservation (reservation_date,template_num,price,staff_num,is_confirm,estimate_board_num,reservation_time,keep_item_date,member_num)
value (now(),1,250000,1,false,5,18,7,1);
insert into reservation (reservation_date,template_num,price,staff_num,is_confirm,estimate_board_num,reservation_time,keep_item_date,member_num)
value (now(),1,250000,1,false,6,18,7,2);
insert into reservation (reservation_date,template_num,price,staff_num,is_confirm,estimate_board_num,reservation_time,keep_item_date,member_num)
value (now(),1,250000,1,false,7,18,7,3);
insert into reservation (reservation_date,template_num,price,staff_num,is_confirm,estimate_board_num,reservation_time,keep_item_date,member_num)
value (now(),1,250000,1,false,8,18,7,4);
insert into reservation (reservation_date,template_num,price,staff_num,is_confirm,estimate_board_num,reservation_time,keep_item_date,member_num)
value (now(),1,250000,1,false,9,18,0,5);
insert into reservation (reservation_date,template_num,price,staff_num,is_confirm,estimate_board_num,reservation_time,keep_item_date,member_num)
value (now(),1,250000,1,false,10,18,0,6);
insert into reservation (reservation_date,template_num,price,staff_num,is_confirm,estimate_board_num,reservation_time,keep_item_date,member_num)
value (now(),1,250000,1,false,11,18,7,5);
insert into reservation (reservation_date,template_num,price,staff_num,is_confirm,estimate_board_num,reservation_time,keep_item_date,member_num)
value (now(),1,250000,1,false,12,18,7,6);

insert into estimate_board (member_num,estimate_content,pre_price,pre_estimate_time,addr1,addr2,distance,estimate_date) 
values(1,'1111',254111,'2016-07-01','서울시','서울시',20,now());
insert into estimate_board (member_num,estimate_content,pre_price,pre_estimate_time,addr1,addr2,distance,estimate_date)  
values(2,'1111',254111,'2016-6-12','서울시','서울시',20,now());
insert into estimate_board (member_num,estimate_content,pre_price,pre_estimate_time,addr1,addr2,distance,estimate_date) 
values(3,'1111',254111,'2016-6-13','서울시','서울시',20,now());
insert into estimate_board (member_num,estimate_content,pre_price,pre_estimate_time,addr1,addr2,distance,estimate_date) 
values(4,'1111',254111,'2016-6-15','서울시','서울시',20,now());
insert into estimate_board (member_num,estimate_content,pre_price,pre_estimate_time,addr1,addr2,distance,estimate_date) 
values(1,'1111',254111,'2016-6-14','서울시','서울시',20,now());
insert into estimate_board (member_num,estimate_content,pre_price,pre_estimate_time,addr1,addr2,distance,estimate_date) 
values(2,'1111',254111,'2016-6-16','서울시','서울시',20,now());
insert into estimate_board (member_num,estimate_content,pre_price,pre_estimate_time,addr1,addr2,distance,estimate_date) 
values(3,'1111',254111,'2016-6-17','서울시','서울시',20,now());
insert into estimate_board (member_num,estimate_content,pre_price,pre_estimate_time,addr1,addr2,distance,estimate_date) 
values(4,'1111',254111,'2016-9-12','서울시','서울시',20,now());
insert into estimate_board (member_num,estimate_content,pre_price,pre_estimate_time,addr1,addr2,distance,estimate_date) 
values(5,'1111',254111,'2016-7-12','서울시','서울시',20,now());
insert into estimate_board (member_num,estimate_content,pre_price,pre_estimate_time,addr1,addr2,distance,estimate_date) 
values(6,'1111',254111,'2016-8-12','서울시','서울시',20,now());
insert into estimate_board (member_num,estimate_content,pre_price,pre_estimate_time,addr1,addr2,distance,estimate_date) 
values(5,'1111',254111,'2016-06-22','서울시','서울시',20,now());
insert into estimate_board (member_num,estimate_content,pre_price,pre_estimate_time,addr1,addr2,distance,estimate_date) 
values(6,'1111',254111,'2016-6-25','서울시','서울시',20,now());


insert into member_history (member_num,history_cnt) values(1,2);
insert into member_history (member_num,history_cnt) values(2,2);
insert into member_history (member_num,history_cnt) values(3,2);
insert into member_history (member_num,history_cnt) values(4,2);
insert into member_history (member_num,history_cnt,refund_cnt) values(5,2,1);
insert into member_history (member_num,history_cnt,refund_cnt) values(6,2,1);





create view Stastitics_all as
select distinct p.payment_num,e.distance,p.price,p.member_num,p.is_refund,t.car_type,c.con_name,m.member_id ,p.payment_date
from reservation r 
inner join estimate_board e on r.estimate_board_num=e.estimate_board_num 
inner join payment p on r.member_num=p.member_num inner join truck t on p.truck_num =t.truck_num 
inner join member m on p.member_num=m.member_num left join container c on c.container_num=p.container_num;

create view stastitics_membersub as
select count(*) count_pay ,member_num payment_member from payment group by member_num;

create view stastitics_member as
select m.member_id,m.regi_date,member_tel,member_name,p.count_pay from member m
inner join
stastitics_membersub p on p.payment_member=m.member_num;