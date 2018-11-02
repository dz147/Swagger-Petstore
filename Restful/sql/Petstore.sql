use petstoredb;
-- 用户表
create table user
(
  id int PRIMARY KEY auto_increment,
  userName VARCHAR(20) ,
  firstName VARCHAR(20),
  lastName VARCHAR(20),
  email VARCHAR(30),
  password VARCHAR(30),
  phone VARCHAR(20),
  userState int
);
insert into user VALUES (0,'张东明','张','东明','1920098158@qq.com','123321','15768812168',1);

-- 标签表
create table Tag
(
   id int primary key auto_increment,
   name VARCHAR(20)
);

create table ApiResponse
(
  code	int PRIMARY KEY auto_increment,
  type	VARCHAR(20),
  message	 VARCHAR(50)
);

-- 宠物类型表
create table Category
(
  id INT primary key auto_increment,
  NAME varchar(30)
);

-- 宠物表
create table Pet (
  id        INT PRIMARY KEY AUTO_INCREMENT,
  category  INT REFERENCES Category (id),
  name      VARCHAR(20),
  photoUrls VARCHAR(20),
  tags      INT REFERENCES Tag (id),
  status    VARCHAR(10)
);

-- 订单表
create table Orders
(
  id	int PRIMARY KEY AUTO_INCREMENT,
  petId	int references Pet(id),
  userId int REFERENCES user(id),
  quantity	int,
  shipDate	DATETIME ,
  status	VARCHAR(10),
  complete boolean default false
);