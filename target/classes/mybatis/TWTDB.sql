--?드롭문
--?DROP?TABLE


DROP TABLE "TWTMEMBER" CASCADE CONSTRAINTS;
DROP TABLE "HOTEL" CASCADE CONSTRAINTS;
DROP TABLE "CITY" CASCADE CONSTRAINTS;
DROP TABLE "SCHEDULEREVIEW";
DROP TABLE "TRAVELPOINT" CASCADE CONSTRAINTS;
DROP TABLE "TRAVELSCHEDULE" CASCADE CONSTRAINTS;
DROP TABLE "TRAVELSCHEDULE_DAY" CASCADE CONSTRAINTS;
DROP TABLE "SCHEDULE_ANS";
DROP TABLE "PAYMENT_INFO";
DROP TABLE "HBOOKING";
DROP TABLE "HOTELREVIEW";
DROP TABLE "HOTELROOM";
DROP TABLE "REVIEW_ANS";
DROP TABLE "AIRPLANEINFO";
DROP TABLE "CHAT_USER";
DROP TABLE "CHAT";
DROP TABLE "FAVORITE_LIST";


--?임시?시퀀스
CREATE SEQUENCE CT_SEQ;
--?도시

--?시퀀스?DROP
DROP SEQUENCE SR_SEQ; --?일정리뷰
DROP SEQUENCE AS_SEQ; --?일정리뷰?댓글
DROP SEQUENCE SB_SEQ; --?일정공유
DROP SEQUENCE TP_SEQ; --?여행지
DROP SEQUENCE TS_SEQ; --?여행일정
DROP SEQUENCE DAY_SEQ; --?DAY별
DROP SEQUENCE HR_SEQ; --?방번호
DROP SEQUENCE H_SEQ; --?호텔번호
DROP SEQUENCE HRV_SEQ; --?호텔리뷰
DROP SEQUENCE HB_SEQ; --?예약번호
DROP SEQUENCE M_SEQ; --?회원번호
DROP SEQUENCE CH_SEQ;
--?채팅방?번호

SELECT * FROM HOTEL;


--?임시?시퀀스
DROP SEQUENCE CT_SEQ;
--?도시

------------------------------------------------------------------------------------

CREATE SEQUENCE SR_SEQ; --?일정리뷰 EX)SR1
CREATE SEQUENCE AS_SEQ; --?일정리뷰?댓글 EX)SRA1
CREATE SEQUENCE SB_SEQ; --?일정공유 EX)SB1
CREATE SEQUENCE TP_SEQ; --?여행지 TP1
CREATE SEQUENCE TS_SEQ; --?여행일정 TS1
CREATE SEQUENCE DAY_SEQ; --?DAY별 DAY1
CREATE SEQUENCE HR_SEQ; --?방번호 HRSEQ1
CREATE SEQUENCE H_SEQ; --?호텔번호 H1
CREATE SEQUENCE HRV_SEQ; --?호텔리뷰 HRV1
CREATE SEQUENCE HB_SEQ; --?예약번호 HB1
CREATE SEQUENCE M_SEQ; --?회원번호 M1
CREATE SEQUENCE CH_SEQ;
--?채팅방?번호 CH1


------------------------------------------------------------------------------------
--?테이블?생성
CREATE TABLE "TWTMEMBER" -- 회원관리
(
    "M_CODE"  VARCHAR2(1000) NOT NULL,
    "M_ID"    VARCHAR2(100)  NOT NULL,
    "M_PASS"  VARCHAR2(1000) NOT NULL,
    "M_NAME"  VARCHAR2(500)  NOT NULL,
    "M_EMAIL" VARCHAR2(500)  NOT NULL,
    "M_API"   VARCHAR2(500),
    "M_MAILCHECK" VARCHAR2(500)  NOT NULL
);

SELECT * FROM TWTMEMBER;

CREATE TABLE "SCHEDULEREVIEW" -- 일정리뷰
(
    "SR_CODE"    VARCHAR2(100),
    "M_CODE"     VARCHAR2(100),
    "TS_CODE"    VARCHAR2(100),
    "SR_TITLE"   VARCHAR2(500),
    "SR_CONTENT" VARCHAR2(4000),
    "SR_IMGSRC"  VARCHAR2(4000),
    "SR_VIEW"    NUMBER,
    "SR_DATE" DATE NOT NULL
);

DELETE FROM SCHEDULEREVIEW;
SELECT * FROM SCHEDULEREVIEW;

CREATE TABLE "TRAVELPOINT" -- 여행지
(
    "TP_CODE"    VARCHAR2(100)  NOT NULL,
    "CITY_CODE"  VARCHAR2(100)  NOT NULL,
    "TP_NAME"    VARCHAR2(100)  NOT NULL,
    "TP_LATI"    NUMBER         NOT NULL,
    "TP_LONG"    NUMBER         NOT NULL,
    "TP_TYPE"    VARCHAR2(100)  NOT NULL,
    "TP_CONTENT" VARCHAR2(2000) NULL,
    "TP_IMG"     VARCHAR2(1000) NOT NULL,
    "TP_ADDR"    VARCHAR2(1000) NOT NULL
);

CREATE TABLE "TRAVELSCHEDULE" -- 여행 일정
(
    "TS_CODE"   VARCHAR2(100)  NOT NULL,
    "M_CODE"    VARCHAR2(1000) NOT NULL,
    "TP_CODE"   VARCHAR2(100)  NOT NULL,
    "TS_TITLE"  VARCHAR2(500)  NOT NULL,
    "TS_SDAY"   DATE           NOT NULL,
    "TS_THEME"  VARCHAR2(50)   NULL,
    "TS_PEOPLE" VARCHAR2(50)   NULL,
    "TS_THUM"   VARCHAR2(1000) NULL,
    "TS_PERIOD" NUMBER         NULL,
    "TS_DATE"	DATE		   NOT NULL,
    "TS_VIEW"	NUMBER
);

CREATE TABLE "CITY" -- 도시
(
    "CITY_CODE" VARCHAR2(100)  NOT NULL,
    "CITY_NAME" VARCHAR2(500)  NOT NULL,
    "CITY_LATI" NUMBER         NOT NULL,
    "CITY_LONG" NUMBER         NOT NULL,
    "CITY_IMG"  VARCHAR2(1000) NULL,
    "CITY_ENG" VARCHAR2(100) NULL
);

CREATE TABLE "TRAVELSCHEDULE_DAY" -- 여행일정 별 DAY
(
    "TS_DAY"   VARCHAR2(100)  NOT NULL,
    "TS_CODE"  VARCHAR2(100)  NOT NULL,
    "TP_CODE"  VARCHAR2(100)  NOT NULL,
    "TS_MEMO"  VARCHAR2(1000) NULL,
    "TS_MONEY" NUMBER         NULL
);

CREATE TABLE "COMMUNITY_ANS" -- 커뮤니티 댓글
(
    "ANS_CODE"    VARCHAR2(100) NOT NULL,
    "M_CODE"      VARCHAR2(100) NOT NULL,
    "BOARD_CODE"     VARCHAR2(100) NOT NULL,
    "REPLE_CODE"	VARCHAR2(100) NOT NULL,
    "ANS_CONTENT" VARCHAR2(100) NULL,
    "ANS_DATE"    DATE          NOT NULL
);

SELECT * FROM COMMUNITY_ANS;
DELETE FROM COMMUNITY_ANS;

CREATE TABLE "HOTEL" -- 숙소
(
    "H_CODE"         VARCHAR2(100)  NOT NULL,
    "CITY_CODE"      VARCHAR2(100)  NOT NULL,
    "H_NAME"         VARCHAR2(1000) NOT NULL,
    "H_LATI"         NUMBER         NOT NULL,
    "H_LONG"         NUMBER         NOT NULL,
    "H_PHONE"        VARCHAR2(500)  NOT NULL,
    "H_BASICADDR"    VARCHAR2(1000) NULL,
    "H_ADDR"         VARCHAR2(1000) NOT NULL,
    "H_IMG"          VARCHAR2(1000) NULL,
    "H_CONTENT"      VARCHAR2(2000) NOT NULL,
    "H_STARN"        NUMBER         NOT NULL,
    "H_BASICCONTENT" VARCHAR2(1000) NOT NULL
);

CREATE TABLE "HBOOKING" -- 숙소예약
(
    "HB_CODE"   VARCHAR2(100)  NOT NULL,
    "M_CODE"    VARCHAR2(1000) NOT NULL,
    "HR_CODE"   VARCHAR2(100)  NOT NULL,
    "H_CODE"    VARCHAR2(100)  NOT NULL,
    "HB_SDATE"  DATE           NOT NULL,
    "HB_EDATE"  DATE           NOT NULL,
    "HB_CHECK"  VARCHAR2(50)   NOT NULL,
    "HB_PEOPLE" NUMBER         NOT NULL,
    "HB_NAME"   VARCHAR2(50)   NOT NULL,
    "HB_DATE" DATE NOT NULL
);

CREATE TABLE "PAYMENT_INFO" -- 결제정보 (임시테이블)
(
    "M_CODE" VARCHAR(255) NOT NULL
);

CREATE TABLE "HOTELREVIEW" -- 호텔리뷰
(
    "HRV_CODE"    VARCHAR2(100) NOT NULL,
    "HR_CODE"     VARCHAR2(100) NOT NULL,
    "HB_CODE"     VARCHAR2(100) NOT NULL,
    "M_CODE"      VARCHAR2(100) NOT NULL,
    "HRV_CONTENT" VARCHAR2(100) NOT NULL,
    "HRV_DATE"    DATE          NOT NULL,
    "HRV_STARN"   NUMBER        NOT NULL,
    "HRV_VIEW" NUMBER NULL
);

CREATE TABLE "FAVORITE_LIST" -- 찜목록
(
    "FL_CODE"  VARCHAR2(100) NOT NULL,
    "M_CODE"   VARCHAR2(100) NOT NULL,
    "FL_CHECK" VARCHAR2(50)  NULL
);

CREATE TABLE "AIRPLANEINFO" -- 항공정보
(
    "M_CODE"    VARCHAR2(50)  NOT NULL,
    "DEP_LOCA1" VARCHAR2(100) NOT NULL,
    "DEP_LOCA2" VARCHAR2(100) NOT NULL,
    "DEP_DATE1" DATE          NOT NULL,
    "DEP_DATE2" DATE          NOT NULL,
    "DEP_TIME1" VARCHAR2(100) NULL,
    "DEP_TIME2" VARCHAR2(100) NULL,
    "RE_LOCA1"  VARCHAR2(100) NOT NULL,
    "RE_LOCA2"  VARCHAR2(100) NOT NULL,
    "RE_DATE1"  DATE          NOT NULL,
    "RE_DATE2"  DATE          NOT NULL,
    "RE_TIME1"  VARCHAR2(100) NULL,
    "RE_TIME2"  VARCHAR2(100) NULL,
    "AIR_CODE"  VARCHAR2(100) NOT NULL
);

CREATE TABLE "HOTELROOM" -- 호텔방 정보
(
    "HR_CODE"      VARCHAR2(100)  NOT NULL,
    "H_CODE"       VARCHAR2(10)   NOT NULL,
    "HR_STANDARD"  NUMBER         NOT NULL,
    "HR_MAX"       NUMBER         NOT NULL,
    "HR_PRICE"     NUMBER         NOT NULL,
    "HR_VALID"     NUMBER         NOT NULL,
    "HR_RANK"      VARCHAR2(500)  NOT NULL,
    "HR_IMG"       VARCHAR2(1000) NOT NULL,
    "HR_WIFI"      VARCHAR2(10)   NULL,
    "HR_SMOKING"   VARCHAR2(10)   NULL,
    "HR_BREAKFAST" VARCHAR2(10)   NULL,
    "HR_BED"       NUMBER         NULL,
    "HR_DATE"      DATE           NOT NULL
);

CREATE TABLE "CHAT" -- 채팅
(
    "CH_CODE"   VARCHAR2(100) NOT NULL,
    "CITY_CODE" VARCHAR2(100) NOT NULL,
    "CH_TITLE"  VARCHAR2(100) NOT NULL
);

CREATE TABLE "CHAT_USER" -- 채팅방 유저
(
    "M_CODE"     VARCHAR2(1000) NOT NULL,
    "CH_CODE"    VARCHAR2(100)  NOT NULL,
    "CH_MESSAGE" VARCHAR2(500)  NULL,
    "CH_TIME"    DATE           NOT NULL

);

-----------------------------------------------------------------------------------------------------------------------
-- 제약조건 추가

ALTER TABLE "SCHEDULEREVIEW"
    ADD CONSTRAINT "PK_SCHEDULEREVIEW" PRIMARY KEY (
                                                    "SR_CODE"
        );
ALTER TABLE "TRAVELPOINT"
    ADD CONSTRAINT "PK_TRAVELPOINT" PRIMARY KEY (
                                                 "TP_CODE"
        );
ALTER TABLE "TRAVELSCHEDULE"
    ADD CONSTRAINT "PK_TRAVELSCHEDULE" PRIMARY KEY (
                                                    "TS_CODE"
        );
ALTER TABLE "CITY"
    ADD CONSTRAINT "PK_CITY" PRIMARY KEY (
                                          "CITY_CODE"
        );
ALTER TABLE "TRAVELSCHEDULE_DAY"
    ADD CONSTRAINT "PK_TRAVELSCHEDULE_DAY" PRIMARY KEY (
                                                        "TS_DAY"
        );
ALTER TABLE "TWTMEMBER"
    ADD CONSTRAINT "PK_TWTMEMBER" PRIMARY KEY (
                                               "M_CODE"
        );
ALTER TABLE "SCHEDULE_ANS"
    ADD CONSTRAINT "PK_SCHEDULE_ANS" PRIMARY KEY (
                                                  "SBA_CODE"
        );
ALTER TABLE "REVIEW_ANS"
    ADD CONSTRAINT "PK_REVIEW_ANS" PRIMARY KEY (
                                                "SRA_CODE"
        );
ALTER TABLE "HOTEL"
    ADD CONSTRAINT "PK_HOTEL" PRIMARY KEY (
                                           "H_CODE"
        );
ALTER TABLE "HBOOKING"
    ADD CONSTRAINT "PK_HBOOKING" PRIMARY KEY (
                                              "HB_CODE"
        );
ALTER TABLE "PAYMENT_INFO"
    ADD CONSTRAINT "PK_PAYMENT_INFO" PRIMARY KEY (
                                                  "M_CODE"
        );
ALTER TABLE "HOTELREVIEW"
    ADD CONSTRAINT "PK_HOTELREVIEW" PRIMARY KEY (
                                                 "HRV_CODE"
        );
ALTER TABLE "AIRPLANEINFO"
    ADD CONSTRAINT "PK_AIRPLANEINFO" PRIMARY KEY (
                                                  "M_CODE"
        );
ALTER TABLE "HOTELROOM"
    ADD CONSTRAINT "PK_HOTELROOM" PRIMARY KEY (
                                               "HR_CODE"
        );
ALTER TABLE "CHAT"
    ADD CONSTRAINT "PK_CHAT" PRIMARY KEY (
                                          "CH_CODE"
        );
ALTER TABLE "CHAT_USER"
    ADD CONSTRAINT "PK_CHAT_USER" PRIMARY KEY (
                                               "M_CODE",
                                               "CH_CODE"
        );
ALTER TABLE "SCHEDULEREVIEW"
    ADD CONSTRAINT "FK_MEMBER_TO_SCHEDULERE" FOREIGN KEY (
                                                          "M_CODE"
        )
        REFERENCES "TWTMEMBER" (
                                "M_CODE"
            );

ALTER TABLE "TRAVELPOINT"
    ADD CONSTRAINT "FK_CITY_TO_TRAVELPOINT_1" FOREIGN KEY (
                                                           "CITY_CODE"
        )
        REFERENCES "CITY" (
                           "CITY_CODE"
            );
ALTER TABLE "TRAVELSCHEDULE"
    ADD CONSTRAINT "FK_TWTMEMBER_TO_SCHEDULE_1" FOREIGN KEY (
                                                             "M_CODE"
        )
        REFERENCES "TWTMEMBER" (
                                "M_CODE"
            );


ALTER TABLE "SCHEDULE_ANS"
    ADD CONSTRAINT "FK_TWTMEMBER_TO_SCHEDULE_ANS_1" FOREIGN KEY (
                                                                 "M_CODE"
        )
        REFERENCES "TWTMEMBER" (
                                "M_CODE"
            );
ALTER TABLE "REVIEW_ANS"
    ADD CONSTRAINT "REVIEW_ANS_FK1" FOREIGN KEY ("TS_CODE")
        REFERENCES  "TRAVELSCHEDULE" ("TS_CODE") ;

ALTER TABLE "REVIEW_ANS"
    ADD CONSTRAINT "FK_TWTMEMBER_TO_REVIEW_ANS_1" FOREIGN KEY (
                                                               "M_CODE"
        )
        REFERENCES "TWTMEMBER" (
                                "M_CODE"
            );
ALTER TABLE "HOTEL"
    ADD CONSTRAINT "FK_CITY_TO_HOTEL_1" FOREIGN KEY (
                                                     "CITY_CODE"
        )
        REFERENCES "CITY" (
                           "CITY_CODE"
            );
ALTER TABLE "HBOOKING"
    ADD CONSTRAINT "FK_TWTMEMBER_TO_HBOOKING_1" FOREIGN KEY (
                                                             "M_CODE"
        )
        REFERENCES "TWTMEMBER" (
                                "M_CODE"
            );
ALTER TABLE "HBOOKING"
    ADD CONSTRAINT "FK_HOTELROOM_TO_BOOKING_1" FOREIGN KEY (
                                                            "HR_CODE"
        )
        REFERENCES "HOTELROOM" (
                                "HR_CODE"
            );
ALTER TABLE "HBOOKING"
    ADD CONSTRAINT "FK_HOTEL_TO_BOOKING_1" FOREIGN KEY (
                                                        "H_CODE"
        )
        REFERENCES "HOTEL" (
                            "H_CODE"
            );
ALTER TABLE "PAYMENT_INFO"
    ADD CONSTRAINT "FK_TWTMEMBER_TO_PAYMENT_INFO_1" FOREIGN KEY (
                                                                 "M_CODE"
        )
        REFERENCES "TWTMEMBER" (
                                "M_CODE"
            );
ALTER TABLE "HOTELREVIEW"
    ADD CONSTRAINT "FK_HOTELROOM_TO_HOTELREVIEW_1" FOREIGN KEY (
                                                                "HR_CODE"
        )
        REFERENCES "HOTELROOM" (
                                "HR_CODE"
            );

ALTER TABLE "FAVORITE_LIST"
    ADD CONSTRAINT "FK_TWTMEMBER_TO_FAVORITELIST" FOREIGN KEY (
                                                               "M_CODE"
        )
        REFERENCES "TWTMEMBER" (
                                "M_CODE"
            );
ALTER TABLE "AIRPLANEINFO"
    ADD CONSTRAINT "FK_TWTMEMBER_TO_AIRPLANEINFO_1" FOREIGN KEY (
                                                                 "M_CODE"
        )
        REFERENCES "TWTMEMBER" (
                                "M_CODE"
            );
ALTER TABLE "HOTELROOM"
    ADD CONSTRAINT "FK_HOTEL_TO_HOTELROOM_1" FOREIGN KEY (
                                                          "H_CODE"
        )
        REFERENCES "HOTEL" (
                            "H_CODE"
            );
ALTER TABLE "CHAT"
    ADD CONSTRAINT "FK_CITY_TO_CHAT_1" FOREIGN KEY (
                                                    "CITY_CODE"
        )
        REFERENCES "CITY" (
                           "CITY_CODE"
            );
ALTER TABLE "CHAT_USER"
    ADD CONSTRAINT "FK_TWTMEMBER_TO_CHAT_USER_1" FOREIGN KEY (
                                                              "M_CODE"
        )
        REFERENCES "TWTMEMBER" (
                                "M_CODE"
            );
ALTER TABLE "CHAT_USER"
    ADD CONSTRAINT "FK_CHAT_TO_CHAT_USER_1" FOREIGN KEY (
                                                         "CH_CODE"
        )
        REFERENCES "CHAT" (
                           "CH_CODE"
            );

ALTER TABLE "SCHEDULE_ANS"
    ADD CONSTRAINT "FK_travelSchedule_TO_Ans_1" FOREIGN KEY (
                                                             "TS_CODE"
        ) REFERENCES "TRAVELSCHEDULE" (
                                       "TS_CODE"
        );

--  'm' || m_seq.nextval
-- 멤버 샘플
INSERT INTO "TWTMEMBER" (M_CODE, M_ID, M_PASS, M_NAME, M_EMAIL, M_API, M_MAILCHECK)
VALUES ('M1', 'test01', 'a1234', '테스트', 'test@test.com', 'a123456789', 'Y');
INSERT INTO "TWTMEMBER" 
VALUES ('M2', 'test02', 'a1234', '테스트02', 'test2@test.com', NULL, 'Y');
INSERT INTO "TWTMEMBER" (M_CODE, M_ID, M_PASS, M_NAME, M_EMAIL, M_API, M_MAILCHECK)
VALUES ('M3', 'test03', 'a1234', '테스트03', 'test3@test.com', 'a123456789', 'Y');

SELECT * FROM TWTMEMBER;

-- 도시 샘플
INSERT INTO "CITY" (CITY_CODE, CITY_NAME, CITY_LATI, CITY_LONG, CITY_IMG, CITY_ENG)
VALUES ('CT1', '방콕', '1234', '1234', 'BANGCOK.JPG', 'Bangkok');

-- 호텔 샘플

INSERT INTO "HOTEL" (H_CODE, CITY_CODE, H_NAME, H_LATI, H_LONG, H_PHONE, H_BASICADDR, H_ADDR, H_IMG, H_CONTENT, H_STARN, H_BASICCONTENT)
VALUES ('H1', 'CT1', '테스트호텔', '1234', '1234', '1234-1234', '간략주소', '긴주소', 'HOTELIMG.JPG', '호텔설명', '5', '간략호텔설명');
INSERT INTO "HOTEL" (H_CODE, CITY_CODE, H_NAME, H_LATI, H_LONG, H_PHONE, H_BASICADDR, H_ADDR, H_IMG, H_CONTENT, H_STARN,
                     H_BASICCONTENT)
VALUES ('H2', 'CT1', '테스트호텔', '1234', '1234', '1234-1234', '간략주소', '긴주소', 'HOTELIMG.JPG', '호텔설명', '5', '간략호텔설명');

-- 호텔방 샘플
INSERT INTO  "HOTELROOM" (HR_CODE, H_CODE, HR_STANDARD, HR_MAX, HR_PRICE, HR_VALID, HR_RANK, HR_IMG, HR_WIFI, HR_SMOKING, HR_BREAKFAST, HR_BED, HR_DATE)
VALUES ('HR1', 'H1', '2', '4', '30000', '10', 'SWEET', 'HRIMG', 'Y', 'Y', 'Y', '3', TO_DATE('2020-02-12 14:19:26', 'YYYY-MM-DD HH24:MI:SS'));

-- 호텔예약 샘플
INSERT INTO "HBOOKING" (HB_CODE, M_CODE, HR_CODE, H_CODE, HB_SDATE, HB_EDATE, HB_CHECK, HB_PEOPLE, HB_NAME, HB_DATE)
VALUES ('HB1', 'M1', 'HR1', 'H1', TO_DATE('2020-02-12 14:16:23', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-02-13 14:16:25', 'YYYY-MM-DD HH24:MI:SS'), 'Y', '3', '짱구', TO_DATE('2020-02-12 14:16:33', 'YYYY-MM-DD HH24:MI:SS'));

-- 호텔리뷰 샘플
INSERT INTO "HOTELREVIEW" (HRV_CODE, HR_CODE, HB_CODE, M_CODE, HRV_CONTENT, HRV_DATE, HRV_STARN, HRV_VIEW)
VALUES ('HRV1', 'HR1', 'HB1', 'M1', '호텔리뷰내용', SYSDATE, 5, 1);

-- 여행지 정보 샘플
INSERT INTO "TRAVELPOINT" (TP_CODE, CITY_CODE, TP_NAME, TP_LATI, TP_LONG, TP_TYPE, TP_CONTENT, TP_IMG, TP_ADDR) VALUES ('TP1', 'CT1', '방콕여행지1', '1234', '1234', '관광지', '여행지설명', 'TPIMG.JPG', '여행지 주소');

-- 여행일정 샘플
INSERT INTO "TRAVELSCHEDULE" (TS_CODE, M_CODE, TP_CODE, TS_TITLE, TS_SDAY, TS_THEME, TS_PEOPLE, TS_THUM, TS_PERIOD, TS_DATE, TS_VIEW) VALUES ('TS100', 'M1', 'TP1', '테스트일정1', TO_DATE('2020-02-18'), '여행테마', '1', 'THUM.JPG', 3, SYSDATE, '0');
INSERT INTO "TRAVELSCHEDULE" (TS_CODE, M_CODE, TP_CODE, TS_TITLE, TS_SDAY, TS_THEME, TS_PEOPLE, TS_THUM, TS_PERIOD, TS_DATE) VALUES ('TS3', 'M1', 'TP1', '테스트일정3', TO_DATE('2020-02-18', 'YYYY-MM-DD'), '여행테마', '1', 'THUM.JPG', 3, SYSDATE);
INSERT INTO "TRAVELSCHEDULE" (TS_CODE, M_CODE, TP_CODE, TS_TITLE, TS_SDAY, TS_THEME, TS_PEOPLE, TS_THUM, TS_PERIOD, TS_DATE) VALUES ('TS4', 'M1', 'TP1', '테스트일정4', TO_DATE('2020-02-18', 'YYYY-MM-DD'), '여행테마', '1', 'THUM.JPG', 3, SYSDATE);
INSERT INTO "TRAVELSCHEDULE" (TS_CODE, M_CODE, TP_CODE, TS_TITLE, TS_SDAY, TS_THEME, TS_PEOPLE, TS_THUM, TS_PERIOD, TS_DATE) VALUES ('TS5', 'M1', 'TP1', '테스트일정5', TO_DATE('2020-02-18', 'YYYY-MM-DD'), '여행테마', '1', 'THUM.JPG', 3, SYSDATE);
INSERT INTO "TRAVELSCHEDULE" (TS_CODE, M_CODE, TP_CODE, TS_TITLE, TS_SDAY, TS_THEME, TS_PEOPLE, TS_THUM, TS_PERIOD, TS_DATE) VALUES ('TS6', 'M1', 'TP1', '테스트일정6', TO_DATE('2020-02-18', 'YYYY-MM-DD'), '여행테마', '1', 'THUM.JPG', 3, SYSDATE);
INSERT INTO "TRAVELSCHEDULE" (TS_CODE, M_CODE, TP_CODE, TS_TITLE, TS_SDAY, TS_THEME, TS_PEOPLE, TS_THUM, TS_PERIOD, TS_DATE) VALUES ('TS7', 'M1', 'TP1', '테스트일정7', TO_DATE('2020-02-18', 'YYYY-MM-DD'), '여행테마', '1', 'THUM.JPG', 3, SYSDATE);
INSERT INTO "TRAVELSCHEDULE" (TS_CODE, M_CODE, TP_CODE, TS_TITLE, TS_SDAY, TS_THEME, TS_PEOPLE, TS_THUM, TS_PERIOD, TS_DATE) VALUES ('TS8', 'M1', 'TP1', '테스트일정8', TO_DATE('2020-02-18', 'YYYY-MM-DD'), '여행테마', '1', 'THUM.JPG', 3, SYSDATE);
INSERT INTO "TRAVELSCHEDULE" (TS_CODE, M_CODE, TP_CODE, TS_TITLE, TS_SDAY, TS_THEME, TS_PEOPLE, TS_THUM, TS_PERIOD, TS_DATE) VALUES ('TS9', 'M1', 'TP1', '테스트일정9', TO_DATE('2020-02-18', 'YYYY-MM-DD'), '여행테마', '1', 'THUM.JPG', 3, SYSDATE);
INSERT INTO "TRAVELSCHEDULE" (TS_CODE, M_CODE, TP_CODE, TS_TITLE, TS_SDAY, TS_THEME, TS_PEOPLE, TS_THUM, TS_PERIOD, TS_DATE) VALUES ('TS10', 'M1', 'TP1', '테스트일정10', TO_DATE('2020-02-18', 'YYYY-MM-DD'), '여행테마', '1', 'THUM.JPG', 3, SYSDATE);
INSERT INTO "TRAVELSCHEDULE" (TS_CODE, M_CODE, TP_CODE, TS_TITLE, TS_SDAY, TS_THEME, TS_PEOPLE, TS_THUM, TS_PERIOD, TS_DATE) VALUES ('TS11', 'M1', 'TP1', '테스트일정11', TO_DATE('2020-02-18', 'YYYY-MM-DD'), '여행테마', '1', 'THUM.JPG', 3, SYSDATE);
INSERT INTO "TRAVELSCHEDULE" (TS_CODE, M_CODE, TP_CODE, TS_TITLE, TS_SDAY, TS_THEME, TS_PEOPLE, TS_THUM, TS_PERIOD, TS_DATE) VALUES ('TS12', 'M1', 'TP1', '테스트일정12', TO_DATE('2020-02-18', 'YYYY-MM-DD'), '여행테마', '1', 'THUM.JPG', 3, SYSDATE);
INSERT INTO "TRAVELSCHEDULE" (TS_CODE, M_CODE, TP_CODE, TS_TITLE, TS_SDAY, TS_THEME, TS_PEOPLE, TS_THUM, TS_PERIOD, TS_DATE) VALUES ('TS13', 'M1', 'TP1', '테스트일정13', TO_DATE('2020-02-18', 'YYYY-MM-DD'), '여행테마', '1', 'THUM.JPG', 3, SYSDATE);

SELECT * FROM TRAVELSCHEDULE;

--여행일정  DAY
INSERT INTO "TRAVELSCHEDULE_DAY" (TS_DAY, TS_CODE, TP_CODE, TS_MEMO, TS_MONEY) VALUES ('DAY1', 'TS1', 'TP1', '여행메모', 30000);

-- 여행일정 댓글
INSERT INTO "REVIEW_ANS" (SRA_CODE, TS_CODE, M_CODE, SRA_CONTENT, SRA_DATE) VALUES ('SRA1', 'TS1', 'M1', '여행일정 댓글', TO_DATE('2020-02-12 13:42:57', 'YYYY-MM-DD HH24:MI:SS'));

-- 여행리뷰
INSERT INTO "SCHEDULEREVIEW" (SR_CODE, M_CODE, TS_CODE, SR_TITLE, SR_CONTENT, SR_FILE, SR_VIEW, SR_DATE) VALUES ('SR1', 'M1', 'TS1', '일정리뷰제목', '일정리뷰내용', 'FILE', '0', TO_DATE('2020-02-12 13:50:34', 'YYYY-MM-DD HH24:MI:SS'));

COMMIT


INSERT INTO  "TRAVELPOINT" (TP_CODE, CITY_CODE, TP_NAME, TP_LATI, TP_LONG, TP_TYPE, TP_CONTENT, TP_IMG, TP_ADDR) VALUES ('TP1', 'CT1', '카오산로드', '1', '1', '랜드마크', ' 동남아시아 배낭여행자들의 시작점이다. 규모가 크지는 않지만 여행하면서 꼭 필요한 숙소와 식사를 저렴한 가격에 해결할 수 있다. 많은 여행자들이 모이는만큼 다양한 국적의 친구들과 쉽게 어울릴 수 있다.', 'BK_01.jpg', 'Khao San Road, Talat Yot, Phra Nakhon, Bangkok 10200, Thailand');
INSERT INTO  "TRAVELPOINT" (TP_CODE, CITY_CODE, TP_NAME, TP_LATI, TP_LONG, TP_TYPE, TP_CONTENT, TP_IMG, TP_ADDR) VALUES ('TP2', 'CT1', '왕궁', '1', '1', '랜드마크', '방콕 여행자들이 1순위로 꼽는 관광지이다. 태국의 역대 국왕들의 대관식이 진했되었던 곳으로 왕궁 내부는 금, 보석 등으로 화려하고 웅장하게 꾸며져있다. 태국민들에게 신성하게 여겨지는 왕실의 공간으로 입장할 때는 복장에 유의하여야 한다.', 'BK_02.jpg', 'Sanam Chai Road, Phra Borom Maha Ratchawang, Phra Nakhon, Bangkok 10200, Thailand');
INSERT INTO  "TRAVELPOINT" (TP_CODE, CITY_CODE, TP_NAME, TP_LATI, TP_LONG, TP_TYPE, TP_CONTENT, TP_IMG, TP_ADDR) VALUES ('TP3', 'CT1', '왓 포', '1', '1', '절/신사/사원', '아유타야 양식으로 지어진 사원으로 방콕에서 가장 큰 규모를 자랑한다. 부처가 열반에 오르는 모습을 표현해낸 길이 46m의 거대한 와불상이 이곳에 모셔져있어 많은 불교신자들이 찾는다. 사원 곳곳에는 수많은 프랑(prang)이 조각 예술처럼 전시되어있다.', 'BK_03.jpg', 'Chetuphon, Phra Borom Maha Ratchawang, Phra Nakhon, Bangkok 10200, Thailand');
INSERT INTO  "TRAVELPOINT" (TP_CODE, CITY_CODE, TP_NAME, TP_LATI, TP_LONG, TP_TYPE, TP_CONTENT, TP_IMG, TP_ADDR) VALUES ('TP4', 'CT1', '아난다사마콤 궁전', '1', '1', '랜드마크', '이탈리아의 신고전주의 건축 양식으로 지어진 궁전으로 돔 지붕과 하얀 대리석이 특징이다. 라마 7세 때까지는 왕실의 행사를 주최했던 곳이나 지금은 왕실에서 사용하던 물품을 전시한 박물관으로 사용된다. 화려한 장식이 압도적인 건물 내부는 사진 촬영을 할 수 없다.', 'BK_04.jpg', 'Uthong Nai Alley, Dusit, Bangkok 10300, Thailand');
INSERT INTO  "TRAVELPOINT" (TP_CODE, CITY_CODE, TP_NAME, TP_LATI, TP_LONG, TP_TYPE, TP_CONTENT, TP_IMG, TP_ADDR) VALUES ('TP5', 'CT1', '위만멕 궁전', '1', '1', '랜드마크', '미니스커트, 반바지, 소매없는 옷, 슬리퍼 착용시 위만멕 궁전과 주요 박물관에 입장할 수 없다.', 'BK_05.jpg', 'Ratchawithi Road, Dusit, Bangkok 10300, Thailand');
INSERT INTO  "TRAVELPOINT" (TP_CODE, CITY_CODE, TP_NAME, TP_LATI, TP_LONG, TP_TYPE, TP_CONTENT, TP_IMG, TP_ADDR) VALUES ('TP6', 'CT1', '바이욕 스카이타워', '1', '1', '랜드마크', '일본 도쿄의 도쿄타워와 마찬가지로 방콕의 상징물이다. 방콕에서 가장 높은 건물로 호텔과 레스토랑, 전망대를 가지고있다. 맨 꼭대기층의 전망대는 360도 회전을 하고있어 편안하게 방콕의 밤을 구경할 수 있다.', 'BK_06.jpg', '120/46 Thanon Phaya Thai, Ratchathewi, Bangkok 10400, Thailand');
INSERT INTO  "TRAVELPOINT" (TP_CODE, CITY_CODE, TP_NAME, TP_LATI, TP_LONG, TP_TYPE, TP_CONTENT, TP_IMG, TP_ADDR) VALUES ('TP7', 'CT1', '씨암 스퀘어', '1', '1', '랜드마크', '방콕 대표 쇼핑몰인 씨암 디스커버리, 씨암 센터, 마분콩(MBK) 등이 거대한 쇼핑 센터를 형성하고 있다. 다양한 의류 브랜드와 서점, 은행, 레스토랑 등이 있어 다른 구역으로 이동하지않고 편리한 쇼핑이 가능하다. 대학가와 학원이 많은 지역에 있어 학생들이 많이 온다.', 'BK_07.jpg', 'Siam Square 4 Alley, Pathum Wan, Bangkok 10330, Thailand');
INSERT INTO  "TRAVELPOINT" (TP_CODE, CITY_CODE, TP_NAME, TP_LATI, TP_LONG, TP_TYPE, TP_CONTENT, TP_IMG, TP_ADDR) VALUES ('TP8', 'CT1', '왓 프라깨우', '1', '1', '랜드마크', ' 왕궁 내에 자리한 사원으로 승려가 아닌 왕이 직접 관리한다. 옥으로 만들어진 에메랄드 불상이 있으며 화려한 보석으로 꾸며진 조각상이 사원 주변을 감싸고 있다.', 'BK_08.jpg', 'Sanam Chai Road, Phra Borom Maha Ratchawang, Phra Nakhon, Bangkok 10200, Thailand');
INSERT INTO  "TRAVELPOINT" (TP_CODE, CITY_CODE, TP_NAME, TP_LATI, TP_LONG, TP_TYPE, TP_CONTENT, TP_IMG, TP_ADDR) VALUES ('TP9', 'CT1', '씨암 파라곤', '1', '1', '랜드마크', '쇼핑 시설과 문화 시설을 함께 가지고 있는 대규모 복합문화공간이다. 셀 수 없을 정도로 많은 럭셔리 브랜드와 캐쥬얼 브랜드 매장, 영화관, 공연장, 전시홀, 아쿠아리움, 레스토랑, 카페 등이 있다.', 'BK_09.jpg', 'Rama I, Pathum Wan, Bangkok 10330, Thailand');
INSERT INTO  "TRAVELPOINT" (TP_CODE, CITY_CODE, TP_NAME, TP_LATI, TP_LONG, TP_TYPE, TP_CONTENT, TP_IMG, TP_ADDR) VALUES ('TP10', 'CT1', '씨로코 스카이바', '1', '1', '나이트스팟', '방콕 최고의 야경을 즐길 수 있는 3대 장소 중 하나이다. 식사도 가능한 곳이지만 대부분의 사람들은 칵테일, 맥주 등의 음료만을 마시며 탁 트인 풍경을 만끽한다. 사람이 많아 약간 어수선하다.', 'BK_10.jpg', '1055 Silom, Bang Rak, Bangkok 10500, Thailand');
INSERT INTO  "TRAVELPOINT" (TP_CODE, CITY_CODE, TP_NAME, TP_LATI, TP_LONG, TP_TYPE, TP_CONTENT, TP_IMG, TP_ADDR) VALUES ('TP11', 'CT1', '왓 마하탓', '1', '1', '절/신사/사원', '14세기 아유타야 왕조 시절의 불교 문화를 간직하고 있는 곳이다. 쭐라롱껀 대학교(Chulalongkorn University)의 불교 대학이 이곳에 자리하고 있어 많은 외국의 승려들이 교육을 위해 찾아온다. 템플 스테이와 명상 수련 체험도 할 수 있다.', 'BK_11.jpg', '3 Maha Rat, Phra Borom Maha Ratchawang, Phra Nakhon, Bangkok 10200, Thailand');
INSERT INTO  "TRAVELPOINT" (TP_CODE, CITY_CODE, TP_NAME, TP_LATI, TP_LONG, TP_TYPE, TP_CONTENT, TP_IMG, TP_ADDR) VALUES ('TP12', 'CT1', '락 므앙', '1', '1', '건축물', '라마 1세가 방콕을 수도로 천거하며 도시의 번영을 기원하는 의미로 지은 기둥 사원이다. 태국의 국교인 불교를 상징하는 연꽃 모양으로 만들어졌으며 국민들은 방콕의 수호신인 프라 락 무앙(Phra Lak Muang)이 사원 내에 머무른다고 믿고 있다.', 'BK_12.jpg', '2 Lak Muang, Phra Borom Maha Ratchawang, Phra Nakhon, Bangkok 10200, Thailand');
INSERT INTO  "TRAVELPOINT" (TP_CODE, CITY_CODE, TP_NAME, TP_LATI, TP_LONG, TP_TYPE, TP_CONTENT, TP_IMG, TP_ADDR) VALUES ('TP13', 'CT1', '캅립소 쇼', '1', '1', '전시/공연/관람', '방콕을 대표하는 공연 중 하나이다. 화려한 의상을 입은 아름다운 트랜스젠더들이 세계 각국의 노래와 춤을 선보이는데 매 번 큰 환호를 받는다. 공연이 끝난 후에는 연기자들과 사진을 찍을 수 있다.', 'BK_13.jpg', '2194  Wat Phraya Krai, Bang Kho Laem, Bangkok 10120, Thailand');
INSERT INTO  "TRAVELPOINT" (TP_CODE, CITY_CODE, TP_NAME, TP_LATI, TP_LONG, TP_TYPE, TP_CONTENT, TP_IMG, TP_ADDR) VALUES ('TP14', 'CT1', '그랜드 펄 디너 크루즈', '1', '1', '전경/야경', '차오프라야강에서 운행하는 크루즈 중 가장 큰 규모의 배를 이용하기때문에 편안한 저녁 시간을 보낼 수 있다. 가수들의 공연을 즐기며 저녁식사와 방콕의 야경을 동시에 즐길 수 있다.', 'BK_14.jpg', '37 Charoen Krung 24, Talat Noi, Samphanthawong, Bangkok 10100, Thailand');
INSERT INTO  "TRAVELPOINT" (TP_CODE, CITY_CODE, TP_NAME, TP_LATI, TP_LONG, TP_TYPE, TP_CONTENT, TP_IMG, TP_ADDR) VALUES ('TP15', 'CT1', '짜이디 마사지', '1', '1', '웰니스/스파', '카오산 지역에서 가장 유명한 마사지샵으로 규모가 크지 않음에도 많은 여행자들이 찾아온다. 고급 스파처럼 룸이 따로 준비되어있지는 않고 개별 매트 위에서 마사지를 받게 된다. 오전에 가면 추가 할인을 받을 수 있다.', 'BK_15.jpg', '301 Talat Yot, Phra Nakhon, Bangkok 10200, Thailand');
INSERT INTO  "TRAVELPOINT" (TP_CODE, CITY_CODE, TP_NAME, TP_LATI, TP_LONG, TP_TYPE, TP_CONTENT, TP_IMG, TP_ADDR) VALUES ('TP16', 'CT1', '왓 벤짜마보핏', '1', '1', '절/신사/사원', '태국의 전통 건축 양식인 십자형 구조로 만들어진 사원으로 아름다운 균형미를 자랑하고 있다. 붉은 지붕과 금빛 장식, 하얀 대리석은 사원을 더욱 여성스럽고 화려하게 만들어준다. 사원 뒤에 만들어진 고즈넉한 정원은 이곳의 또 다른 자랑거리 중 하나이다.', 'BK_16.jpg', '69 Dusit, Bangkok 10300, Thailand');
INSERT INTO  "TRAVELPOINT" (TP_CODE, CITY_CODE, TP_NAME, TP_LATI, TP_LONG, TP_TYPE, TP_CONTENT, TP_IMG, TP_ADDR) VALUES ('TP17', 'CT1', '더 루프', '1', '1', '전경/야경', '왓 아룬(Wat Arun)의 멋진 야경을 감상할 수 있는 칵테일 바. 차오 쁘라야 강변의 노을과 야경이 로맨틱한 밤을 선사한다.', 'BK_17.jpg', '37 Maha Rat, Phra Borom Maha Ratchawang, Phra Nakhon, Bangkok 10200, Thailand');
INSERT INTO  "TRAVELPOINT" (TP_CODE, CITY_CODE, TP_NAME, TP_LATI, TP_LONG, TP_TYPE, TP_CONTENT, TP_IMG, TP_ADDR) VALUES ('TP18', 'CT1', '두씻정원', '1', '1', '공원/정원', '미니스커트, 반바지, 소매없는 옷, 슬리퍼 착용시 위만멕 궁전과 주요 박물관에 입장할 수 없다.', 'BK_18.jpg', '197 5 Dusit, Bangkok 10300, Thailand');
INSERT INTO  "TRAVELPOINT" (TP_CODE, CITY_CODE, TP_NAME, TP_LATI, TP_LONG, TP_TYPE, TP_CONTENT, TP_IMG, TP_ADDR) VALUES ('TP19', 'CT1', '왓 차나쏭크람', '1', '1', '절/신사/사원', '태국의 전통 건축양식으로 지어진 사원으로 황금빛의 장식으로 화려하게 꾸며져있다. 방콕의 모든 여행자가 찾는다는 카오산 지역에 있음에도 찾아오는 사람들은 대부분 현지인이다. 조용한 공간에서 명상을 하거나 기도를 하기위해 찾기 좋다.', 'BK_19.jpg', '77 Chana Songkhram, Phra Nakhon, Bangkok 10200, Thailand');
INSERT INTO  "TRAVELPOINT" (TP_CODE, CITY_CODE, TP_NAME, TP_LATI, TP_LONG, TP_TYPE, TP_CONTENT, TP_IMG, TP_ADDR) VALUES ('TP20', 'CT1', '국립박물관', '1', '1', '박물관', '라마 7세 때부터 박물관으로 사용됬으며 동남아시아 최고의 박물관 중 하나로 여겨진다. 왕궁에서 옮겨운 각종 왕실 용품과 유물, 예술품 등을 포함하여 태국의 유서깊은 물품들이 전시되어있다.', 'BK_20.jpg', '4  Phra Borom Maha Ratchawang, Phra Nakhon, Bangkok 10200, Thailand');
INSERT INTO  "TRAVELPOINT" (TP_CODE, CITY_CODE, TP_NAME, TP_LATI, TP_LONG, TP_TYPE, TP_CONTENT, TP_IMG, TP_ADDR) VALUES ('TP21', 'CT1', '더 데크', '1', '1', '서양식/미국식', '다양한 태국 음식을 먹을 수 있는 레스토랑이다. 음식의 맛보다는 방콕에서 가장 아름답다는 새벽사원의 전경을 내려다볼 수 있어 더욱 유명해졌다. 알프레스코 자리에서는 시원한 강바람을 맞으며 로맨틱한 시간을 보내기에도 좋다.', 'BK_21.jpg', '278 Maha Rat, Phra Borom Maha Ratchawang, Phra Nakhon, Bangkok 10200, Thailand');
INSERT INTO  "TRAVELPOINT" (TP_CODE, CITY_CODE, TP_NAME, TP_LATI, TP_LONG, TP_TYPE, TP_CONTENT, TP_IMG, TP_ADDR) VALUES ('TP22', 'CT1', '탑싸마이', '1', '1', '태국식', '태국의 대표 음식 중 하나인 팟타이로 방콕에서 가장 유명한 레스토랑이다. 메뉴에 있는 8가지 종류의 팟타이 중에서 계란으로 감싸져있는 슈퍼 팟타이(Superb Phad Thai)가 가장 유명하다. 피쉬 소스, 땅콩가루 등은 직접 첨가해서 먹을 수 있다.', 'BK_22.jpg', '313 Maha Chai, Samran Rat, Phra Nakhon, Bangkok 10200, Thailand');
INSERT INTO  "TRAVELPOINT" (TP_CODE, CITY_CODE, TP_NAME, TP_LATI, TP_LONG, TP_TYPE, TP_CONTENT, TP_IMG, TP_ADDR) VALUES ('TP23', 'CT1', '나이쏘이', '1', '1', '태국식', '허름하고 특별할 것 없어 보이지만 현지인들이 사랑하는 맛집이다. 유일한 메뉴인 소고기국수는 깊은 맛의 국물과 푸짐하게 얹어진 고기가 일품이다. 조리법과 매콤한 정도에 따라 5개의 메뉴로 구분된다.', 'BK_23.jpg', '100/2 Phra Athit, Chana Songkhram, Phra Nakhon, Bangkok 10200, Thailand');
INSERT INTO  "TRAVELPOINT" (TP_CODE, CITY_CODE, TP_NAME, TP_LATI, TP_LONG, TP_TYPE, TP_CONTENT, TP_IMG, TP_ADDR) VALUES ('TP24', 'CT1', '로띠 마타바', '1', '1', '태국식', '카오산 로드의 여행자와 현지인 모두에게 유명한 곳이다. 로띠는 밀가루 반죽만을 두툼하게 구워낸 것이며 마따바는 로띠 안에 고기, 채소, 해산물 등의 재료를 채운 음식이다. 간단하게 간식으로 먹거나 커리, 치킨 등과 함께 식사로 먹을 수 있다.', 'BK_24.jpg', '138 Phra Athit, Chana Songkhram, Phra Nakhon, Bangkok 10200, Thailand');
INSERT INTO  "TRAVELPOINT" (TP_CODE, CITY_CODE, TP_NAME, TP_LATI, TP_LONG, TP_TYPE, TP_CONTENT, TP_IMG, TP_ADDR) VALUES ('TP25', 'CT1', '쿤뎅 꾸웨이짭 유안', '1', '1', '태국식', '베트남 국수와 태국 음식을 전문으로 판매한다. 국수는 돼지고기, 버섯 등 다양한 재료로 만든 육수에 면발을 넣은 것으로 깊은 맛을 자랑하며 태국식 샐러드를 곁들이면 더욱 좋다. 향신료에 익숙하지 않은 사람은 먹기 힘들 수도 있다.', 'BK_25.jpg', '78 Phra Athit, Chana Songkhram, Phra Nakhon, Bangkok 10200, Thailand');
INSERT INTO  "TRAVELPOINT" (TP_CODE, CITY_CODE, TP_NAME, TP_LATI, TP_LONG, TP_TYPE, TP_CONTENT, TP_IMG, TP_ADDR) VALUES ('TP26', 'CT1', '살라팁', '1', '1', '태국식', '강 위에 떠있는 듯한 신비로운 분위기의 레스토랑이다. 똠얌꿍, 뿌팟퐁커리 등의 태국 음식을 맛볼 수 있으며 저녁에는 태국 전통 공연도 볼 수 있다. 바로 옆에 흐르는 강덕분에 더욱 로맨틱하다.', 'BK_26.jpg', '89 Charoen Krung 46, Bang Rak, Bangkok 10500, Thailand');
INSERT INTO  "TRAVELPOINT" (TP_CODE, CITY_CODE, TP_NAME, TP_LATI, TP_LONG, TP_TYPE, TP_CONTENT, TP_IMG, TP_ADDR) VALUES ('TP27', 'CT1', '리버사이드 테라스', '1', '1', '뷔페', '차오프라야강의 바로 옆에서 강의 운치를 즐기며 로맨틱한 식사를 할 수 있다. 셰프가 직접 그릴에 구워주는 해산물과 고기, 야채 등을 맛볼 수 있으며 태국 음식과 각종 디저트도 준비되어있다. 현지인과 서양인들이 많이 찾는 편이다.', 'BK_27.jpg', 'Charoen Krung 38 Alley, Bang Rak, Bangkok 10500, Thailand');
INSERT INTO  "TRAVELPOINT" (TP_CODE, CITY_CODE, TP_NAME, TP_LATI, TP_LONG, TP_TYPE, TP_CONTENT, TP_IMG, TP_ADDR) VALUES ('TP28', 'CT1', '동대문', '1', '1', '한식', '한국의 김치말이 국수로 유명한 한식당이다. 방콕의 더위에 기운이 떨어졌을 때 시원한 국물과 아삭한 김치로 체력 보충하기 좋다. 이외에도 각종 찌개와 비빔밥 등이 메뉴로 있으며 양도 푸짐한 편이다.', 'BK_28.jpg', '19 Phra Athit, Chana Songkhram, Phra Nakhon, Bangkok 10200, Thailand');
INSERT INTO  "TRAVELPOINT" (TP_CODE, CITY_CODE, TP_NAME, TP_LATI, TP_LONG, TP_TYPE, TP_CONTENT, TP_IMG, TP_ADDR) VALUES ('TP29', 'CT1', '촛찟', '1', '1', '태국식', '방콕에서 가장 오래된 레스토랑 중 하나로 오래된만큼 과거 태국의 전통 조리법을 그대로 유지하고 있다. 똠얌꿍이 가장 유명하며 코코넛밀크와 새우를 넣은 옐로우 커리도 인기가 좋다.', 'BK_29.jpg', '546  San Chao Pho Sua, Phra Nakhon, Bangkok 10200, Thailand');
INSERT INTO  "TRAVELPOINT" (TP_CODE, CITY_CODE, TP_NAME, TP_LATI, TP_LONG, TP_TYPE, TP_CONTENT, TP_IMG, TP_ADDR) VALUES ('TP30', 'CT1', '인 러브', '1', '1', '태국식', ' 차오프라야강의 야경을 조망할 수 있는 레스토랑으로 태국, 일본, 유럽 등 다양한 국가의 음식을 먹을 수 있다. 1층은 좀 더 은은하고 차분한 분위기의 공간으로 가수의 라이브 공연을 볼 수 있다. 2층은 보다 탁 트인 전망을 가진 곳이다.', 'BK_30.jpg', '2/1 Wat Sam Phraya, Phra Nakhon, Bangkok 10200, Thailand');
INSERT INTO  "TRAVELPOINT" (TP_CODE, CITY_CODE, TP_NAME, TP_LATI, TP_LONG, TP_TYPE, TP_CONTENT, TP_IMG, TP_ADDR) VALUES ('TP31', 'CT1', '낀롬 촘 싸판', '1', '1', '해산물', '차오프라야강 옆에 만들어진 대규모 레스토랑으로 관광객보다는 현지인들이 훨씬 많이 찾는다. 태국 전통 음식과 해산물 요리를 먹을 수 있으며 원할 경우에는 재료를 직접 고를 수도 있다. 저녁에는 밴드가 공연을 하기도 한다.', 'BK_31.jpg', '165 Samsen 5, Wat Sam Phraya, Phra Nakhon, Bangkok 10200, Thailand');
INSERT INTO  "TRAVELPOINT" (TP_CODE, CITY_CODE, TP_NAME, TP_LATI, TP_LONG, TP_TYPE, TP_CONTENT, TP_IMG, TP_ADDR) VALUES ('TP32', 'CT1', '멀리건스 아이리시 바', '1', '1', '서양식/미국식', '아침식사부터 야식까지 즐길 수 있는 펍으로 편한 시간에 찾기 좋다. 하지만 기네스, 킬케니, 르페 등의 아이리쉬 맥주를 마시며 밴드의 공연을 즐기기위해 저녁 시간에 찾는 손님들이 가장 많다. 오후 3시부터 8시, 새벽 2시부터 4시에는 해피 아워 시간으로 더 저렴한 가격에 시원한 맥주를 마실 수 있다.', 'BK_32.jpg', '255 Talat Yot, Phra Nakhon, Bangkok 10200, Thailand');
INSERT INTO  "TRAVELPOINT" (TP_CODE, CITY_CODE, TP_NAME, TP_LATI, TP_LONG, TP_TYPE, TP_CONTENT, TP_IMG, TP_ADDR) VALUES ('TP33', 'CT1', '하모니크', '1', '1', '태국식', '깊숙한 골목에 자리하고 있어 현지인이 아니면 찾기 힘든 태국 가정식 전문점이다. 발라낸 게살과 커리를 함께 볶아낸 크랩 커리가 가장 유명하며 팟타이, 스프링 롤, 똠얌꿍 등도 있다.', 'BK_33.jpg', '1216/10 Bang Rak, Bangkok 10500, Thailand');
INSERT INTO  "TRAVELPOINT" (TP_CODE, CITY_CODE, TP_NAME, TP_LATI, TP_LONG, TP_TYPE, TP_CONTENT, TP_IMG, TP_ADDR) VALUES ('TP34', 'CT1', '오서스 라운지', '1', '1', '카페/디저트', '방콕에서 가장 수준 높은 애프터눈 티를 즐길 수 있는 곳으로 다양한 디저트가 담긴 3단 트레이와 차가 제공된다. 유리 천장과 실내에 심어놓은 나무, 꽃 덕분에 따뜻하고 포근한 유리 온실이 연상된다.', 'BK_34.jpg', 'Charoen Krung 38 Alley, Bang Rak, Bangkok 10500, Thailand');
INSERT INTO  "TRAVELPOINT" (TP_CODE, CITY_CODE, TP_NAME, TP_LATI, TP_LONG, TP_TYPE, TP_CONTENT, TP_IMG, TP_ADDR) VALUES ('TP35', 'CT1', '쑤파트라 리버 하우스', '1', '1', '태국식', ' 차오프라야강을 따라 자리하고 있는 레스토랑으로 태국 문화를 느낄 수 있는 곳이다. 모든 종업원들은 태국 전통 의상을 입고 있으며 음식 역시 태국 전통 방식으로 조리된다. 저녁 시간에는 태국 전통 공연도 볼 수 있다.', 'BK_35.jpg', '336/10 Arun Ammarin, Siriraj, Bangkok Noi, Bangkok 10700, Thailand');
INSERT INTO  "TRAVELPOINT" (TP_CODE, CITY_CODE, TP_NAME, TP_LATI, TP_LONG, TP_TYPE, TP_CONTENT, TP_IMG, TP_ADDR) VALUES ('TP36', 'CT1', '프라짝', '1', '1', '태국식', ' 100년 이상의 전통을 가진 곳으로 중국식 고기 요리와 완탕을 먹을 수 있는 곳이다. 오리고기(Roasted Duck)와 돼지고기 요리(Red Pork)가 가장 대표적이며 다양한 재료를 넣은 완탕과 딤섬도 맛볼 수 있다.', 'BK_36.jpg', '1407 Charoen Krung Road, Silom, Bang Rak, Bangkok 10500, Thailand');
INSERT INTO  "TRAVELPOINT" (TP_CODE, CITY_CODE, TP_NAME, TP_LATI, TP_LONG, TP_TYPE, TP_CONTENT, TP_IMG, TP_ADDR) VALUES ('TP37', 'CT1', '안젤리니', '1', '1', '이태리식', '방콕 최고의 레스토랑에 12년동안 이름을 올린 이탈리안 레스토랑이다. 카르파초(carpaccio), 또르뗄리니(tortellini), 링귀니(linguine)가 이곳에서 가장 인기있는 메뉴이다. 세계 각지에서 수입해온 와인과 칵테일도 함께 맛볼 수 있다.', 'BK_37.jpg', 'Charoen Krung 44 Alley, Bang Rak, Bangkok 10500, Thailand');
INSERT INTO  "TRAVELPOINT" (TP_CODE, CITY_CODE, TP_NAME, TP_LATI, TP_LONG, TP_TYPE, TP_CONTENT, TP_IMG, TP_ADDR) VALUES ('TP38', 'CT1', '리키 커피숍', '1', '1', '카페/디저트', '중국 전통 찻집이 생각나는 분위기의 카페이다. 각종 열대과일 주스와 커피, 핫초코 등의 음료가 주 메뉴이다. 간단한 샌드위치나 타코 등의 멕시칸 요리를 먹을 수 있으며 저녁에는 맥주를 마시러 찾는 태국의 대학생과 여행자들이 많다.', 'BK_38.jpg', '20 Phra Athit, Chana Songkhram, Phra Nakhon, Bangkok 10200, Thailand');
INSERT INTO  "TRAVELPOINT" (TP_CODE, CITY_CODE, TP_NAME, TP_LATI, TP_LONG, TP_TYPE, TP_CONTENT, TP_IMG, TP_ADDR) VALUES ('TP39', 'CT1', '더 베란다', '1', '1', '태국식', '만다린 오리엔탈(Mandarin Oriental) 호텔의 레스토랑이다. 탁 트인 차오프라야강의 풍경을 감상할 수 있으며 해가 진 후의 야경은 더욱 우아한 분위기를 만들어준다. 태국 음식부터 서양 음식, 디저트까지 다양한 메뉴가 있다.', 'BK_39.jpg', '46  40 Bang Rak, Bangkok 10500, Thailand');
INSERT INTO  "TRAVELPOINT" (TP_CODE, CITY_CODE, TP_NAME, TP_LATI, TP_LONG, TP_TYPE, TP_CONTENT, TP_IMG, TP_ADDR) VALUES ('TP40', 'CT1', '더 로비', '1', '1', '카페/디저트', '태국의 유명 아티스트들이 만든 작품들이 조화를 이루고 있는 공간으로 화려한 인테리어를 자랑한다. 간단한 식사나 디저트와 차로 구성된 애프터눈 티를 즐길 수 있다. 창문을 통해 방콕의 스카이라인을 볼 수 있다.', 'BK_40.jpg', '333 Khlong Ton Sai, Khlong San, Bangkok 10600, Thailand');
INSERT INTO  "TRAVELPOINT" (TP_CODE, CITY_CODE, TP_NAME, TP_LATI, TP_LONG, TP_TYPE, TP_CONTENT, TP_IMG, TP_ADDR) VALUES ('TP41', 'CT1', '방람푸 시장', '1', '1', '시장/쇼핑거리', '1980년대에 만들어진 시장이다. 다양한 태국의 상품과 열대 과일, 현지 음식을 판매하고 있어 평소에 현지인들이 장을 보기위해 많이 찾는다. 독특한 태국식 문양으로 헤나 체험을 할 수 있으며 현지인들의 일상을 구경하기에도 좋다.', 'BK_41.jpg', '3 Tani, Talat Yot, Phra Nakhon, Bangkok 10200, Thailand');
INSERT INTO  "TRAVELPOINT" (TP_CODE, CITY_CODE, TP_NAME, TP_LATI, TP_LONG, TP_TYPE, TP_CONTENT, TP_IMG, TP_ADDR) VALUES ('TP42', 'CT1', '부적시장', '1', '1', '시장/쇼핑거리', '태국인들은 부적을 몸에 지니면 각종 악재가 피해간다고 믿기때문에 평소에도 많이 가지고 다닌다. 시장에서는 다양한 불교 용품과 부적으로 만들어진 각종 액세서리, 불상, 약재 등을 판매한다.', 'BK_42.jpg', 'Sanam Phra, Phra Borom Maha Ratchawang, Phra Nakhon, Bangkok 10200, Thailand');
INSERT INTO  "TRAVELPOINT" (TP_CODE, CITY_CODE, TP_NAME, TP_LATI, TP_LONG, TP_TYPE, TP_CONTENT, TP_IMG, TP_ADDR) VALUES ('TP43', 'CT1', '쏘이 쌈벵', '1', '1', '시장/쇼핑거리', '차이나타운의 초입에 자리한 1km 남짓한 골목이다. 중국에서 수입된 간식과 식료품, 옷, 액세서리, 생활용품 등을 판매하는 노점상들로 거리가 가득 채워져있다. 상점이 너무 많아 복잡하기때문에 입구를 잘 기억하고 있어야 한다.', 'BK_43.jpg', '140 Chakkrawat, Samphanthawong, Bangkok 10100, Thailand');
INSERT INTO  "TRAVELPOINT" (TP_CODE, CITY_CODE, TP_NAME, TP_LATI, TP_LONG, TP_TYPE, TP_CONTENT, TP_IMG, TP_ADDR) VALUES ('TP44', 'CT1', '아시아티크', '1', '1', '시장/쇼핑거리', '방콕 야시장 중에서 가장 깔끔하고 핫한 곳으로 밤이면 푸른 조명으로 빛나는 거대한 관람차가 멀리서도 눈에 띈다. 야시장치고 저렴한 가격은 아니지만 다른 시장에 비해 품질이 좋은 편이다. 테라스가 만들어져있어 노점상에서 야식과 맥주 등을 사먹기 편하다.', 'BK_44.jpg', '2194  Wat Phraya Krai, Bang Kho Laem, Bangkok 10120, Thailand');
INSERT INTO  "TRAVELPOINT" (TP_CODE, CITY_CODE, TP_NAME, TP_LATI, TP_LONG, TP_TYPE, TP_CONTENT, TP_IMG, TP_ADDR) VALUES ('TP45', 'CT1', '담넌 싸두악 수상시장', '1', '1', '시장/쇼핑거리', ' 방콕 외곽에 자리하고 있는 시장으로 나무 데크나 좁고 기다란 배 위에서 물건을 판매하고 있는 모습이 진풍경이다. 열대 과일과 각종 식재료, 기념품 등과 팟타이 등의 현지 음식을 판매하고 있다. 지금은 현지인보다 관광객이 더 많아진 편이다.', 'BK_45.jpg', '333 Damnoen Saduak, Damnoen Saduak District, Ratchaburi 70130, Thailand');

COMMIT;

