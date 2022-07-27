create table person(driver_id varchar(10),name varchar(10),address varchar(10),primary key(driver_id));
create table car(regno varchar(10),model varchar(10),year int,primary key(regno));
create table accident(report_number int,accd_date date,location varchar(10),primary key(report_number));
create table owns(driver_id varchar(10),regno varchar(10),primary key(driver_id,regno),foreign key(driver_id) references person(driver_id),foreign key(regno) references car(regno));
create table participated(driver_id varchar(10),regno varchar(10),report_number int,damage_amount int,primary key(driver_id,regno,report_number),foreign key(driver_id) references person(driver_id),foreign key(regno) references car(regno),foreign key(report_number) references accident(report_number));

insert into person values('D1','Tony','Heirok');
insert into  car values('MN01W1234','Swift',2005);
insert into accident values(20,'2008-07-27','Imphal');
insert into owns values('D1','MN01W1234');
insert into participated values('D1','MN01W1234',20,25000);

insert into person values('D2','Abungo','Uchiwa');
insert into  car values('MN01W5647','I20',2006);
insert into accident values(21,'2009-07-27','Imphal');
insert into owns values('D2','MN01W5647');
insert into participated values('D2','MN01W5647',21,50000);

insert into person values('D3','Bikash','Lamshang');
insert into  car values('MN05R3476','Swift',2006);
insert into accident values(25,'2008-03-27','Imphal');
insert into owns values('D3','MN05R3476');
insert into participated values('D3','MN05R3476',25,5000);

insert into person values('D4','Somorendro','Kwakeithel');
insert into  car values('MN06S4565','Dzire',2006);
insert into accident values(28,'2006-09-21','Imphal');
insert into owns values('D4','MN06S4565');
insert into participated values('D4','MN06S4565',28,40000);

insert into person values('D5','Benjamin','Hayel');
insert into  car values('MN01AS1234','Swift',2005);
insert into accident values(29,'2008-04-25','Imphal');
insert into owns values('D5','MN01AS1234');
insert into participated values('D5','MN01AS1234',29,30000);

update participated set damage_amount=25000 where report_number BETWEEN 12 and 25000 and regno='MN01AS1234';

insert into accident values(30,'2008-06-27','IMPHAL');
insert into participated values('D4','MN06S4565',30,34000);

select count(distinct o.driver_id) as People from owns o,participated p,accident a where a.accd_date like
 '2008%' and o.regno=p.regno and p.report_number=a.report_number;

select count(*) as Totalcars from car c,participated p where c.regno=p.regno and c.model='Swift';
