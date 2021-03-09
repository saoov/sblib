create table event(
event_no number,
event_title varchar2(250),
event_info varchar2(2048),
event_start date,
event_end date,
event_image varchar2(1000)
)

drop table event

create sequence seq_event;
alter table event add constraint pk_event primary key (event_no);
insert into event(event_no, event_title, event_info, event_start, event_end) values (seq_event.nextval, '시낭송대회', '시낭송을 열심히 합시다', SYSDATE, to_date('2021-03-21','YYYY-MM-DD'))

select * from event order by event_no desc
insert into event(event_no, event_title, event_info, event_start, event_end, event_image) (select seq_event.nextval, event_title, event_info, event_start, event_end, event_image from event);

select * from(
    select /*+ INDEX_DESC(event pk_event) */ rownum rn, event_title, event_start, event_end 
    from event 
    where event_no > 0 and rownum > 0 and rownum <= 1*9)
where rn > (1-1)*9

insert into event(event_no, event_title, event_info, event_start, event_end, event_image) values(seq_event.nextval, '대축제','대축제를하자', to_date('2021-02-04','YYYY-MM-DD'), to_date('2021-02-09','YYYY-MM-DD'), 'gd.jpg')


select * from(
    select /*+ INDEX_DESC(event pk_event) */ rownum rn, event_title, event_info, event_start, event_end 
    from event 
    where event_no > 0 and rownum > 0 and rownum <= 1*9)
where rn > (1-1)*9

with example as(
select '<p><img src="/resources/fileupload/0cf81655-87b9-4dbb-bf97-7dd06f883cd6.jpg" style="width: 747px;"></p><p>ㅁㄻㄴㄹ</p>' as str from dual
)
select
substr(str, instr(str, '"', 1, 2)) from example
select event_title, event_start, event_end from event
--------------------------------------
--bookstory table
create table bookstory(
    story_no              NUMBER  NOT NULL ,
	story_title           VARCHAR2(50)  NULL ,
	story_content         VARCHAR2(2048)  NULL ,
	story_author          VARCHAR2(50)  NULL ,
	story_regdate         DATE  default sysdate ,
	story_updatedate      date  default sysdate ,
	story_readcount       NUMBER  NULL
);
create sequence seq_story START WITH 1 INCREMENT BY 1;

alter table bookstory add primary key (story_no);

insert into bookstory (story_no, story_title, story_content, story_author, story_readcount)
values (seq_story.nextval, 'Title4','content4','user00',0);

select * from bookstory;
---------------------------------------
--Question table
create table question(
    que_no              NUMBER  NOT NULL ,
	que_title           VARCHAR2(50)  NOT NULL ,
	que_content         VARCHAR2(2048) NOT NULL ,
	que_author          VARCHAR2(50)  NOT NULL ,
	que_regdate         DATE  default sysdate ,
	que_status          NUMBER NOT NULL ,
	que_pw              VARCHAR2(50)  NULL
);
create sequence seq_question START WITH 1 INCREMENT BY 1;

alter table question add constraint pk_question
primary key (que_no);

select * from question;

insert into question (que_no, que_title, que_content, que_author, que_status, que_pw)
values (seq_question.nextval, 'Title1','Content1','user01',1,'1111');


select * from question where que_author = 'user00' order by que_no desc
----------------------------------
--Answer table
create sequence seq_answer START WITH 1 INCREMENT BY 1;

create table answer(
    que_no              NUMBER  NOT NULL ,
	ans_title           VARCHAR2(50)  NOT NULL ,
	ans_content         VARCHAR2(2048) NOT NULL ,
	ans_regdate         DATE  default sysdate 
);

alter table answer add primary key (que_no);

select a.ans_title, a.ans_content, a.ans_regdate from answer a, question q where a.que_no=q.que_no;

insert into answer (que_no, ans_title, ans_content)
values (seq_answer.nextval, 'Title2','Content2');

select * from answer;

----------------------------------
--book table
CREATE TABLE "BOOK" (
"TITLE" VARCHAR2(200), 
"PRICE" VARCHAR2(200), 
"ISBN" VARCHAR2(200), 
"AUTHOR" VARCHAR2(200), 
"IMAGE" VARCHAR2(1024), 
"COUNT" NUMBER, 
"DISCOUNT" VARCHAR2(300), 
"PUBLISHER" VARCHAR2(1024), 
"PUBDATE" VARCHAR2(40), 
"DESCRIPTION" VARCHAR2(2024), 
"LINK" VARCHAR2(512), 
"NOWCOUNT" NUMBER, 
"BNO" NUMBER
);
alter table book add isloan varchar2(50);
select * from member;
CREATE UNIQUE INDEX "BOOK_PK" ON "BOOK" ("BNO")
CREATE SEQUENCE seq_book
ALTER TABLE "BOOK" ADD CONSTRAINT "BOOK_PK" PRIMARY KEY ("BNO") ENABLE

ALTER TABLE "BOOK" MODIFY ("BNO" NOT NULL ENABLE)

select*from book

----------------------------
--book cart table
create table book_cart(
cartNum number not null,
member_no number not null,
bno number not null,
cartStock number not null,
addDate date default sysdate,
primary key(cartNum, member_no)
);

create sequence seq_book_cart;

alter table book_cart add constraint book_cart_book foreign key(bno) references book(bno);
alter table book_cart add constraint book_cart_member foreign key(member_no) references member(member_no);
desc book

drop table book_cart

---------------------------
--rent table
create table rent(
rentid varchar2(50) not null,
userid varchar2(50) not null,
rentDate date default sysdate
);

alter table rent add constraint rent_pk primary key(rentid);
alter table rent add constraint rent_userid_fk foreign key(userid) references member(member_no);
alter table rent add constraint rent_book_fk foreign key(bno) references book(bno);
alter table rent add returnexDate date default sysdate+15 not null;
alter table rent add returndate date;
------------------------------
--rent details table
create table rent_details(
rentDetailNum number not null primary key,
rentid varchar2(50) not null,
bno number not null,
cartStock number not null
);


create sequence seq_rent_details;
alter table rent_details add constraint rent_details_rentid foreign key(rentid) references rent(rentid);

----------------------
--notice table
CREATE TABLE notice
(
	notice_no             NUMBER  NOT NULL ,
	notice_title          VARCHAR2(50)  NULL ,
	notice_content        VARCHAR2(2048)  NULL ,
	notice_regdate        DATE  NULL ,
	notice_updatedate     DATE  NULL ,
	notice_readcount      NUMBER  NULL ,
	notice_fileid         VARCHAR2(500)  NULL ,
	notice_filename       VARCHAR2(500)  NULL 
);

insert into notice(notice_no,notice_title,notice_content) values (noticeno_seq.NEXTVAL,'제목','내용') 



CREATE UNIQUE INDEX XPK공지사항 ON notice
(notice_no  ASC);

CREATE SEQUENCE noticeno_seq START WITH 1 INCREMENT BY 1;

ALTER TABLE notice
	ADD CONSTRAINT  XPK공지사항 PRIMARY KEY (notice_no);


select rownum, notice_no from notice;  
select * from notice
drop table notice
drop SEQUENCE noticeno_seq



insert into notice(notice_no, notice_title, notice_content)
			values(noticeno_seq.NEXTVAL, 'zz',  'zz')
            
---------------------------
--member table

CREATE TABLE member
(
   member_no             NUMBER  NOT NULL ,
   member_name           VARCHAR2(20)  NULL ,
   member_id             VARCHAR2(20)  NULL ,
   member_pw             VARCHAR2(100)  NULL ,
   member_birth          VARCHAR2(20)  NULL ,
   member_tel            VARCHAR2(20)  NULL ,
   member_addr           VARCHAR2(100)  NULL ,
   member_email          VARCHAR2(50)  NULL ,
   member_grade          VARCHAR2(100)  NULL 
);

CREATE SEQUENCE memberno_seq START WITH 1 INCREMENT BY 1;

CREATE UNIQUE INDEX ID ON member (member_id);

ALTER TABLE member ADD PRIMARY KEY (member_no);
    

select * from member
drop table member
drop SEQUENCE memberno_seq
update member set member_pw = 'dfasdfsadfasdfsadf', member_addr = 'sisi', 
		member_tel='sisi' where member_id = 'qhrud1014'
select count(*) from member where member_email = 'qhrud7127@naver.com'
delete from member
