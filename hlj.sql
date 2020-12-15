/*婚礼纪数据库*/
SET  NAMES UTF8;
DROP DATABASE IF EXISTS hlj;
CREATE DATABASE hlj CHARSET=UTF8;
USE hlj;

/*网站基本信息表*/
CREATE TABLE basicInfo(
    logoUrl VARCHAR(32),            /*LOGO图片路径*/
    siteName VARCHAR(32),           /*网站名称*/
    adminMail VARCHAR(64),          /*管理员邮箱*/
    hotlinePhone VARCHAR(19),       /*客服电话*/
    companyAddress VARCHAR(128),    /*公司地址*/
    companyName VARCHAR(64),        /*公司名称*/
    icp VARCHAR(64)                 /*ICP备号案*/ 
);

/*网站基本信息表*/
INSERT INTO basicInfo VALUES('images/logo.png','婚礼纪','hlj@126.com','客服热线：400-159-9090','通讯地址：浙江省杭州市西湖区文一西路98号数娱大厦408','浙ICP备13004478号 © 杭州火烧云科技有限公司','浙公安备案号：33010602006591');

/*个人信息表*/

CREATE TABLE personalInformation(
	pid INT PRIMARY KEY AUTO_INCREMENT,								/*用户编号*/
	nickname VARCHAR(32),											/*名号*/
	uname VARCHAR(32),												/*用户名ʽ*/
	upwd VARCHAR(32),												/*密码*/
	phone VARCHAR(11),												/*电话*/
	sex VARCHAR(1) NOT NULL DEFAULT '',								/*性别 男-1 女-0 保密-2*/
	liveInCity VARCHAR(64) NOT NULL DEFAULT '',						/*居住地*/
	dateOfBirth VARCHAR(64) NOT NULL DEFAULT '',					/*出生日期*/
	personalProfile VARCHAR(500) NOT NULL DEFAULT '',				/*个人简介*/
	shippingAddress VARCHAR(300) NOT NULL DEFAULT '',				/*收货地址ַ*/
	avatar 	VARCHAR(100) NOT NULL DEFAULT '',						/*头像*/
	fans VARCHAR (64) NOT NULL DEFAULT '',							/*粉丝*/
	focusOn	VARCHAR(64),											/*关注*/
	honery VARCHAR(64)												/*蜂蜜*/
);

/*个人信息表*/
INSERT INTO personalInformation VALUES('1','小可爱','liangliang@tedu.cn','123456789','13345678910','1','陕西省西安市长安大道666号','1990-01-03','喜欢运动,热爱大自然,喜欢交朋友','陕西省西安市长安大道666号','images/user.png','999','999','999');

/*婚车租赁-精选套餐轮播广告表---详情页*/

CREATE TABLE carousel(
    cid INT PRIMARY KEY AUTO_INCREMENT,		 /*广告编号*/
    picUrl VARCHAR(128),			         /*图片地址*/
    href VARCHAR(128),				         /*引用地址*/
    title VARCHAR(128),				         /*说明文字*/
    price VARCHAR(32),                       /*车辆价格*/
    marketPrice VARCHAR(64),                 /*市场价格*/
    headCarModel VARCHAR(64),                /*头车车型*/
    withCarModel VARCHAR(32),                /*跟车车型*/
    color VARCHAR(16),                       /*颜色*/
    serviceTime VARCHAR(32),                 /*使用时间*/    
    serviceKm VARCHAR(32),                   /*使用公里*/ 
    businessDescription VARCHAR(128)         /*商家描述*/   
);

/*婚车租赁-精选套餐轮播广告表---详情页*/

INSERT INTO carousel VALUES
(1,'carousel-images/banner1.jpg','course_detail.html?cid=9','4600.00','5750.00','【奔驰】迈巴赫奔驰/1辆 + 【奔驰】E系*1辆','【奔驰】迈巴赫奔驰/1辆','【奔驰】E系','黑色','8小时','80公里','【费用包含】司机、油费、清洗费、保养费（交通违规由司机负责）【费用不含】过路费、过桥费、停车费、装饰费【其他费用】超时费、超公里费'),
(2,'carousel-images/banner2.jpg','course_detail.html?cid=9','【宾利】飞驰/1辆     + 【奔驰】 S系/4辆 or 【宝马】7系/4辆 or 【奥迪】A8L/4辆','7188.00','12500.00','【宾利】飞驰/1辆','【奥迪】A8L 【宝马】7系 【奔驰】S系','黑色','8小时','80公里','【宾利】飞驰 - 黑色【奔驰】 S系 - 黑色【宝马】7系【奥迪】A6L【费用包含】司机、油费、清洗费、保养费（交通违规由司机负责）【费用不含】过路费、过桥费、停车费、装饰费【其他费用】超时费、超公里费'),
(3,'carousel-images/banner3.jpg','course_detail.html?cid=9','【宾利】飞驰/1辆 + 【宝马】5系/4辆 or 【奥迪】A6L/4辆or 【奔驰】E系','5388.00 ~ 5999.00','7000.00','【宾利】飞驰/1辆 ','【奥迪】A6L 【宝马】5系','黑色','8小时','80公里','【费用包含】司机、油费、清洗费、保养费（交通违规由司机负责）【费用不含】过路费、过桥费、停车费、装饰费【其他费用】超时费、超公里费'),
(4,'carousel-images/banner4.jpg','course_detail.html?cid=9','【宾利】飞驰/1辆 + 【宝马】5系/4辆 or 【奥迪】A6L/4辆or 【奔驰】E系','5388.00 ~ 5999.00','7000.00','【宾利】飞驰/1辆 ','【奥迪】A6L 【宝马】5系','黑色','8小时','80公里','【费用包含】司机、油费、清洗费、保养费（交通违规由司机负责）【费用不含】过路费、过桥费、停车费、装饰费【其他费用】超时费、超公里费'),
(5,'carousel-images/banner5.jpg','course_detail.html?cid=9','【宾利】飞驰/1辆 + 【宝马】5系/4辆 or 【奥迪】A6L/4辆or 【奔驰】E系','5388.00 ~ 5999.00','7000.00','【宾利】飞驰/1辆 ','【奥迪】A6L 【宝马】5系','黑色','8小时','80公里','【费用包含】司机、油费、清洗费、保养费（交通违规由司机负责）【费用不含】过路费、过桥费、停车费、装饰费【其他费用】超时费、超公里费'),
(6,'carousel-images/banner6.jpg','course_detail.html?cid=9','【宾利】飞驰/1辆 + 【宝马】5系/4辆 or 【奥迪】A6L/4辆or 【奔驰】E系','5388.00 ~ 5999.00','7000.00','【宾利】飞驰/1辆 ','【奥迪】A6L 【宝马】5系','黑色','8小时','80公里','【费用包含】司机、油费、清洗费、保养费（交通违规由司机负责）【费用不含】过路费、过桥费、停车费、装饰费【其他费用】超时费、超公里费'),
(7,'carousel-images/banner7.jpg','course_detail.html?cid=9','【宾利】飞驰/1辆 + 【宝马】5系/4辆 or 【奥迪】A6L/4辆or 【奔驰】E系','5388.00 ~ 5999.00','7000.00','【宾利】飞驰/1辆 ','【奥迪】A6L 【宝马】5系','黑色','8小时','80公里','【费用包含】司机、油费、清洗费、保养费（交通违规由司机负责）【费用不含】过路费、过桥费、停车费、装饰费【其他费用】超时费、超公里费'),
(8,'carousel-images/banner8.jpg','course_detail.html?cid=9','【宾利】飞驰/1辆 + 【宝马】5系/4辆 or 【奥迪】A6L/4辆or 【奔驰】E系','5388.00 ~ 5999.00','7000.00','【宾利】飞驰/1辆 ','【奥迪】A6L 【宝马】5系','黑色','8小时','80公里','【费用包含】司机、油费、清洗费、保养费（交通违规由司机负责）【费用不含】过路费、过桥费、停车费、装饰费【其他费用】超时费、超公里费'),
(9,'carousel-images/banner9.jpg','course_detail.html?cid=9','【宾利】飞驰/1辆 + 【宝马】5系/4辆 or 【奥迪】A6L/4辆or 【奔驰】E系','5388.00 ~ 5999.00','7000.00','【宾利】飞驰/1辆 ','【奥迪】A6L 【宝马】5系','黑色','8小时','80公里','【费用包含】司机、油费、清洗费、保养费（交通违规由司机负责）【费用不含】过路费、过桥费、停车费、装饰费【其他费用】超时费、超公里费'),
(10,'carousel-images/banner10.jpg','course_detail.html?cid=9','【宾利】飞驰/1辆 + 【宝马】5系/4辆 or 【奥迪】A6L/4辆or 【奔驰】E系','5388.00 ~ 5999.00','7000.00','【宾利】飞驰/1辆 ','【奥迪】A6L 【宝马】5系','黑色','8小时','80公里','【费用包含】司机、油费、清洗费、保养费（交通违规由司机负责）【费用不含】过路费、过桥费、停车费、装饰费【其他费用】超时费、超公里费'),
(11,'carousel-images/banner11.jpg','course_detail.html?cid=9','【宾利】飞驰/1辆 + 【宝马】5系/4辆 or 【奥迪】A6L/4辆or 【奔驰】E系','5388.00 ~ 5999.00','7000.00','【宾利】飞驰/1辆 ','【奥迪】A6L 【宝马】5系','黑色','8小时','80公里','【费用包含】司机、油费、清洗费、保养费（交通违规由司机负责）【费用不含】过路费、过桥费、停车费、装饰费【其他费用】超时费、超公里费'),
(12,'carousel-images/banner12.jpg','course_detail.html?cid=9','【宾利】飞驰/1辆 + 【宝马】5系/4辆 or 【奥迪】A6L/4辆or 【奔驰】E系','5388.00 ~ 5999.00','7000.00','【宾利】飞驰/1辆 ','【奥迪】A6L 【宝马】5系','黑色','8小时','80公里','【费用包含】司机、油费、清洗费、保养费（交通违规由司机负责）【费用不含】过路费、过桥费、停车费、装饰费【其他费用】超时费、超公里费');

/*婚车租赁-个性自选表*/
CREATE TABLE personalitySelection(
    pid INT PRIMARY KEY AUTO_INCREMENT,  /*商品编号*/
    prcUrl VARCHAR(128),                 /*图片地址*/
    title VARCHAR(64),                   /*商品标题*/
    price VARCHAR(32),                    /*商品价格*/
    marketPrice VARCHAR(32)              /*市场价格*/
);

INSERT INTO personalitySelection VALUES
(1,'header-images/1.jpg','【劳斯莱斯】库里南/1辆 ','25000.00','¥40000.00'),
(2,'header-images/2.jpg','【宾利】飞驰 ','3850.00','¥5000.00'),
(3,'header-images/3.jpg','【玛莎拉蒂】总裁Quattroporte ','2200.00','¥4230.00'),
(4,'header-images/4.jpg','【宝马】七系 ','2000.00','¥1300.00'),
(5,'header-images/5.jpg','【奔驰】S600 ','1800.00','¥2300.00'),
(6,'header-images/6.jpg','【奔驰】奔驰S400 ','1100.00','¥1800.00'),
(7,'header-images/7.jpg','【奔驰】SLS (两座敞篷) ','3880.00','¥6880.00'),
(8,'header-images/8.jpg','【奔驰】SLK (两座敞篷) ','1500.00','¥2300.00'),
(9,'header-images/9.jpg','【奔驰】SL (两座敞篷)','2750.00','¥3300.00'),
(10,'header-images/10.jpg','【奔驰】S350 ','1800.00','¥2500.00'),
(11,'header-images/11.jpg','【保时捷】帕拉梅拉Panamera','1800.00','¥2500.00'),
(12,'header-images/12.jpg','【保时捷】博克斯特Boxster（两座敞篷）','1800.00','¥2300.00'),
(13,'header-images/13.jpg','【玛莎拉蒂】吉博力','1680.00','¥2200.00'),
(14,'header-images/14.jpg','【奥迪】A6L ','500.00','¥750.00'),
(15,'header-images/15.jpg','【宝马】5系 ','600.00','¥1000.00'),
(16,'header-images/16.jpg','【法拉利】F430（两座敞篷）','4950.00','¥6500.00'),
(17,'header-images/17.jpg','【法拉利】FF ','4950.00','¥6600.00'),
(18,'header-images/18.jpg','【法拉利】F430（两座敞篷）','6000.00','¥9000.00'),
(19,'header-images/19.jpg','【限时秒杀】劳斯莱斯-古斯特','6000.00','¥8500.00'),
(20,'header-images/20.jpg','【限时秒杀】劳斯莱斯-幻影','8250.00','¥11000.00'),
(21,'header-images/21.jpg','【林肯】加长9m','1760.00','¥2800.00'),
(22,'header-images/22.jpg','【别克】GL8','600.00','¥700.00'),
(23,'header-images/23.jpg','【悍马】H3加长11m','5000.00','¥6000.00'),
(24,'header-images/24.jpg','【奥迪】A5（敞篷）','1380.00','¥26530.00')

/*婚戒首饰商品详情表---分页查询---待定*/