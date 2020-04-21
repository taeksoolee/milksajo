CREATE TABLE PRODUCT_DIVISION(pd_division VARCHAR2(10) CONSTRAINT PRODUCT_DIVISION_DIVISION_PK PRIMARY KEY, 
                                pd_feature VARCHAR(30),
                                pd_stdsize VARCHAR(5) CONSTRAINT PRODUCT_DIVISION_STD_SIZE_NN NOT NULL);
                                
CREATE TABLE PRODUCT(p_serial_no NUMBER(4) CONSTRAINT PRODUCT_SERIAL_NUMBER_PK PRIMARY KEY, 
                        p_division VARCHAR2(10),
                        p_name VARCHAR2(10) CONSTRAINT PRODUCT_NAME_NN NOT NULL,
                        p_origin VARCHAR2(10),
                        p_size NUMBER(5) CONSTRAINT PRODUCT_SIZE_NN NOT NULL,
                        p_price NUMBER(10) CONSTRAINT PRODUCT_PRICE_NN NOT NULL,
                        p_amount NUMBER(5) CONSTRAINT PRODUCT_AMOUNT_NN NOT NULL,
                        p_sale_amount NUMBER(5) CONSTRAINT PRODUCT_SALE_AMOUNT_NN NOT NULL,
                        CONSTRAINT PRODUCT_DIVISION_FK FOREIGN KEY (p_division) REFERENCES PRODUCT_DIVISION(pd_division));
                    
CREATE TABLE MEMBER(id VARCHAR2(20) CONSTRAINT MEMBER_ID_PK PRIMARY KEY,
                    password VARCHAR2(200) CONSTRAINT MEMBER_PASSWORD_NN NOT NULL,
                    name VARCHAR2(20) CONSTRAINT MEMBER_NAME_NN NOT NULL,
                    birthday DATE,
                    phone VARCHAR2(20) CONSTRAINT MEMBER_PHONE_NN NOT NULL,
                    email VARCHAR2(30),
                    address VARCHAR2(500) CONSTRAINT MEMBER_ADDRESS_NN NOT NULL,                                        
                    join_date DATE CONSTRAINT MEMBER_JOINDATE_NN NOT NULL,
                    last_login DATE CONSTRAINT MEMBER_LAST_LOGIN_NN NOT NULL,
                    status NUMBER(1) CONSTRAINT MEMBER_STATUS_NN NOT NULL);                           

CREATE TABLE MANAGER(m_employee_no NUMBER(10) CONSTRAINT MANAGER_EMPLOYEE_NO_PK PRIMARY KEY,
                        m_password VARCHAR(30) CONSTRAINT MANAGER_PASSWORD_NN NOT NULL,
                        m_name VARCHAR2(10)  CONSTRAINT MANAGER_NAME_NN NOT NULL,
                        m_grade NUMBER(1)  CONSTRAINT MANAGER_GRADE_NN NOT NULL);

CREATE TABLE BUYING_RECORD(br_order_no VARCHAR2(11), -- CONSTRAINT BUING_RECORD_NO_PK PRIMARY KEY2020, --yyyymmddnnn
                            br_serial_no NUMBER(4),
                            br_amount NUMBER(3) CONSTRAINT BUYING_RECORD_AMOUNT_NN NOT NULL,
                            br_deposit NUMBER(10),
                            br_refund NUMBER(10),
                            br_state NUMBER(1) CONSTRAINT BUYING_RECORD_STATE_NN NOT NULL,
                            CONSTRAINT BUYING_RECORD_ORDER_NO_FK FOREIGN KEY (br_order_no) REFERENCES BUYING_INF(bi_order_no),
                            CONSTRAINT BUYING_RECORD_SERIAL_NO_FK FOREIGN KEY (br_serial_no) REFERENCES PRODUCT(p_serial_no));

CREATE TABLE BUYING_INF(bi_order_no VARCHAR2(11) CONSTRAINT BUYING_INF_ORDER_NO_PK PRIMARY KEY,
						bi_user_id VARCHAR2(20),
						CONSTRAINT BUYING_INF_USER_ID_FK FOREIGN KEY (bi_user_id) REFERENCES member(id));
    
CREATE TABLE CART(ca_user_id VARCHAR2(20),
                        ca_amount NUMBER(4) CONSTRAINT CART_AMOUNT_NN NOT NULL,
                        ca_serial_no NUMBER(4),
                        CONSTRAINT CART_SERIAL_NO_FK FOREIGN KEY (ca_serial_no) REFERENCES PRODUCT(p_serial_no),
                        CONSTRAINT CART_USER_ID_FK FOREIGN KEY (ca_user_id) REFERENCES USERS(u_user_id));
    
CREATE TABLE INPUT_PRODUCT(ip_employee_no NUMBER(10),
                            ip_date DATE CONSTRAINT INPUT_PRODUCT_DATE_NN NOT NULL,
                            ip_serial_no NUMBER(4),
                            ip_amount NUMBER(3) CONSTRAINT INPUT_PRODUCT_AMOUNT_NN NOT NULL,
                            CONSTRAINT INPUT_MANAGER_ID_FK FOREIGN KEY (ip_employee_no) REFERENCES MANAGER(m_employee_no),
                            CONSTRAINT INPUT_SERIAL_NO_FK FOREIGN KEY (ip_serial_no) REFERENCES PRODUCT(p_serial_no));
                           
CREATE TABLE BOARDER(bd_no NUMBER(4) CONSTRAINT BOARDER_NO PRIMARY KEY, -- sequence
                        bd_title VARCHAR2(30) CONSTRAINT BOARDER_TITLE_NN NOT NULL,
	           bd_pw VARCHAR2(30) CONSTARTINT BOARDER_PASSWORD_NN NOT NULL,
                        bd_content VARCHAR2(2000) CONSTRAINT BOARDER_CONTENT_NN NOT NULL,
                        bd_date DATE,
                        bd_user_id VARCHAR2(20),
                        CONSTRAINT BOARDER_USER_ID_FK FOREIGN KEY (bd_user_id) REFERENCES USERS(u_user_id));
CREATE SEQUENCE BORDER_SEQ;
    
CREATE TABLE PRODUCT_PAGE(pp_no NUMBER(3) CONSTRAINT PRODUCT_PAGE_NO_PK PRIMARY KEY,
                            pp_serial_no NUMBER(4) CONSTRAINT PRODUCT_SERIAL_NO_U UNIQUE,
                            pp_main_image VARCHAR2(20) CONSTRAINT PRODUCT_PAGE_MAIN_IMG_NN NOT NULL,
                            pp_employee_no NUMBER(20),
                            pp_content_image VARCHAR2(20) CONSTRAINT PRODUCT_PAGE_CONTENT_IMG_NN NOT NULL,
                            CONSTRAINT PRODUCT_PAGE_SERIAL_NO_FK FOREIGN KEY (pp_serial_no) REFERENCES PRODUCT(p_serial_no),
                            CONSTRAINT PRODUCT_PAGE_EMPLOYEE_NO_FK FOREIGN KEY (pp_employee_no) REFERENCES MANAGER(m_employee_no));
CREATE SEQUENCE PRODUCT_PAGE_SEQ;
    
CREATE TABLE COMMENTS(c_created DATE,
                      c_state NUMBER(1) CONSTRAINT COMMENTS_STATE_NN NOT NULL,
                      C_employee_no NUMBER(10),
                      c_bd_no NUMBER(4),
                      c_comment VARCHAR(200),
                      CONSTRAINT COMMENTS_EMPLOYEE_NO_FK FOREIGN KEY (c_employee_no) REFERENCES MANAGER(m_employee_no),
                      CONSTRAINT COMMENTS_BD_NO_FK FOREIGN KEY (c_bd_no) REFERENCES BOARDER(bd_no)); 
DESC COMMENTS; 

SELECT * FROM TABS;

-- manager demo
DESC MANAGER;
INSERT INTO MANAGER VALUES(2020010101, '123456', '이택수', '0');
INSERT INTO MANAGER VALUES(2020010102, '123456', '전승윤', '0');
INSERT INTO MANAGER VALUES(2020010103, '123456', '김희연', '1');
INSERT INTO MANAGER VALUES(2020010104, '123456', '김지선', '1');
COMMIT;

-- users demo
DESC USERS;
INSERT INTO USERS VALUES('aaaaaaa', '1234', '홍길동', '1992-01-05', '서울시 강남구 테헤란로 111-11;', '010-9999-9999', 'gd@naver.com', SYSDATE, 1);
INSERT INTO USERS VALUES('bbbbbbb', '1234', '임꺽정', '1996-12-21', '서울시 서초구 서초동 299;', '010-1111-5555', 'rjrwjd@naver.com', SYSDATE, 1);
INSERT INTO USERS VALUES('ccccccc', '1234', '장길산', '1990-05-05', '서울시 용산구 어딘가 123;', '010-3426-2222', 'rlftks12@google.com', SYSDATE, 1);
INSERT INTO USERS VALUES('ddddddd', '1234', '전우치', '1987-08-23', '서울시 동대문구 모름 111;', '010-1337-1234', 'dncl@daum.net', SYSDATE, 1);
commit;
select * from tabs;