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
insert into Tag(name) VALUES ('长毛'),('短毛'),('黑色'),('棕色');


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
insert into Category(name) VALUES ('猫')
  ,('狗');
drop table Pet;
-- 宠物表
create table Pet (
  id        INT PRIMARY KEY AUTO_INCREMENT,
  category  INT REFERENCES Category (id),
  name      VARCHAR(20),
  photoUrls VARCHAR(400),
  tags      INT REFERENCES Tag (id),
  status    VARCHAR(10)
);
INSERT INTO Pet(category, name, photoUrls, tags, status)
VALUES (1,'苏格兰折耳猫','https://b-ssl.duitang.com/uploads/item/201505/09/20150509104027_NryCc.thumb.700_0.jpeg',
        1,'正常');

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


/*product()
主键
ID
产品名称
类型（外键）
价格
库存
产品质量（外键）
套餐（有默认值）
版本（有默认值）
颜色+图片（有默认值）
详情
评价

版本表（id、版本名称、内存、价格、产品ID）
套餐表（id、套餐名称、价格、产品ID）
图片表（id、颜色、图片地址名称，产品ID）

如果删除某个产品则多表连接删除即可。*/
