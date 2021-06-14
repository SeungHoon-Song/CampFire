-- 
CREATE SEQUENCE SEQ_POLICY_BOARD;

DROP TABLE TBL_POLICY_BOARD ;
CREATE TABLE TBL_POLICY_BOARD(
	BNO NUMBER(10),
	TITLE VARCHAR2(200) NOT NULL,
	CONTENT VARCHAR2(2000) NOT NULL,
	WRITER VARCHAR2(200) NOT NULL,
	REGDATE DATE DEFAULT SYSDATE,
	UPDATEDATE DATE DEFAULT SYSDATE,
	policyKeyword VARCHAR2(30) NOT NULL
);

ALTER TABLE TBL_POLICY_BOARD ADD CONSTRAINT PK_POLICY_BOARD PRIMARY KEY(BNO);
ALTER TABLE TBL_POLICY_BOARD ADD CONSTRAINT FK_POLICY_BOARD FOREIGN KEY(WRITER) REFERENCES CF_USER(userId) ON DELETE CASCADE;


UPDATE TBL_POLICY_BOARD SET REPLYCNT = (SELECT COUNT(RNO) FROM TBL_POLICY_REPLY 
WHERE TBL_POLICY_REPLY.BNO = TBL_POLICY_BOARD.BNO);


INSERT INTO TBL_POLICY_BOARD
(BNO, TITLE, CONTENT, WRITER, REGDATE, CATEGORY)
VALUES(SEQ_POLICY_BOARD.NEXTVAL, '가즈아~', '으디를 가~! !!!', 'test1', SYSDATE, 'notices'
);

SELECT * FROM TBL_POLICY_BOARD ORDER BY BNO desc;


INSERT INTO TBL_POLICY_BOARD (BNO, TITLE, CONTENT, WRITER)
(SELECT SEQ_POLICY_BOARD.NEXTVAL, TITLE, CONTENT, WRITER FROM TBL_POLICY_BOARD);

