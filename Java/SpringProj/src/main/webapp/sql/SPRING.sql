
/* Drop Tables */

/*
DROP TABLE LINECOMMENTS CASCADE CONSTRAINTS;
DROP TABLE ONEMEMO CASCADE CONSTRAINTS;
DROP TABLE MEMBER CASCADE CONSTRAINTS;
DROP SEQUENCE SEQ_ONEMEMO;
DROP SEQUENCE SEQ_LINECOMMENTS;*/





CREATE TABLE LINECOMMENTS
(
	LNO number NOT NULL,
	LINECOMMENT nvarchar2(50) NOT NULL,
	LPOSTDATE date DEFAULT SYSDATE,
	NO number NOT NULL,
	ID varchar2(10) NOT NULL,
	PRIMARY KEY (LNO)
);


CREATE TABLE MEMBER
(
	ID varchar2(10) NOT NULL,
	PWD varchar2(10) NOT NULL,
	NAME nvarchar2(10) NOT NULL,
	PRIMARY KEY (ID)
);


CREATE TABLE ONEMEMO
(
	NO number NOT NULL,
	TITLE nvarchar2(50) NOT NULL,
	CONTENT nvarchar2(2000) NOT NULL,
	POSTDATE date DEFAULT SYSDATE,
	ID varchar2(10) NOT NULL,
	PRIMARY KEY (NO)
);





ALTER TABLE LINECOMMENTS
	ADD FOREIGN KEY (ID)
	REFERENCES MEMBER (ID)
;


ALTER TABLE ONEMEMO
	ADD FOREIGN KEY (ID)
	REFERENCES MEMBER (ID)
;


ALTER TABLE LINECOMMENTS
	ADD FOREIGN KEY (NO)
	REFERENCES ONEMEMO (NO)
;

CREATE SEQUENCE SEQ_ONEMEMO
NOCACHE
NOCYCLE;

CREATE SEQUENCE SEQ_LINECOMMENTS
NOCACHE
NOCYCLE;

INSERT INTO MEMBER VALUES('KIM','1234','김길동');
INSERT INTO MEMBER VALUES('LEE','1234','이길동');
INSERT INTO MEMBER VALUES('PARK','1234','박길동');






