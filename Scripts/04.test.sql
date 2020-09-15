SELECT NAME, USERID, PWD, EMAIL, PHONE, ADMIN, JOINDATE
  FROM MEMBER;

INSERT INTO MEMBER(NAME, USERID, PWD, EMAIL, PHONE, ADMIN) 
VALUES ('박규영', 'parkgy', '1234', 'pgy@gmail.com', '010-1111-2222', 0);

SELECT NAME, USERID, PWD, EMAIL, PHONE, ADMIN, JOINDATE
  FROM MEMBER
 WHERE USERID = 'parkgy';

UPDATE MEMBER
   SET NAME='문채원', PWD='5678', EMAIL='mcw@gmail.com', 
       PHONE='010-3333-5555', ADMIN=1, JOINDATE='2020-08-20'
 WHERE USERID = 'parkgy';

DELETE FROM MEMBER WHERE USERID = 'test';

-- usercheck
SELECT PWD FROM MEMBER WHERE USERID = 'somi';

-- login
SELECT NAME, USERID, EMAIL, PHONE, ADMIN, JOINDATE
  FROM MEMBER
 WHERE USERID = 'somi' AND pwd = '1111';


--
SELECT USER FROM dual;

SELECT *
  FROM USER_TABLES;

SELECT TITLE_NO, TITLE_NAME FROM TITLE;


SELECT max(TITLE_NO)+1 FROM TITLE;

 

DROP view VW_EMPLOYEEJOIN;

SELECT EMP_NO, EMP_NAME FROM EMPLOYEE WHERE dno = 2;

SELECT 1 FROM EMPLOYEE WHERE emp_no = 4377;

SELECT EMP_NO, EMP_NAME, TNO, MANAGER, SALARY, DNO, EMAIL, REGDATE, TEL, PIC_URL FROM EMPLOYEE;     
      
      
      
      
SELECT EMP_NO, EMP_NAME, TNO, MANAGER, SALARY, DNO, EMAIL, REGDATE, TEL, PIC_URL, PASSWD 
  FROM EMPLOYEE  WHERE EMP_NO = '';
      
 
SELECT EMP_NO, EMP_NAME 
  FROM EMPLOYEE; 
 WHERE dno = ; 



-------------------------------------------------
---TRIGGER---
-------------------------------------------------
DROP TABLE TRI_TEST;
DROP TRIGGER TRI_TRI_TEST_AUTOSEQ; 
DROP SEQUENCE TRI_TEST_SEQ;


CREATE TABLE tri_test(
	NO NUMBER PRIMARY KEY,
	txt varchar2(20)
);
      
CREATE SEQUENCE tri_test_seq
	START WITH 1
	INCREMENT BY 1;

--트리거를 이용하여 자동으로 번호가 입력되도록 설정
CREATE OR REPLACE TRIGGER TRI_TRI_TEST_AUTOSEQ
BEFORE INSERT ON tri_test
FOR EACH ROW 
BEGIN 
	IF INSERTING AND :NEW.NO IS NULL THEN
		SELECT tri_test_seq.NEXTVAL INTO :NEW.NO FROM DUAL;
	END IF;
END; 

INSERT INTO tri_test VALUES(NULL, 'test');

SELECT * FROM TRI_TEST;

INSERT INTO tri_test(txt) VALUES('test2');

SELECT CODE,NAME,PRICE,PICTUREURL,DESCRIPTION FROM PRODUCT;

SELECT CODE, NAME, PRICE, PICTUREURL, DESCRIPTION FROM PRODUCT WHERE CODE = 1;      
      
      
SELECT NUM,PASS,NAME,EMAIL,TITLE,CONTENT,READCOUNT,WRITEDATE FROM BOARD;

SELECT NUM,PASS,NAME,EMAIL,TITLE,CONTENT,READCOUNT,WRITEDATE FROM BOARD WHERE NUM = ?;

SELECT NUM, PASS FROM BOARD WHERE NUM = 1 AND PASS = 1234;

INSERT INTO BOARD (PASS, NAME, EMAIL, TITLE, CONTENT, READCOUNT, WRITEDATE)
VALUES(?, ?, ?, ?, ?, ?, ?);

UPDATE BOARD SET (PASS=?, NAME=?, EMAIL=?, TITLE=?, CONTENT=?, READCOUNT=?, WRITEDATE=?) WHERE NUM = ?;

DELETE FROM BOARD WHERE NUM = ?;

