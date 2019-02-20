-- 공연
DROP SCHEMA IF EXISTS proj_performance;

-- 공연
CREATE SCHEMA proj_performance;

use proj_performance;

-- 고객
CREATE TABLE customer (
	customer_code CHAR(5)     NOT NULL COMMENT '고객코드', -- 고객코드
	customer_name VARCHAR(20) NOT NULL COMMENT '이름', -- 이름
	id            VARCHAR(30) NOT NULL COMMENT '아이디', -- 아이디
	password      CHAR(41)    NULL     COMMENT '비밀번호', -- 비밀번호
	email         VARCHAR(30) NOT NULL COMMENT '이메일', -- 이메일
	phone         VARCHAR(30) NOT NULL COMMENT '연락처', -- 연락처
	dob           DATE        NOT NULL COMMENT '생년월일', -- 생년월일
	address       TEXT        NOT NULL COMMENT '주소' -- 주소
)
COMMENT '고객';

-- 고객
ALTER TABLE customer
	ADD CONSTRAINT PK_customer -- 고객 기본키
		PRIMARY KEY (
			customer_code -- 고객코드
		);

-- 공연
CREATE TABLE performance (
	show_code      CHAR(6)      NOT NULL COMMENT 'P19(연도)001', -- 공연코드
	show_name      VARCHAR(200) NOT NULL COMMENT '공연제목', -- 공연제목
	show_type      CHAR(1)      NULL     COMMENT '기획공연(A), 대관공연(B), ..', -- 공연종류
	total_time     INT          NULL     COMMENT '공연시간', -- 공연시간
	start_time     TIME         NULL     COMMENT '공연시작시간', -- 공연시작시간
	show_startdate DATE         NOT NULL COMMENT '공연시작일', -- 공연시작일
	show_enddate   DATE         NOT NULL COMMENT '공연종료일', -- 공연종료일
	facilities_no  INT          NULL     COMMENT '공연시설번호', -- 공연시설번호
	show_image_path TEXT         NULL     COMMENT '공연이미지경로' -- 공연이미지경로
)
COMMENT '공연';

-- 공연
ALTER TABLE performance
	ADD CONSTRAINT PK_performance -- 공연 기본키
		PRIMARY KEY (
			show_code -- 공연코드
		);

-- 예매
CREATE TABLE reservation (
	reservation_code  VARCHAR(10) NOT NULL COMMENT '예매번호', -- 예매번호
	customer_code     CHAR(5)     NOT NULL COMMENT '고객코드', -- 고객코드
	show_code         CHAR(6)     NOT NULL COMMENT '공연코드', -- 공연코드
	payment_code      CHAR(5)     NOT NULL COMMENT '결제방식코드', -- 결제방식코드
	discount_code     CHAR(2)     NOT NULL COMMENT '할인분류코드', -- 할인분류코드
	reservation_date  DATE        NOT NULL COMMENT '예매일', -- 예매일
	reservation_time  TIME        NOT NULL COMMENT '예매시간', -- 예매시간
	reservation_state TINYINT     NOT NULL COMMENT '0: 예매완료, 1: 예매중, ..', -- 예매상태
	reservation_floor INT         NOT NULL COMMENT '층', -- 층
	reservation_col   INT         NOT NULL COMMENT '행', -- 행
	reservation_row   CHAR(2)     NOT NULL COMMENT '열' -- 열
)
COMMENT '예매';

-- 예매
ALTER TABLE reservation
	ADD CONSTRAINT PK_reservation -- 예매 기본키
		PRIMARY KEY (
			reservation_code -- 예매번호
		);

-- 할인
CREATE TABLE discount (
	discount_code CHAR(2)     NOT NULL COMMENT '00: 기본할인 + 10%, 10: 특별할인 + 20%', -- 할인분류코드
	discount_rate INT         NOT NULL COMMENT '할인율', -- 할인율
	discount_name VARCHAR(50) NOT NULL COMMENT '할인내용' -- 할인내용
)
COMMENT '할인';

-- 할인
ALTER TABLE discount
	ADD CONSTRAINT PK_discount -- 할인 기본키
		PRIMARY KEY (
			discount_code -- 할인분류코드
		);

-- 결제
CREATE TABLE payment (
	payment_code CHAR(5)     NOT NULL COMMENT '결제방식코드', -- 결제방식코드
	payment_name VARCHAR(20) NOT NULL COMMENT '결제방식' -- 결제방식
)
COMMENT '결제';

-- 결제
ALTER TABLE payment
	ADD CONSTRAINT PK_payment -- 결제 기본키
		PRIMARY KEY (
			payment_code -- 결제방식코드
		);

-- 좌석
CREATE TABLE seat (
	loc_code      CHAR(5) NOT NULL COMMENT 'SEAT1: 비지정석, SEAT2: 지정석, SEAT3: 전석', -- 좌석분류코드
	zone          CHAR(3) NOT NULL COMMENT '1A, 2A', -- 구역
	facilities_no INT     NOT NULL COMMENT '공연시설번호', -- 공연시설번호
	start_loc     INT     NULL     COMMENT '1', -- 시작위치
	end_loc       INT     NULL     COMMENT '20' -- 끝위치
)
COMMENT '좌석';

-- 좌석
ALTER TABLE seat
	ADD CONSTRAINT PK_seat -- 좌석 기본키
		PRIMARY KEY (
			loc_code, -- 좌석분류코드
			zone      -- 구역
		);

-- 관리자
CREATE TABLE manager (
	manager_code CHAR(5)     NOT NULL COMMENT '관리자코드', -- 관리자코드
	manager_name VARCHAR(30) NOT NULL COMMENT '이름' -- 이름
)
COMMENT '관리자';

-- 관리자
ALTER TABLE manager
	ADD CONSTRAINT PK_manager -- 관리자 기본키
		PRIMARY KEY (
			manager_code -- 관리자코드
		);

-- 공연관람후기
CREATE TABLE review (
	review_no        INT     NOT NULL COMMENT '번호', -- 번호
	customer_code    CHAR(5) NOT NULL COMMENT '고객코드', -- 고객코드
	review_img_path  TEXT    NULL     COMMENT '이미지경로', -- 이미지경로
	review_content   TEXT    NOT NULL COMMENT '내용', -- 내용
	review_post_date date    NOT NULL COMMENT '작성일', -- 작성일
	review_view_cnt  INT     NULL     COMMENT '조회수' -- 조회수
)
COMMENT '공연관람후기';

-- 공연관람후기
ALTER TABLE review
	ADD CONSTRAINT PK_review -- 공연관람후기 기본키
		PRIMARY KEY (
			review_no -- 번호
		);

-- 시설
CREATE TABLE facilities (
	facilities_no   INT         NOT NULL COMMENT '1관, 2관, ..', -- 공연시설번호
	total_floor     INT         NOT NULL COMMENT '1층, 2층 = 2', -- 층개수
	zone_cnt        INT         NOT NULL COMMENT 'A, B, C, BR, BL의 개수 = 5', -- 구역개수
	total_seatCnt   INT         NOT NULL COMMENT '1층(140개), 2층(60개) = 200', -- 총좌석수
	facilities_name VARCHAR(50) NOT NULL COMMENT '본관, 별관' -- 공연시설명
)
COMMENT '시설';

-- 시설
ALTER TABLE facilities
	ADD CONSTRAINT PK_facilities -- 시설 기본키
		PRIMARY KEY (
			facilities_no -- 공연시설번호
		);

-- 공지사항
CREATE TABLE notice (
	notice_no       INT     NOT NULL COMMENT '공지사항번호', -- 공지사항번호
	notice_img_path text    NULL     COMMENT '이미지경로', -- 이미지경로
	notice_content  text    NOT NULL COMMENT '내용', -- 내용
	post_startdate  DATE    NOT NULL COMMENT '게시시작일', -- 게시시작일
	post_enddate    DATE    NOT NULL COMMENT '게시종료일', -- 게시종료일
	is_post         BOOLEAN NOT NULL COMMENT '게시여부', -- 게시여부
	is_notice       BOOLEAN NOT NULL COMMENT '알림이벤트구분', -- 알림이벤트구분
	manager_code    CHAR(5) NULL     COMMENT '관리자코드', -- 관리자코드
	notice_view_cnt INT     NULL     DEFAULT 0 COMMENT '조회수' -- 조회수
)
COMMENT '공지사항';

-- 공지사항
ALTER TABLE notice
	ADD CONSTRAINT PK_notice -- 공지사항 기본키
		PRIMARY KEY (
			notice_no -- 공지사항번호
		);

-- 댓글
CREATE TABLE reply (
	reply_no      INT           NOT NULL COMMENT '댓글번호', -- 댓글번호
	review_no     INT           NOT NULL COMMENT '번호', -- 번호
	replyer       VARCHAR(50)   NOT NULL COMMENT '작성자', -- 작성자
	reply_content VARCHAR(1000) NOT NULL COMMENT '내용', -- 내용
	regdate       TIMESTAMP     NOT NULL DEFAULT now() COMMENT '입력날짜', -- 입력날짜
	updatedate    TIMESTAMP     NOT NULL DEFAULT now() COMMENT '수정날짜' -- 수정날짜
)
COMMENT '댓글';

-- 댓글
ALTER TABLE reply
	ADD CONSTRAINT PK_reply -- 댓글 기본키
		PRIMARY KEY (
			reply_no -- 댓글번호
		);

-- 공연
ALTER TABLE performance
	ADD CONSTRAINT FK_facilities_TO_performance -- 시설 -> 공연
		FOREIGN KEY (
			facilities_no -- 공연시설번호
		)
		REFERENCES facilities ( -- 시설
			facilities_no -- 공연시설번호
		);

-- 예매
ALTER TABLE reservation
	ADD CONSTRAINT FK_customer_TO_reservation -- 고객 -> 예매
		FOREIGN KEY (
			customer_code -- 고객코드
		)
		REFERENCES customer ( -- 고객
			customer_code -- 고객코드
		);

-- 예매
ALTER TABLE reservation
	ADD CONSTRAINT FK_performance_TO_reservation -- 공연 -> 예매
		FOREIGN KEY (
			show_code -- 공연코드
		)
		REFERENCES performance ( -- 공연
			show_code -- 공연코드
		);

-- 예매
ALTER TABLE reservation
	ADD CONSTRAINT FK_payment_TO_reservation -- 결제 -> 예매
		FOREIGN KEY (
			payment_code -- 결제방식코드
		)
		REFERENCES payment ( -- 결제
			payment_code -- 결제방식코드
		);

-- 예매
ALTER TABLE reservation
	ADD CONSTRAINT FK_discount_TO_reservation -- 할인 -> 예매
		FOREIGN KEY (
			discount_code -- 할인분류코드
		)
		REFERENCES discount ( -- 할인
			discount_code -- 할인분류코드
		);

-- 좌석
ALTER TABLE seat
	ADD CONSTRAINT FK_facilities_TO_seat -- 시설 -> 좌석
		FOREIGN KEY (
			facilities_no -- 공연시설번호
		)
		REFERENCES facilities ( -- 시설
			facilities_no -- 공연시설번호
		);

-- 공연관람후기
ALTER TABLE review
	ADD CONSTRAINT FK_customer_TO_review -- 고객 -> 공연관람후기
		FOREIGN KEY (
			customer_code -- 고객코드
		)
		REFERENCES customer ( -- 고객
			customer_code -- 고객코드
		);

-- 공지사항
ALTER TABLE notice
	ADD CONSTRAINT FK_manager_TO_notice -- 관리자 -> 공지사항
		FOREIGN KEY (
			manager_code -- 관리자코드
		)
		REFERENCES manager ( -- 관리자
			manager_code -- 관리자코드
		);

-- 댓글
ALTER TABLE reply
	ADD CONSTRAINT FK_review_TO_reply -- 공연관람후기 -> 댓글
		FOREIGN KEY (
			review_no -- 번호
		)
		REFERENCES review ( -- 공연관람후기
			review_no -- 번호
		);
		

-- 공연코드 다음번호 가지고 오는 함수
DROP FUNCTION IF EXISTS proj_performance.nextshowcode;

DELIMITER $$
$$
CREATE FUNCTION proj_performance.nextshowcode()
RETURNS CHAR(6)
begin
	declare return_nextCode char(6);
	
	select concat('P', DATE_FORMAT(now(), "%y"), lpad(right(max(show_code), 3) + 1, 3, '000')) into return_nextCode
	from performance;
	
	return return_nextCode;
	
END$$
DELIMITER ;
