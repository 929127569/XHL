SET NAMES UTF8;
DROP DATABASE IF EXISTS xhl;
CREATE DATABASE xhl CHARSET=UTF8;
USE xhl;  

CREATE TABLE xhl_banner(
 bid INT PRIMARY KEY AUTO_INCREMENT,
 img VARCHAR(256)
);

INSERT INTO xhl_banner VALUES(NULL,"http://localhost:3000/img/banner1.jpg"),
(NULL,"http://localhost:3000/img/banner2.jpg"),
(NULL,"http://localhost:3000/img/banner3.jpg"),
(NULL,"http://localhost:3000/img/banner4.jpg");


/**商品分类**/
CREATE TABLE xhl_product_family(
    fid INT UNIQUE,
    fname VARCHAR(32),         /**类别名称**/
    addr VARCHAR(32)
);

INSERT INTO xhl_product_family VALUES(10,'腊味生腌制品',''),
(20,'熟食卤味方便菜',''),
(30,'熟食卤味方便菜',''),
(40,'中点',''),
(50,'西点',''),
(60,'糖果休闲零食',''),
(70,'散装月饼',''),
(80,'盒装月饼',''),
(90,'其他','');


/**商品**/
CREATE TABLE xhl_product(
    pid INT PRIMARY KEY AUTO_INCREMENT,
    fid INT, #所属分类
    fname VARCHAR(32),
    isindex BOOLEAN,	#是否首页
    title VARCHAR(128), #商品主标题
    price VARCHAR(12),  #价格
    stock INT, 		#库存
    sales INT,      #已售
    img VARCHAR(255),   #展示图
    dimg text(255)   #详细图片
);


INSERT INTO xhl_product VALUES(NUll,80,'当季热卖盒装月饼',1,'精装纸盒800g',85.00,397,2100,'http://localhost:3000/img/product/8001.jpg|http://localhost:3000/img/product/8002.jpg|http://localhost:3000/img/product/8003.jpg|http://localhost:3000/img/product/8004.jpg','http://localhost:3000/img/details/8001.jpg|http://localhost:3000/img/details/8002.jpg|http://localhost:3000/img/details/8003.jpg|http://localhost:3000/img/details/8004.jpg|http://localhost:3000/img/details/8005.jpg|http://localhost:3000/img/details/8006.jpg|http://localhost:3000/img/details/8007.jpg|http://localhost:3000/img/details/8008.jpg|http://localhost:3000/img/details/8009.jpg|http://localhost:3000/img/details/8010.jpg|http://localhost:3000/img/details/8011.jpg|http://localhost:3000/img/details/8012.jpg|http://localhost:3000/img/details/8013.jpg|http://localhost:3000/img/details/8014.jpg'),
(NUll,80,'当季热卖盒装月饼',1,'嫦娥铁盒800g',95.00,4996,6384,'http://localhost:3000/img/product/8101.jpg|http://localhost:3000/img/product/8102.jpg|http://localhost:3000/img/product/8103.jpg|http://localhost:3000/img/product/8104.jpg',''),
(NUll,80,'当季热卖盒装月饼',1,'七星伴月810g',188.00,498,2327,'http://localhost:3000/img/product/8201.jpg|http://localhost:3000/img/product/8202.jpg|http://localhost:3000/img/product/8203.jpg|http://localhost:3000/img/product/8204.jpg',''),
(NUll,70,'当季热卖散装月饼',1,'豆沙月饼100g',9.00,13064,16754,'http://localhost:3000/img/product/7001.jpg|http://localhost:3000/img/product/7002.jpg|http://localhost:3000/img/product/7003.jpg',''),
(NUll,70,'当季热卖散装月饼',1,'奶油椰蓉月饼100g',9.3,17627,9402,'http://localhost:3000/img/product/7101.jpg|http://localhost:3000/img/product/7102.jpg|http://localhost:3000/img/product/7103.jpg',''),
(NUll,70,'当季热卖散装月饼',1,'莲蓉月饼100g',9.3,19180,3749,'http://localhost:3000/img/product/7201.jpg|http://localhost:3000/img/product/7202.jpg|http://localhost:3000/img/product/7203.jpg',''),
(NUll,50,'当季热卖西点',1,'盒装夹心糕300g',16,1924,874,'http://localhost:3000/img/product/5001.jpg|http://localhost:3000/img/product/5002.jpg|http://localhost:3000/img/product/5003.jpg|http://localhost:3000/img/product/5004.jpg',''),
(NUll,50,'当季热卖西点',1,'苔条饼200g',18,1837,461,'http://localhost:3000/img/product/5101.jpg|http://localhost:3000/img/product/5102.jpg|http://localhost:3000/img/product/5103.jpg|http://localhost:3000/img/product/5104.jpg',''),
(NUll,50,'当季热卖西点',1,'盒装芝麻薄脆300g',18,1846,967,'http://localhost:3000/img/product/5201.jpg|http://localhost:3000/img/product/5202.jpg|http://localhost:3000/img/product/5203.jpg|http://localhost:3000/img/product/5204.jpg',''),
(NUll,20,'当季热卖熟食卤味方便菜',1,'袋装咸鸡(半只)500g',55,3193,1480,'http://localhost:3000/img/product/2001.jpg|http://localhost:3000/img/product/2002.jpg|http://localhost:3000/img/product/2003.jpg',''),
(NUll,20,'当季热卖熟食卤味方便菜',1,'袋装熟酱鸭400g',33,3482,1421,'http://localhost:3000/img/product/2101.jpg|http://localhost:3000/img/product/2102.jpg|http://localhost:3000/img/product/2103.jpg',''),
(NUll,10,'当季热卖腊味生腌制品',1,'袋装腊肉454g',108,3137,425,'http://localhost:3000/img/product/1001.jpg|http://localhost:3000/img/product/1002.jpg|http://localhost:3000/img/product/1003.jpg|http://localhost:3000/img/product/1004.jpg|http://localhost:3000/img/product/1005.jpg|http://localhost:3000/img/product/1006.jpg',''),
(NUll,10,'当季热卖腊味生腌制品',1,'袋装香肠454g',89,1318,825,'http://localhost:3000/img/product/1101.jpg|http://localhost:3000/img/product/1102.jpg|http://localhost:3000/img/product/1103.jpg|http://localhost:3000/img/product/1104.jpg|http://localhost:3000/img/product/1105.jpg',''),
(NUll,10,'当季热卖腊味生腌制品',1,'袋装咸腿肉',89,2180,618,'http://localhost:3000/img/product/1201.jpg|http://localhost:3000/img/product/1202.jpg|http://localhost:3000/img/product/1203.jpg|http://localhost:3000/img/product/1204.jpg|http://localhost:3000/img/product/1205.jpg|http://localhost:3000/img/product/1206.jpg',''),
(NUll,60,'当季热卖糖果休闲零食',1,'香辣蛋黄锅巴',26,1008,291,'http://localhost:3000/img/product/6001.jpg|http://localhost:3000/img/product/6002.jpg|http://localhost:3000/img/product/6003.jpg|http://localhost:3000/img/product/6004.jpg','');


CREATE TABLE xhl_user(
    uid INT PRIMARY KEY AUTO_INCREMENT,
    uname VARCHAR(32) NOT NULL,
    upwd VARCHAR(32),
    email VARCHAR(64),
    phone VARCHAR(16),
    avatar VARCHAR(128),/**头像**/
    nickname VARCHAR(32),
    gender TINYINT /**0-女 1-男**/

);

INSERT INTO xhl_user VALUES(NULL,'123456789','b6ec725af316e73739dccbe8d283be59','huahua@qq.com','15999999999','','花花',0),
(NULL,'dingding','69ec9a3a8b453fbeec82c8bfb448e992','dingding@qq.com','15888888888','','丁丁',0)
;