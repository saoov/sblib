create table book(
bno number,
title varchar2(500),
link varchar2(500),
image varchar2(500),
author varchar2(500),
price varchar2(500),
discount varchar2(500),
publisher varchar2(500),
pubdate varchar2(500),
isbn varchar2(500),
description varchar2(500),
nowcount number,
count number,
 
);
create sequence seq_book;

select * from book

alter table book add primary key (bno);