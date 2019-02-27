-- proj_performance
DROP SCHEMA IF EXISTS proj_performance;

-- proj_performance
CREATE SCHEMA proj_performance;

use proj_performance;

-- 회원
CREATE TABLE tbl_member (
	member_code CHAR(6)     NOT NULL COMMENT '고객코드', -- 회원코드
	member_name VARCHAR(20) NOT NULL COMMENT '이름', -- 이름
	id          VARCHAR(30) NOT NULL COMMENT '아이디', -- 아이디
	password    CHAR(41)    NULL     COMMENT '비밀번호', -- 비밀번호
	email       VARCHAR(30) NOT NULL COMMENT '이메일', -- 이메일
	phone       VARCHAR(30) NOT NULL COMMENT '연락처', -- 연락처
	dob         DATE        NOT NULL COMMENT '생년월일', -- 생년월일
	regdate     TIMESTAMP   NULL     DEFAULT now() COMMENT '가입일', -- 가입일
	address     TEXT        NOT NULL COMMENT '주소', -- 주소
	isMember    TINYINT(1)  NULL     COMMENT '회원구분', -- 회원구분
	grade_code  VARCHAR(5)  NULL     COMMENT '등급코드' -- 등급코드
)
COMMENT '고객';

-- 회원
ALTER TABLE tbl_member
	ADD CONSTRAINT
		PRIMARY KEY (
			member_code -- 회원코드
		);

-- 할인
CREATE TABLE discount (
	discount_code CHAR(2)     NOT NULL COMMENT '00: 기본할인 + 10%, 10: 특별할인 + 20%', -- 할인분류코드
	discount_rate INT(11)     NOT NULL COMMENT '할인율', -- 할인율
	discount_name VARCHAR(50) NOT NULL COMMENT '할인내용' -- 할인내용
)
COMMENT '할인';

-- 할인
ALTER TABLE discount
	ADD CONSTRAINT
		PRIMARY KEY (
			discount_code -- 할인분류코드
		);

-- 시설
CREATE TABLE facilities (
	facilities_no   INT(11)     NOT NULL COMMENT '1관, 2관, ..', -- 공연시설번호
	total_floor     INT(11)     NOT NULL COMMENT '1층, 2층 = 2', -- 층개수
	zone_cnt        INT(11)     NOT NULL COMMENT 'A, B, C, BR, BL의 개수 = 5', -- 구역개수
	total_seatCnt   INT(11)     NOT NULL COMMENT '1층(140개), 2층(60개) = 200', -- 총좌석수
	facilities_name VARCHAR(50) NOT NULL COMMENT '본관, 별관' -- 공연시설명
)
COMMENT '시설';

-- 시설
ALTER TABLE facilities
	ADD CONSTRAINT
		PRIMARY KEY (
			facilities_no -- 공연시설번호
		);

-- 공지사항
CREATE TABLE notice (
	notice_no   INT(11)      NOT NULL COMMENT '공지사항번호', -- 공지사항번호
	content     TEXT         NULL     COMMENT '내용', -- 내용
	title       VARCHAR(200) NOT NULL COMMENT '제목', -- 제목
	regdate     TIMESTAMP    NOT NULL DEFAULT now() COMMENT '작성일', -- 작성일
	writer      VARCHAR(20)  NOT NULL COMMENT '작성자', -- 작성자
	is_notice   TINYINT(1)   NOT NULL COMMENT '알림이벤트구분', -- 알림구분
	view_cnt    INT(11)      NULL     DEFAULT 0 COMMENT '조회수', -- 조회수
	member_code CHAR(6)      NULL     COMMENT '회원코드' -- 회원코드
)
COMMENT '공지사항';

-- 공지사항
ALTER TABLE notice
	ADD CONSTRAINT
		PRIMARY KEY (
			notice_no -- 공지사항번호
		);

ALTER TABLE notice
	MODIFY COLUMN notice_no INT(11) NOT NULL AUTO_INCREMENT COMMENT '공지사항번호';

ALTER TABLE notice
	AUTO_INCREMENT = 12;

-- notice_attach
CREATE TABLE notice_attach (
	notice_filename     VARCHAR(150) NOT NULL COMMENT '파일이름', -- 파일이름
	notice_file_regdate TIMESTAMP    NULL     DEFAULT now() COMMENT '작성일', -- 작성일
	notice_no           INT(11)      NOT NULL COMMENT '공지사항번호' -- 공지사항번호
)
COMMENT '공지사항파일';

-- notice_attach
ALTER TABLE notice_attach
	ADD CONSTRAINT
		PRIMARY KEY (
			notice_filename -- 파일이름
		);

-- 결제
CREATE TABLE payment (
	payment_code CHAR(5)     NOT NULL COMMENT '결제방식코드', -- 결제방식코드
	payment_name VARCHAR(20) NOT NULL COMMENT '결제방식' -- 결제방식
)
COMMENT '결제';

-- 결제
ALTER TABLE payment
	ADD CONSTRAINT
		PRIMARY KEY (
			payment_code -- 결제방식코드
		);

-- 공연
CREATE TABLE performance (
	show_code       CHAR(6)      NOT NULL COMMENT 'P19(연도)001', -- 공연코드
	show_name       VARCHAR(200) NOT NULL COMMENT '공연제목', -- 공연제목
	show_type       CHAR(1)      NULL     COMMENT '기획공연(A), 대관공연(B), ..', -- 공연종류
	total_time      INT(11)      NULL     COMMENT '공연시간', -- 공연시간
	start_time      TIME         NULL     COMMENT '공연시작시간', -- 시작시간
	show_startdate  DATE         NOT NULL COMMENT '공연시작일', -- 공연시작일
	show_enddate    DATE         NOT NULL COMMENT '공연종료일', -- 공연종료일
	facilities_no   INT(11)      NULL     COMMENT '공연시설번호', -- 공연시설번호
	show_image_path TEXT         NULL     COMMENT '공연이미지경로' -- 공연이미지겨올
)
COMMENT '공연';

-- 공연
ALTER TABLE performance
	ADD CONSTRAINT
		PRIMARY KEY (
			show_code -- 공연코드
		);

-- 댓글
CREATE TABLE reply (
	reply_no      INT(11)       NOT NULL COMMENT '댓글번호', -- 댓글번호
	review_no     INT(11)       NOT NULL COMMENT '번호', -- 후기번호
	replyer       VARCHAR(50)   NOT NULL COMMENT '작성자', -- 작성자
	reply_content VARCHAR(1000) NOT NULL COMMENT '내용', -- 댓글내용
	regdate       TIMESTAMP     NOT NULL DEFAULT now() COMMENT '입력날짜', -- 댓글작성일
	updatedate    TIMESTAMP     NOT NULL DEFAULT now() COMMENT '수정날짜' -- 댓글수정일
)
COMMENT '댓글';

-- 댓글
ALTER TABLE reply
	ADD CONSTRAINT
		PRIMARY KEY (
			reply_no -- 댓글번호
		);

-- 예매
CREATE TABLE book (
	book_number   VARCHAR(10) NOT NULL COMMENT '예매번호', -- 예매번호
	member_code   CHAR(5)     NOT NULL COMMENT '고객코드', -- 회원코드
	show_code     CHAR(6)     NOT NULL COMMENT '공연코드', -- 공연코드
	payment_code  CHAR(5)     NOT NULL COMMENT '결제방식코드', -- 결제방식코드
	discount_code CHAR(2)     NOT NULL COMMENT '할인분류코드', -- 할인분류코드
	book_date     DATE        NOT NULL COMMENT '예매일', -- 예매일
	book_time     TIME        NOT NULL COMMENT '예매시간', -- 예매시간
	book_state    TINYINT(4)  NOT NULL COMMENT '0: 예매완료, 1: 예매중, ..', -- 예매상태
	book_floor    INT(11)     NOT NULL COMMENT '층', -- 층
	book_col      INT(11)     NOT NULL COMMENT '행', -- 행
	book_row      CHAR(2)     NOT NULL COMMENT '열' -- 열
)
COMMENT '예매';

-- 예매
ALTER TABLE book
	ADD CONSTRAINT
		PRIMARY KEY (
			book_number -- 예매번호
		);

-- 공연관람후기
CREATE TABLE review (
	review_no        INT(11)      NOT NULL COMMENT '번호', -- 후기번호
	review_img_path  TEXT         NULL     COMMENT '이미지경로', -- 이미지경로
	review_content   TEXT         NOT NULL COMMENT '내용', -- 내용
	review_post_date TIMESTAMP    NOT NULL DEFAULT now() COMMENT '작성일', -- 작성일
	review_view_cnt  INT(11)      NULL     COMMENT '조회수', -- 조회수
	review_title     VARCHAR(200) NOT NULL COMMENT '제목', -- 제목
	review_writer    VARCHAR(20)  NOT NULL COMMENT '작성자' -- 작성자
)
COMMENT '공연관람후기';

-- 공연관람후기
ALTER TABLE review
	ADD CONSTRAINT
		PRIMARY KEY (
			review_no -- 후기번호
		);

-- 후기첨부파일
CREATE TABLE review_attach (
	review_filename     VARCHAR(150) NOT NULL COMMENT '파일이름', -- 파일이름
	review_file_regdate TIMESTAMP    NULL     DEFAULT now() COMMENT '작성일', -- 파일업로드날
	review_no           INT(11)      NOT NULL COMMENT '번호' -- 후기번호
)
COMMENT '공연관람후기파일';

-- 후기첨부파일
ALTER TABLE review_attach
	ADD CONSTRAINT
		PRIMARY KEY (
			review_filename -- 파일이름
		);

-- 좌석
CREATE TABLE seat (
	loc_code      CHAR(5) NOT NULL COMMENT 'SEAT1: 비지정석, SEAT2: 지정석, SEAT3: 전석', -- 좌석분류코드
	zone          CHAR(3) NOT NULL COMMENT '1A, 2A', -- 구역
	facilities_no INT(11) NOT NULL COMMENT '공연시설번호', -- 공연시설번호
	start_loc     INT(11) NULL     COMMENT '1', -- 시작위치
	end_loc       INT(11) NULL     COMMENT '20' -- 끝위치
)
COMMENT '좌석';

-- 좌석
ALTER TABLE seat
	ADD CONSTRAINT
		PRIMARY KEY (
			loc_code, -- 좌석분류코드
			zone      -- 구역
		);

-- 등급
CREATE TABLE grade (
	grade_code VARCHAR(5)  NOT NULL COMMENT '등급코드', -- 등급코드
	grade_name VARCHAR(20) NOT NULL COMMENT '등급이름' -- 등급이름
)
COMMENT '등급';

-- 등급
ALTER TABLE grade
	ADD CONSTRAINT PK_grade -- 등급 기본키
		PRIMARY KEY (
			grade_code -- 등급코드
		);

-- notice_attach
ALTER TABLE notice_attach
	ADD CONSTRAINT FK_notice_TO_notice_attach -- FK_notice_TO_notice_attach
		FOREIGN KEY (
			notice_no -- 공지사항번호
		)
		REFERENCES notice ( -- 공지사항
			notice_no -- 공지사항번호
		)
		ON DELETE RESTRICT
		ON UPDATE RESTRICT,
	ADD INDEX FK_notice_TO_notice_attach (
		notice_no -- 공지사항번호
	);

-- 공연
ALTER TABLE performance
	ADD CONSTRAINT FK_facilities_TO_performance -- FK_facilities_TO_performance
		FOREIGN KEY (
			facilities_no -- 공연시설번호
		)
		REFERENCES facilities ( -- 시설
			facilities_no -- 공연시설번호
		)
		ON DELETE RESTRICT
		ON UPDATE RESTRICT,
	ADD INDEX FK_facilities_TO_performance (
		facilities_no -- 공연시설번호
	);

-- 댓글
ALTER TABLE reply
	ADD CONSTRAINT FK_review_TO_reply -- FK_review_TO_reply
		FOREIGN KEY (
			review_no -- 후기번호
		)
		REFERENCES review ( -- 공연관람후기
			review_no -- 후기번호
		)
		ON DELETE RESTRICT
		ON UPDATE RESTRICT,
	ADD INDEX FK_review_TO_reply (
		review_no -- 후기번호
	);

-- 예매
ALTER TABLE book
	ADD CONSTRAINT FK_customer_TO_reservation -- FK_customer_TO_reservation
		FOREIGN KEY (
			member_code -- 회원코드
		)
		REFERENCES tbl_member ( -- 회원
			member_code -- 회원코드
		)
		ON DELETE RESTRICT
		ON UPDATE RESTRICT,
	ADD INDEX FK_customer_TO_reservation (
		member_code -- 회원코드
	);

-- 예매
ALTER TABLE book
	ADD CONSTRAINT FK_discount_TO_reservation -- FK_discount_TO_reservation
		FOREIGN KEY (
			discount_code -- 할인분류코드
		)
		REFERENCES discount ( -- 할인
			discount_code -- 할인분류코드
		)
		ON DELETE RESTRICT
		ON UPDATE RESTRICT,
	ADD INDEX FK_discount_TO_reservation (
		discount_code -- 할인분류코드
	);

-- 예매
ALTER TABLE book
	ADD CONSTRAINT FK_payment_TO_reservation -- FK_payment_TO_reservation
		FOREIGN KEY (
			payment_code -- 결제방식코드
		)
		REFERENCES payment ( -- 결제
			payment_code -- 결제방식코드
		)
		ON DELETE RESTRICT
		ON UPDATE RESTRICT,
	ADD INDEX FK_payment_TO_reservation (
		payment_code -- 결제방식코드
	);

-- 예매
ALTER TABLE book
	ADD CONSTRAINT FK_performance_TO_reservation -- FK_performance_TO_reservation
		FOREIGN KEY (
			show_code -- 공연코드
		)
		REFERENCES performance ( -- 공연
			show_code -- 공연코드
		)
		ON DELETE RESTRICT
		ON UPDATE RESTRICT,
	ADD INDEX FK_performance_TO_reservation (
		show_code -- 공연코드
	);

-- 후기첨부파일
ALTER TABLE review_attach
	ADD CONSTRAINT FK_review_TO_review_attach -- FK_review_TO_review_attach
		FOREIGN KEY (
			review_no -- 후기번호
		)
		REFERENCES review ( -- 공연관람후기
			review_no -- 후기번호
		)
		ON DELETE RESTRICT
		ON UPDATE RESTRICT,
	ADD INDEX FK_review_TO_review_attach (
		review_no -- 후기번호
	);

-- 좌석
ALTER TABLE seat
	ADD CONSTRAINT FK_facilities_TO_seat -- FK_facilities_TO_seat
		FOREIGN KEY (
			facilities_no -- 공연시설번호
		)
		REFERENCES facilities ( -- 시설
			facilities_no -- 공연시설번호
		)
		ON DELETE RESTRICT
		ON UPDATE RESTRICT,
	ADD INDEX FK_facilities_TO_seat (
		facilities_no -- 공연시설번호
	);

-- 회원
ALTER TABLE tbl_member
	ADD CONSTRAINT FK_grade_TO_tbl_member -- 등급 -> 회원
		FOREIGN KEY (
			grade_code -- 등급코드
		)
		REFERENCES grade ( -- 등급
			grade_code -- 등급코드
		);

-- 공지사항
ALTER TABLE notice
	ADD CONSTRAINT FK_tbl_member_TO_notice -- 회원 -> 공지사항
		FOREIGN KEY (
			member_code -- 회원코드
		)
		REFERENCES tbl_member ( -- 회원
			member_code -- 회원코드
		);
		
	
-- 공연코드 다음번호 가지고 오는 함수
DROP FUNCTION IF EXISTS nextshowcode;

DELIMITER $$
$$
CREATE FUNCTION nextshowcode()
RETURNS CHAR(6)
begin
	declare return_nextCode char(6);
	
	select concat('P', DATE_FORMAT(now(), "%y"), lpad(right(max(show_code), 3) + 1, 3, '000')) into return_nextCode
	from performance;
	
	return return_nextCode;
	
END$$
DELIMITER ;


-- 고객코드 다음번호 가지고 오는 함수
DROP FUNCTION IF EXISTS nextmemcode;

DELIMITER $$
$$
CREATE FUNCTION nextmemcode()
RETURNS CHAR(6)
begin
	declare return_memCode char(6);
	
	select concat('M', DATE_FORMAT(now(), "%y"), lpad(right(max(member_code), 3) + 1, 3, '000')) into return_memCode
	from customer;
	
	return return_memCode;
	
END$$
DELIMITER ;