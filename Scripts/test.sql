select password('테스트'), length(password('테스트'));
select * from customer where password = password('qwerty1234');

insert into tbl_board (title, content, writer)
(select title, content, writer from tbl_board);

select * from notice;
select * from tbl_member;
select * from review;
select * from review_attach;

select count(notice_no) from notice;
select count(review_no) from review;

insert into notice(content, title, is_notice, member_code, writer)
(select content, title, is_notice, member_code, writer from notice);

insert into review(review_title, review_writer, review_content, member_code) (select review_title, review_writer, review_content, member_code from review);

insert into notice(content, title, is_notice, member_code, writer) values
(null, '유스오페라콰이어 추가모집 안내(재공지)', 1, 'M19002', '관리자'),
(null, '2019 오페라클래스 수강생 모집', 1, 'M19002', '관리자'),
(null, '공연시 대구삼성창조캠퍼스 유료주차장 이용 안내', 1, 'M19002', '관리자');

select concat('P', DATE_FORMAT(now(), "%y"), lpad(right(max(show_code), 3) + 1, 3, '000'))
from performance;

select concat('M', DATE_FORMAT(now(), "%y"), lpad(right(max(member_code), 3) + 1, 3, '000'))
from tbl_member;

select * from notice;
select * from notice_attach;
select * from notice_attach where notice_no = 532;

select notice.nextval from dual;

select * from notice_attach
where upload_path = DATE_FORMAT(date_add(now(), interval -1 day), '%Y\%m\%d'); -- 어제날짜


select last_insert_id();

select count(review_no) from review where review_writer like CONCAT('%', '김보민', '%');

select * from performance;

insert into performance values
('P19018', '한헝 수교 30주년 기념 공연 오페라 콘체르탄테 <반크 반>', 'A', 160, '19:00', '2019-01-17', '2019-01-17', 1, null, null, (select total_seatCnt from facilities where facilities_no = 1 ));