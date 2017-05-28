# Social-Network
A project to implement social network mainly through MySQL.

## Database Introduction
- Database: working
- Username: admin
- Password: 1234567890

There exist 5 tables now.

- User - deal with signing up \& in
	- EMAIL CHAR(30) PRIMARY KEY: identify users in registration and log-in
  - USERNAME CHAR(20): nickname, which can be edited after registration
  - PASSWD CHAR(20): password to validate a user

- Friends - record friend relationships
	- NUMBER INT AUTO_INCREMENT PRIMARY KEY: auto-increment primary key for identification
	- EMAIL CHAR(30): follower's email
	- EMAIL2 CHAR(30): followee's email

- Status - store posted statuses
	- STATUSNUM INT AUTO_INCREMENT PRIMARY KEY: auto-increment primary key for identification
	- EMAIL CHAR(30): poster's email
	- CONTENT VARCHAR(255): posted contents
	- TIME CHAR(25): posting time

- Reply - store posted replies to status
	- REPLYNUM INT AUTO_INCREMENT PRIMARY KEY: auto-increment primary key for identification
	- STATUSNUM INT: replied status number
	- REPLY VARCHAR(255): reply contents
	- EMAIL CHAR(30): replier's email
	- TIME CHAR(25): replying time
	- EMAIL2 CHAR(30): repliee's email

- UserDetail - store user details
	- EMAIL CHAR(30) PRIMARY KEY FOREIGN KEY REFERENCES User(EMAIL): primary & foreign key pointing to User.Email
	- SEX CHAR(3): user's sex
	- YEAR INT: user's year of birth
	- MONTH INT: user's month of birth
	- DAY INT: user's day of birth
	- INTRODUCTION VARCHAR(255): simple introduction to the user
	- ICON VARCHAR(255): user's avatar
