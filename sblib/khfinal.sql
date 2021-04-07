---------------------------------------------------
--1.member table
---------------------------------------------------
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

-- 관리자 계정 생성 insert 꼭 해주세요
INSERT INTO member values(memberno_seq.NEXTVAL, '관리자', 'sblib' ,'ef5e41574b23f72df908807a031a6261c5dc1bd6c4c6dd2bf2b970de2eef4def','19600201','01012345678','강서구','sblib@naver.com','manager');

---------------------------------------------------
--2.notice table
---------------------------------------------------
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

CREATE SEQUENCE noticeno_seq START WITH 1 INCREMENT BY 1;
alter table notice add constraint pk_notice primary key (notice_no);

---------------------------------------------------
--3.event table
---------------------------------------------------
create table event(
event_no number,
event_title varchar2(250),
event_info varchar2(2048),
event_start varchar2(20),
event_end varchar2(20),
event_image varchar2(1000)
)
create sequence seq_event;
alter table event add constraint pk_event primary key (event_no);

---------------------------------------------------
--4.event_reply table
---------------------------------------------------
create table event_reply(
reply_no number, --pk
event_no number not null, --fk
reply varchar2(1000) not null,
replyer varchar2(50) not null,
replyDate date default sysdate,
updateDate date default sysdate
)
create sequence seq_event_reply;
alter table event_reply add constraint pk_event_reply primary key (reply_no);
alter table event_reply add constraint fk_reply_event foreign key (event_no) references event(event_no);
        
---------------------------------------------------
--5.holiday table
---------------------------------------------------
create table holiday(
holiday_title varchar2(250),
holiday_start varchar2(20),
holiday_end varchar2(20)
)

---------------------------------------------------
--6.bookstory table
---------------------------------------------------
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
alter table bookstory add constraint pk_bookstory primary key (story_no);

---------------------------------------------------
--7.Question table
---------------------------------------------------
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
alter table question add constraint pk_question primary key (que_no);

---------------------------------------------------
--8.Answer table
---------------------------------------------------
create table answer(
    que_no              NUMBER  NOT NULL ,
   ans_title           VARCHAR2(50)  NOT NULL ,
   ans_content         VARCHAR2(2048) NOT NULL ,
   ans_regdate         DATE  default sysdate 
);
create sequence seq_answer START WITH 1 INCREMENT BY 1;
alter table answer add primary key (que_no);

---------------------------------------------------
--9.reply table
---------------------------------------------------
create table reply(
   reply_no NUMBER  NOT NULL ,
   story_no NUMBER  NOT NULL ,
   reply_content VARCHAR2(2048) NOT NULL ,
   reply_author VARCHAR2(50)  NOT NULL ,
   reply_regdate DATE  default sysdate 
);

create sequence seq_reply START WITH 1 INCREMENT BY 1;
alter table reply add constraint pk_reply primary key (reply_no);
alter table reply add constraint fk_reply_board foreign key (story_no) references bookstory (story_no);

---------------------------------------------------
--10.book table
---------------------------------------------------
CREATE TABLE "BOOK" (
"TITLE" VARCHAR2(200), 
"PRICE" VARCHAR2(200), 
"ISBN" VARCHAR2(200), 
"AUTHOR" VARCHAR2(200), 
"IMAGE" VARCHAR2(1024), 
"DISCOUNT" VARCHAR2(300), 
"PUBLISHER" VARCHAR2(1024), 
"PUBDATE" VARCHAR2(40), 
"DESCRIPTION" VARCHAR2(2024), 
"LINK" VARCHAR2(512), 
"NOWCOUNT" NUMBER, 
"BNO" NUMBER
);

CREATE UNIQUE INDEX "BOOK_PK" ON "BOOK" ("BNO")
CREATE SEQUENCE seq_book
ALTER TABLE "BOOK" ADD CONSTRAINT "BOOK_PK" PRIMARY KEY ("BNO") ENABLE
ALTER TABLE "BOOK" MODIFY ("BNO" NOT NULL ENABLE)
alter table book add constraint isbn_uk UNIQUE(ISBN);
ALTER TABLE book ADD (TODAYBOOK number );

update book set nowcount = 1;

---------------------------------------------------
--11.rentinfo table
---------------------------------------------------
create table rentInfo(
rentid number not null ,
bno number not null,
member_no number not null,
rentDate date default sysdate,
returndate date
);

create sequence seq_rentid;

alter table rentInfo add constraint rent_pk primary key(rentid);
alter table rentInfo add constraint rent_memberno_fk foreign key(member_no) references member(member_no);
alter table rentinfo add constraint bno_fk foreign key(bno) references book(bno) on delete CASCADE;

---------------------------------------------------
--12.book_cart
---------------------------------------------------
  CREATE TABLE "BOOK_CART" 
   (   "CARTNUM" NUMBER, 
   "MEMBER_NO" NUMBER, 
   "BNO" NUMBER, 
   "ADDDATE" DATE DEFAULT sysdate
   )

CREATE SEQUENCE seq_book_cart;

 ALTER TABLE BOOK_CART ADD PRIMARY KEY (CARTNUM);

  ALTER TABLE "BOOK_CART" MODIFY ("BNO" NOT NULL ENABLE);
  ALTER TABLE "BOOK_CART" MODIFY ("MEMBER_NO" NOT NULL ENABLE);
  ALTER TABLE "BOOK_CART" MODIFY ("CARTNUM" NOT NULL ENABLE); 


  ALTER TABLE "BOOK_CART" ADD CONSTRAINT "BOOK_CART_BOOK" FOREIGN KEY ("BNO") REFERENCES "BOOK" ("BNO") ENABLE;
  ALTER TABLE "BOOK_CART" ADD CONSTRAINT "BOOK_CART_MEMBER" FOREIGN KEY ("MEMBER_NO") REFERENCES "MEMBER" ("MEMBER_NO") ENABLE
  
---------------------------------------------------
-- rentalmanage view
---------------------------------------------------
create view RENTALMANAGE as
select /*+ INDEX_DESC(RENTINFO RENT_PK) */ rn.rentid"rentid",
m.member_name"member_name",
rn.member_no"member_no",
b.title "book_title",
nvl(to_char(rn.returndate),'반납전') "returndate",
rn.rentdate"rental_date",b.isbn"book_no" ,
rn.rentdate+14"rexpected_date" ,
case when 
nvl(to_char(rn.returndate),'반납전')='반납전' then case when trunc(sysdate-(rn.rentdate+14))>0 then trunc(sysdate-(rn.rentdate+14))  
when trunc(sysdate-(rn.rentdate+14))<=0 then 0 end
else
case when trunc(rn.returndate-(rn.rentdate+14))>0
then trunc(rn.returndate-(rn.rentdate+14))  
when trunc(rn.returndate-(rn.rentdate+14))<=0 then 0 end
end
"delay_date" from rentinfo rn
,member m
,book b where  rn.bno=b.bno(+) and m.member_no(+)=rn.member_no order by rn.rentid asc;
---------------------------------------------------