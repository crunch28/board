create sequence seq_board;

create table tbl_board(
bno number(10,0),
title varchar2(200) not null,
content varchar2(2000) not null,
writer varchar2(50) not null,
regdate date default sysdate,
updatedate date default sysdate
);

alter table tbl_board add constraint pk_board primary key(bno);

insert into tbl_board (bno, title, content, writer) values(seq_board.nextval, '테스트 제목', '테스트 내용', 'user00');


힌트를 이용한 쿼리문
select * from tbl_board order by bno desc;
select /*+INDEX_DESC (tbl_board pk_board)*/* from tbl_board;

인덱스를 이용한 접근 시 ROWNUM
select /*+ INDEX_ASC(tbl_board pk_board) */ rownum rn, bno, title, content from tbl_board;
select /*+ INDEX_DESC(tbl_board pk_board */ rownum rn, bno, title, content from tbl_board where rownum <= 10;

단일항목 검색처리 제목 검색, test 키워드
select * from(select /*+INDEX_DESC(tbl_board pk_board) */ rownum rn, bno, title, content, writer, regdate, updatedate from tbl_board where --변경부분 title like '%Test%' and rownum <= 20) where rn >10;

다중항목 검색처리 제목, 내용검색 test 키워드
select * from(select /*+INDEX_DESC(tbl_board pk_board) */ rownum rn, bno, title, content, writer, regdate, updatedate from tbl_board where --변경부분 (title like '%Test%' or content like '%Test%') and rownum <= 20) where rn >10;

댓글테이블
create table tbl_reply(
rno number(10,0),
bno number(10,0) not null,
reply varchar(1000) not null,
replyer varchar(50) not null,
replyDate date default sysdate,
updateDate date default sysdate
);
create sequence seq_reply;
alter table tbl_reply add constraint pk_reply primary key(rno);
alter table tbl_reply add constraint fk_reply_board foreign key(bno) references tbl_board(bno);

인덱스를 이용한 페이징 쿼리 단일항목
select /*+INDEX(tbl_reply idx_reply)*/ rownum rn, bno, rno, reply, replyer, replyDate, updatedate from tbl_reply where bno = 게시물번호 and rno>0

인덱스를 이용한 페이징 쿼리 다중항목
select rno, bno, reply, replyer, replydate, updatedate from (select /*+INDEX(tbl_reply idx_reply)*/ rownum rn, bno, rno, reply, replyer, replyDate, updatedate from tbl_reply where bno = 게시물번호 and rno > 0 and rownum <=20)where rn >10;

댓글 수 처리
alter table tbl_board add (replycnt number default 0);
update tbl_board set replycnt = (select count(rno) from tbl_reply where tbl_reply.bno = tbl_board.bno);

첨부파일 테이블
create table tbl_attach(
uuid varchar2(100) not null,
uploadPath varchar2(200) not null,
fileName varchar2(100) not null,
filetype char(1) default 'I',
bno number(10,0)
);
alter table tbl_attach add constraint pk_attach primary key(uuid);
alter table tbl_attach add constraint fk_board_attach foreign key(bno) references tbl_board(bno);

스프링 시큐리티의 지정된 테이블
create table users(
username varchar2(50) not null primary key,
password varchar2(50) not null,
enabled char(1) default '1'
);

create table authorities(
username varchar2(50) not null,
authority varchar2(50) not null,
constraint fk_authorities_users foreign key(username) references users(username));

create unique index ix_auth_username on authorities (username, authority);

insert into users(username, password) values('user00', 'pw00');
insert into users(username, password) values('member00', 'pw00');
)insert into users(username, password) values('admin00', 'pw00');

insert into authorities(username,authority) values('user00','ROLE_USER');
insert into authorities(username,authority) values('member00','ROLE_MANAGER');
insert into authorities(username,authority) values('admin00','ROLE_MANAGER');
insert into authorities(username,authority) values('admin00','ROLE_ADMIN');
commit;

일반적인 회원테이블과 권한 테이블
create table tbl_member(
userid varchar2(50) not null primary key,
userpw varchar2(100) not null,
username varchar2(100) not null,
regdate date default sysdate,
updatedate date default sysdate,
enabled char(1) default '1'
);

create table tbl_member_auth(
userid varchar2(50) not null,
auth varchar2(50) not null,
constraint fk_member_auth foreign key(userid) references tbl_member(userid)
);

스프링 시큐리티 공식문서 로그인정보 테이블
create table persistent_logins(
username varchar(64) not null,
series varchar(64) primary key,
token varchar(64) not null,
last_used timestamp not null
);
