# Social-Network
A project to implement social network mainly through MySQL.

## Database Introduction
- 数据库名：working
- 数据库登录用户名：admin
- 密码：1234567890

目前有5张表

1. User表
用于处理登录和注册相关信息。属性结构：
* EMAIL CHAR(30) PRIMARY KEY 注册时填写的email地址，登录也是用这个
* USERNAME CHAR(20) 显示的用户名，登陆后可修改
* PASSWD CHAR(20) 登录密码

2. Friends表
用于记录关注关系，关系是单向的，A关注了B后A能看到B发的状态，而反向不成立。属性结构：
* NUMBER INT AUTO_INCREMENT PRIMARY KEY 用于作为该表的主键，平时用不到
* EMAIL CHAR(30) 关注者的email
* EMAIL2 CHAR(30) 被关注者的email

3. Status表
用于记录用户发的状态。属性结构：
* STATUSNUM INT AUTO_INCREMENT PRIMARY KEY 用于标识每一条具体状态的编号
* EMAIL CHAR(30) 发表状态的用户的email
* CONTENT VARCHAR(255) 状态内容
* TIME CHAR(25) 状态发布时间

4. Reply表
用于记录用户对状态或别的用户回复的回复。属性结构：
* REPLYNUM INT AUTO_INCREMENT PRIMARY KEY 用于标识每一条具体回复的编号
* STATUSNUM INT 该回复对应的状态
* REPLY VARCHAR(255) 回复内容
* EMAIL CHAR(30) 发表回复的用户的email
* TIME CHAR(25) 状态发布时间
* EMAIL2 CHAR(30) 被回复的用户的email

5. UserDetail表
用于记录用户的个人信息。属性结构：
* EMAIL CHAR(30) PRIMARY KEY 用户的email，这个属性指向User.EMAIL作为外键
* FOREIGN KEY (EMAIL) REFERENCES User(EMAIL)
* SEX CHAR(3) 用户的性别
* YEAR INT 用户出生年
* MONTH INT 用户出生月
* DAY INT 用户出生日
* INTRODUCTION VARCHAR(255) 用户的一句话简介
* ICON VARCHAR(255) 用户的头像对应的URL （头像功能暂时未上线）
