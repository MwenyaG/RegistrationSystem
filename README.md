# Software Verification and Validation Assignment 2

## 1. Chosen Environment
a. application type: Java Web Application

b. languages: java, javascript, html, css

## 2. Functional Specification

a. Sign up

field 1: username, it must be unique

field 2: password, it must be of length of 9, including 4 digits, 4 alphabets, 1 special symbol 

field 3: password repeated, it must be the same as field 2

system behaviour:

using js to check field 2 and 3 (actually for field 1, there can also be some rules)
, all of them actually be checked by browser(front-end)

only when all the fields satisfy the needs, user can click the "register button". 
if username not exists, successfully signed up, automatically logged in, and it will be redirected to main homepage; 
if username already exists, send a dialog message to notify user.
It's done by the back-end.

b. Log in

user can log in with existing account.


## 3. Database Design

mysql version: 8.0.22


DROP TABLE IF EXISTS `users`;

CREATE TABLE `users`(
`uid` CHAR(36) DEFAULT(UUID()) NOT NULL,
`username` VARCHAR(20) NOT NULL,
`password` VARCHAR(32) NOT NULL,
`firstname` VARCHAR(16) NOT NULL,
`lastname` VARCHAR(16) NOT NULL,
PRIMARY KEY (uid)
);

INSERT INTO `users` (`username`, `password`, `firstname`,`lastname`) VALUES ('kouqinx_x', MD5('1234qwer?'),'KOUQIN','XIONG');

SELECT * FROM `users`;



username, password, driver, url us stored in the "mysql.properties"


# 4. Server Version
Tomcat 8.5.78