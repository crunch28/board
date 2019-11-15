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
