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

