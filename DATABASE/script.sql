-- id, pw, email,
-- 이름, 나이, 성별, 휴대폰번호, 주소
DROP TABLE MEMBER CASCADE CONSTRAINTS;

CREATE TABLE MEMBER
(
    memberId            VARCHAR2(100) NOT NULL,
    memberPw            VARCHAR2(100) NOT NULL,
    memberEmail         VARCHAR2(200) NOT NULL,
    memberName          VARCHAR2(100),
    memberAge           NUMBER(3),
    memberGender        VARCHAR2(20),
    memberTel           VARCHAR2(14),
    memberZipcode       VARCHAR2(20),
    memberAddress       VARCHAR2(300),
    memberAddressDETAIL VARCHAR2(300),
    memberAddressEtc    VARCHAR2(100),
    CONSTRAINT MEMBER_PK PRIMARY KEY (memberId)
);
CREATE TABLE MEMBER
(
    memberId            VARCHAR2(100) NOT NULL primary key ,
    memberPw            VARCHAR2(100) NOT NULL,
    memberEmail         VARCHAR2(200) NOT NULL
);

SELECT * FROM MEMBER;
SELECT * FROM HR.TABLE_MEMBER;

---

DROP TABLE MEMBER;

CREATE TABLE MEMBER(
                             memberId VARCHAR2(300),
                             memberPw VARCHAR2(300),
                             memberEmail VARCHAR2(200) unique,
                             CONSTRAINT MEMBER_PK PRIMARY KEY(memberId)
);

-- 제약조건 삭제
-- ALTER TABLE TABLE_MEMBER DROP CONSTRAINT MEMBER_PK;
--
-- SELECT * FROM TABLE_MEMBER;

INSERT INTO MEMBER
(MEMBERID, MEMBERPW, MEMBEREMAIL)
VALUES('asd1234', '1234', 'ddd');