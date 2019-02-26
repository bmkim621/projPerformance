select password('테스트'), length(password('테스트'));
select * from customer where password = password('qwerty1234');

insert into tbl_board (title, content, writer)
(select title, content, writer from tbl_board);

select * from notice;

select count(notice_no) from notice;

insert into notice(content, title, is_notice, manager_code, writer)
(select content, title, is_notice, manager_code, writer from notice);

insert into notice(content, title, is_notice, manager_code, writer) values
(null, '유스오페라콰이어 추가모집 안내(재공지)', 1, 'M1901', '관리자'),
(null, '2019 오페라클래스 수강생 모집', 1, 'M1901', '관리자'),
(null, '공연시 대구삼성창조캠퍼스 유료주차장 이용 안내', 1, 'M1901', '관리자');
