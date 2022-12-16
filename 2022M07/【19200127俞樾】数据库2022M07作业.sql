CREATE TABLE 图书类型
(
	图书分类号 CHAR(7) NOT NULL PRIMARY KEY,
	图书分类名称 CHAR(20) NOT NULL,
	描述信息 VARCHAR(50)	
);

CREATE TABLE 图书
(
	图书编号 CHAR(13) NOT NULL PRIMARY KEY,
	图书名称 VARCHAR(50) NOT NULL,
	图书分类号 CHAR(7) NOT NULL,
	作者 CHAR(10) NOT NULL,
	出版社 CHAR(30) ,
	价格 MONEY NOT NULL CHECK (价格 >0::MONEY),
	CONSTRAINT Book_Borrow_fkflh FOREIGN KEY(图书分类号) REFERENCES 图书类型 (图书分类号)
);

CREATE TABLE 读者
(
	证件号 CHAR(10) NOT NULL PRIMARY KEY,
	姓名 CHAR(8) NOT NULL,
	证件状态 CHAR(4) NOT NULL CHECK(证件状态 in ('可用','失效')),
	联系方式 CHAR(11)
);

CREATE TABLE 借阅
(
	证件号 CHAR(10) NOT NULL,
	图书编号 CHAR(13) NOT NULL,
	借阅日期 DATE NOT NULL,
	应还日期 DATE NOT NULL,
	归还日期 DATE,
	罚款金 MONEY NOT NULL DEFAULT 0.0 CHECK(罚款金 >=0.0::MONEY),
	CONSTRAINT Book_Borrow_pkzjsh PRIMARY KEY (证件号,图书编号,借阅日期),
	CONSTRAINT Book_Borrow_fkzjh FOREIGN KEY (证件号) REFERENCES 读者(证件号),
	CONSTRAINT Book_Borrow_fktsbh FOREIGN KEY (图书编号) REFERENCES 图书(图书编号)
);

ALTER TABLE 借阅 ALTER COLUMN 罚款金 DROP NOT NULL;
/*
ALTER TABLE 图书 ALTER COLUMN 价格 SET DEFAULT 10.00::MONEY;
ALTER TABLE 读者 ALTER COLUMN 证件状态 SET DEFAULT '可用';
ALTER TABLE 读者 DROP COLUMN 联系方式;
ALTER TABLE 读者 ADD COLUMN 电话 CHAR(12);
ALTER TABLE 图书 ALTER COLUMN 图书名称 TYPE VARCHAR(50);
ALTER TABLE 图书 ALTER COLUMN 图书名称 DROP NOT NULL;
DROP TABLE 图书类型 CASCADE;
*/
INSERT INTO 图书类型(图书分类号,图书分类名称,描述信息)
VALUES('O411','电子类-电工技术','电子类图书');
INSERT INTO 图书类型(图书分类号,图书分类名称,描述信息)
VALUES('O412','电子类-自动控制','NULL');
INSERT INTO 图书类型(图书分类号,图书分类名称,描述信息)
VALUES('TP301','电子类-家店维修','电子类的家店维修');
INSERT INTO 图书类型(图书分类号,图书分类名称,描述信息)
VALUES('TP312','计算机类-软件开发','NULL');
INSERT INTO 图书类型(图书分类号,图书分类名称,描述信息)
VALUES('TP312.7','计算机类-其他','NULL');
INSERT INTO 图书类型(图书分类号,图书分类名称,描述信息)
VALUES('TP312.8','计算机类-办公软件','NULL');
INSERT INTO 图书类型(图书分类号,图书分类名称,描述信息)
VALUES('TP316.2','计算机类-操作系统','NULL');
INSERT INTO 图书类型(图书分类号,图书分类名称,描述信息)
VALUES('TP317.2','计算机类-平面设计','NULL');
INSERT INTO 图书类型(图书分类号,图书分类名称,描述信息)
VALUES('TP392','计算机类-数据库','NULL');
INSERT INTO 图书类型(图书分类号,图书分类名称,描述信息)
VALUES('TP393','计算机类-网络技术','NULL');

INSERT INTO 图书(图书编号,图书名称,图书分类号,作者,出版社,价格)
VALUES('9787115179041','Excel高效办公——市场与销售管理','TP312.8','沈登华','机械工业出版社','49.0000');
INSERT INTO 图书(图书编号,图书名称,图书分类号,作者,出版社,价格)
VALUES('9787115179042','Excel高效办公——市场与销售管理','TP312.8','沈登华','机械工业出版社','49.0000');
INSERT INTO 图书(图书编号,图书名称,图书分类号,作者,出版社,价格)
VALUES('9787115179043','Excel高效办公——市场与销售管理','TP312.8','沈登华','机械工业出版社','49.0000');
INSERT INTO 图书(图书编号,图书名称,图书分类号,作者,出版社,价格)
VALUES('9787115219618','随身查——Office办公高手应用技巧','TP312.8','沈丽','清华大学出版社','12.8000');
INSERT INTO 图书(图书编号,图书名称,图书分类号,作者,出版社,价格)
VALUES('9787115219619','随身查——Office办公高手应用技巧','TP312.8','沈丽','清华大学出版社','12.8000');
INSERT INTO 图书(图书编号,图书名称,图书分类号,作者,出版社,价格)
VALUES('9787115220577','说服力让你的PPT会说话','TP312.7','周丹','清华大学出版社','39.0000');
INSERT INTO 图书(图书编号,图书名称,图书分类号,作者,出版社,价格)
VALUES('9787115220578','说服力让你的PPT会说话','TP312.7','周丹','清华大学出版社','39.0000');
INSERT INTO 图书(图书编号,图书名称,图书分类号,作者,出版社,价格)
VALUES('9787115221671','精通Linux设备驱动程序开发','TP316.2','陈华亭','机械工业出版社','89.0000');
INSERT INTO 图书(图书编号,图书名称,图书分类号,作者,出版社,价格)
VALUES('9787115221672','精通Linux设备驱动程序开发','TP316.2','陈华亭','机械工业出版社','89.0000');
INSERT INTO 图书(图书编号,图书名称,图书分类号,作者,出版社,价格)
VALUES('9787115221673','精通Linux设备驱动程序开发','TP316.2','陈华亭','机械工业出版社','89.0000');
INSERT INTO 图书(图书编号,图书名称,图书分类号,作者,出版社,价格)
VALUES('9787115221674','精通Linux设备驱动程序开发','TP316.2','陈华亭','机械工业出版社','89.0000');
INSERT INTO 图书(图书编号,图书名称,图书分类号,作者,出版社,价格)
VALUES('9787115222817','spss统计分析标准教程','TP312.7','江铠同','机械工业出版社','48.0000');
INSERT INTO 图书(图书编号,图书名称,图书分类号,作者,出版社,价格)
VALUES('9787115223104','Office 2003办公应用完全','TP312.8','蒋健','清华大学出版社','49.0000');
INSERT INTO 图书(图书编号,图书名称,图书分类号,作者,出版社,价格)
VALUES('9787115223883','软件测试技术(第二版)','TP312','于丹','机械工业出版社','32.0000');
INSERT INTO 图书(图书编号,图书名称,图书分类号,作者,出版社,价格)
VALUES('9787115224132','苹果Mac OS X10.6 SnowLeopard超级手册','TP316.2','陈廷飞','清华大学出版社','79.0000');
INSERT INTO 图书(图书编号,图书名称,图书分类号,作者,出版社,价格)
VALUES('9787115224262','电路基础','O411','王红','安徽科学技术出版社','24.0000');
INSERT INTO 图书(图书编号,图书名称,图书分类号,作者,出版社,价格)
VALUES('9787115224996','模拟电子技术','O412','陈晨','安徽科学技术出版社','22.0000');
INSERT INTO 图书(图书编号,图书名称,图书分类号,作者,出版社,价格)
VALUES('9787115225184','电子技术基础与技能（通信）','O411','张震','中国商务出版社','25.0000');
INSERT INTO 图书(图书编号,图书名称,图书分类号,作者,出版社,价格)
VALUES('9787115225481','Office办公软件案例教程','TP312.8','杨启申','清华大学出版社','24.5000');
INSERT INTO 图书(图书编号,图书名称,图书分类号,作者,出版社,价格)
VALUES('9787115226075','Java程序设计实例教程','TP312','渝万里','科学出版社','32.5000');
INSERT INTO 图书(图书编号,图书名称,图书分类号,作者,出版社,价格)
VALUES('9787115226334','电工基础','O412','陈忠彪','安徽科学技术出版社','24.000');
INSERT INTO 图书(图书编号,图书名称,图书分类号,作者,出版社,价格)
VALUES('9787115226662','常用工具软件','TP312.8','李大力','中国农业出版社','32.0000');
INSERT INTO 图书(图书编号,图书名称,图书分类号,作者,出版社,价格)
VALUES('9787115226845','计算机主板维修从业技能全程通','TP301','徐燕','安徽科学技术出版社','39.0000');
INSERT INTO 图书(图书编号,图书名称,图书分类号,作者,出版社,价格)
VALUES('9787115226846','计算机主板维修从业技能全程通','TP301','徐燕','安徽科学技术出版社','39.0000');
INSERT INTO 图书(图书编号,图书名称,图书分类号,作者,出版社,价格)
VALUES('9787115227430','深人Linux内核架构','TP316.2','陈登','清华大学出版社','149.0000');
INSERT INTO 图书(图书编号,图书名称,图书分类号,作者,出版社,价格)
VALUES('9787115227478','金蝶ERP-K/3培训教程','TP312.7','杨万华','清华大学出版社','59.0000');
INSERT INTO 图书(图书编号,图书名称,图书分类号,作者,出版社,价格)
VALUES('9787115227607','金蝶KIS模拟实训一财务培训教程','TP312.7','李丽莎','清华大学出版社','35.0000');
INSERT INTO 图书(图书编号,图书名称,图书分类号,作者,出版社,价格)
VALUES('9787115227874','PhotoShop CS4中文版基础','TP317.2','李丽','安徽科学技术出版社','39.0000');
INSERT INTO 图书(图书编号,图书名称,图书分类号,作者,出版社,价格)
VALUES('9787115227898','从零开始—PhotoShop CS','TP317.2','于从三','清华大学出版社','29.0000');
INSERT INTO 图书(图书编号,图书名称,图书分类号,作者,出版社,价格)
VALUES('9787115228505','3ds Max 2010中文版基础','TP312.8','刘瓦尼','安徽科学技术出版社','42.0000');
INSERT INTO 图书(图书编号,图书名称,图书分类号,作者,出版社,价格)
VALUES('9787115229946','电路分析基础','O411','李航','安徽科学技术出版社','27.0000');
INSERT INTO 图书(图书编号,图书名称,图书分类号,作者,出版社,价格)
VALUES('9787115230294','SQL Server 2008查询性能','TP392','马莎莉','安徽科学技术出版社','69.0000');
INSERT INTO 图书(图书编号,图书名称,图书分类号,作者,出版社,价格)
VALUES('9787115230805','Shell脚本专家指南','TP312','袁世华','高等教育出版社','39.0000');
INSERT INTO 图书(图书编号,图书名称,图书分类号,作者,出版社,价格)
VALUES('9787115231048','C语言从入门到精通','TP312','肖云飞','清华大学出版社','59.0000');
INSERT INTO 图书(图书编号,图书名称,图书分类号,作者,出版社,价格)
VALUES('9787115231086','大学计算机基础','TP312','崔晓雪','人民出版社','29.5000');
INSERT INTO 图书(图书编号,图书名称,图书分类号,作者,出版社,价格)
VALUES('9787115231096','编程珠玑','TP312','本特利','人民邮电出版社','21.0000');

INSERT INTO 读者(证件号,姓名,证件状态,联系方式)
VALUES('H200121001','程晓曦','可用','18909346754');
INSERT INTO 读者(证件号,姓名,证件状态,联系方式)
VALUES('H200121002','周鼎','可用','15809346721');
INSERT INTO 读者(证件号,姓名,证件状态,联系方式)
VALUES('H200121004','马晓','可用','15609346733');
INSERT INTO 读者(证件号,姓名,证件状态,联系方式)
VALUES('H200121006','王小虎','可用','15809346746');
INSERT INTO 读者(证件号,姓名,证件状态,联系方式)
VALUES('H200121009','王力','可用','13609346778');
INSERT INTO 读者(证件号,姓名,证件状态,联系方式)
VALUES('H200121010','杨华','可用','15209346790');
INSERT INTO 读者(证件号,姓名,证件状态,联系方式)
VALUES('J200902001','王浩粗','可用','13209346752');
INSERT INTO 读者(证件号,姓名,证件状态,联系方式)
VALUES('J200902002','王潮','失效','15209346757');
INSERT INTO 读者(证件号,姓名,证件状态,联系方式)
VALUES('J200902003','催定科','可用','15620934672');
INSERT INTO 读者(证件号,姓名,证件状态,联系方式)
VALUES('J200902005','李晨','失效','13209346950');
INSERT INTO 读者(证件号,姓名,证件状态,联系方式)
VALUES('J200902006','周大华','可用','13709346751');
INSERT INTO 读者(证件号,姓名,证件状态,联系方式)
VALUES('J200902007','马威','可用','13809346732');
INSERT INTO 读者(证件号,姓名,证件状态,联系方式)
VALUES('J200902008','马晓华','可用','13909346724');
INSERT INTO 读者(证件号,姓名,证件状态,联系方式)
VALUES('W200912001','崔灿','可用','13409346780');
INSERT INTO 读者(证件号,姓名,证件状态,联系方式)
VALUES('W200912002','李涵','可用','13209346759');
INSERT INTO 读者(证件号,姓名,证件状态,联系方式)
VALUES('W200912003','陈晓晨','可用','15209346712');
INSERT INTO 读者(证件号,姓名,证件状态,联系方式)
VALUES('W200912004','陈晓琪','失效','15820934670');

INSERT INTO 借阅(证件号,图书编号,借阅日期,应还日期,归还日期,罚款金)
VALUES('H200121001','9787115231096','2015/9/10','2015/10/10 ',NULL,NULL);
INSERT INTO 借阅(证件号,图书编号,借阅日期,应还日期,归还日期,罚款金)
VALUES('H200121002','9787115228505','2015/10/11','2015/11/11',NULL,NULL);
INSERT INTO 借阅(证件号,图书编号,借阅日期,应还日期,归还日期,罚款金)
VALUES('H200121004','9787115225481','2015/7/10','2015/8/10','2015/9/10','3.0000');
INSERT INTO 借阅(证件号,图书编号,借阅日期,应还日期,归还日期,罚款金)
VALUES('H200121006','9787115227898','2015/8/10','2015/9/10','2015/9/15','0.5000');
INSERT INTO 借阅(证件号,图书编号,借阅日期,应还日期,归还日期,罚款金)
VALUES('J200902001','9787115224262','2015/4/6','2015/5/6','2015/5/10','0.4000');
INSERT INTO 借阅(证件号,图书编号,借阅日期,应还日期,归还日期,罚款金)
VALUES('J200902005','9787115231086','2015/7/10','2015/8/10','2015/8/10','0.0000');
INSERT INTO 借阅(证件号,图书编号,借阅日期,应还日期,归还日期,罚款金)
VALUES('J200902006','9787115225481','2015/4/5','2015/5/5','2015/5/5','0.0000');
INSERT INTO 借阅(证件号,图书编号,借阅日期,应还日期,归还日期,罚款金)
VALUES('J200902006','9787115226334','2015/4/5','2015/5/5','2015/6/5','3.0000');
INSERT INTO 借阅(证件号,图书编号,借阅日期,应还日期,归还日期,罚款金)
VALUES('J200902006','9787115227478','2015/4/5','2015/5/5','2015/5/5','0.0000');
INSERT INTO 借阅(证件号,图书编号,借阅日期,应还日期,归还日期,罚款金)
VALUES('J200902006','9787115227898','2015/4/5','2015/5/5','2015/5/5','0.0000');
INSERT INTO 借阅(证件号,图书编号,借阅日期,应还日期,归还日期,罚款金)
VALUES('J200902006','9787115230294','2015/8/10','2015/9/10','2015/9/10','0.0000');
INSERT INTO 借阅(证件号,图书编号,借阅日期,应还日期,归还日期,罚款金)
VALUES('J200902006','9787115231048','2015/4/5','2015/5/5','2015/5/5','0.0000');
INSERT INTO 借阅(证件号,图书编号,借阅日期,应还日期,归还日期,罚款金)
VALUES('J200902006','9787115231086','2015/9/9','2015/10/9',NULL,NULL);
INSERT INTO 借阅(证件号,图书编号,借阅日期,应还日期,归还日期,罚款金)
VALUES('J200902007','9787115231048','2015/7/10','2015/8/10','2015/8/10','0.0000');
INSERT INTO 借阅(证件号,图书编号,借阅日期,应还日期,归还日期,罚款金)
VALUES('J200902007','9787115231048','2015/9/18','2015/10/18','2015/10/18 ','0.0000');
INSERT INTO 借阅(证件号,图书编号,借阅日期,应还日期,归还日期,罚款金)
VALUES('W200912002','9787115224996','2015/5/6','2015/6/6','2015/6/16','1.0000');
INSERT INTO 借阅(证件号,图书编号,借阅日期,应还日期,归还日期,罚款金)
VALUES('W200912003','9787115231096','2015/7/10','2015/8/10','2015/8/10','0.0000');
INSERT INTO 借阅(证件号,图书编号,借阅日期,应还日期,归还日期,罚款金)
VALUES('W200912004','9787115224996','2015/6/6','2015/7/6','2015/8/6','3.0000');
INSERT INTO 借阅(证件号,图书编号,借阅日期,应还日期,归还日期,罚款金)
VALUES('W200912004','9787115230805','2015/9/18','2015/10/18','2015/10/18','0.0000');
INSERT INTO 借阅(证件号,图书编号,借阅日期,应还日期,归还日期,罚款金)
VALUES('W200912004','9787115230805','2015/11/10 ','2015/11/10 ',NULL,NULL);

CREATE VIEW 计算机图书 AS 
SELECT 图书.*,图书类型.图书分类名称 FROM 图书,图书类型
WHERE 图书.图书分类号=图书类型.图书分类号 AND 图书类型.图书分类名称 LIKE '计算机%';

CREATE VIEW 读者借书情况表(读者证件号，读者姓名，图书名称，借书日期) AS
SELECT 读者.证件号,读者.姓名,图书.图书名称,借阅.借阅日期 FROM 读者,图书,借阅
WHERE 读者.证件号=借阅.证件号 AND 图书.图书编号=借阅.图书编号;

DROP VIEW 计算机图书;

CREATE INDEX Book_Borrow_Info_zjh on 借阅(证件号,借阅日期);

CREATE INDEX Book_Borrow_InfoZJH ON 图书(图书分类号);

CREATE INDEX Book_Borrow_Info_tsmc ON 图书(图书名称);

CREATE INDEX Book_Borrow_Info_cbs ON 图书(出版社);

SELECT 图书名称,出版社,价格 FROM 图书 WHERE 作者='杨万华';

SELECT 图书名称,价格 FROM 图书 WHERE 图书名称='计算机主板维修从业技能全程通';

SELECT 图书名称,COUNT(*) 总馆藏量 FROM 图书
GROUP BY 图书名称
ORDER BY 总馆藏量 DESC;

SELECT * FROM 读者,借阅
WHERE 读者.证件号 = 借阅.证件号 AND 读者.姓名 = '王小虎';

SELECT 读者.姓名,COUNT(*)借书数量 FROM 读者,借阅
WHERE 读者.证件号 = 借阅.证件号
GROUP BY 读者.姓名; 

SELECT 姓名 AS 不可借阅图书的读者,证件状态 
FROM 读者
WHERE 证件状态='失效';

SELECT 读者.证件号,读者.姓名
FROM 读者,借阅
WHERE 读者.证件号=借阅.证件号 AND 借阅.应还日期<借阅.归还日期;

SELECT 读者.证件号,读者.姓名 FROM 读者,借阅
WHERE current_date>应还日期
AND 读者.证件号=借阅.证件号 AND 借阅.归还日期 IS NULL;

SELECT COUNT(*) 借书总量 FROM 借阅 
WHERE 借阅日期<'2015-09-01'; 

UPDATE 读者
SET 证件状态='可用'
WHERE 姓名='陈晓琪';

DELETE FROM 借阅
WHERE 证件号=(SELECT 证件号 FROM 读者 WHERE 姓名='李涵');

INSERT INTO 图书(图书编号,图书名称,图书分类号,作者,出版社,价格)
VALUES('9787115231011','C++程序设计','TP301','谭浩强','清华大学出版社','24.00');

SELECT 证件号 FROM 读者 WHERE 姓名='王潮';
SELECT 图书编号 FROM 图书 WHERE 图书名称='Shell脚本专家指南';
INSERT INTO 借阅(证件号,图书编号,借阅日期,应还日期)
VALUES('J200902002','9787115230805','2015-10-13','2015-11-13');

UPDATE 借阅
SET 罚款金=0.1*(
SELECT current_date-应还日期 FROM 借阅 
WHERE 证件号='J200902002' AND 图书编号='9787115230805')
WHERE 证件号='J200902002';
SELECT * FROM "借阅";

CREATE TRIGGER INSERT_借阅 BEFORE INSERT ON 借阅
FOR EACH ROW 
EXECUTE PROCEDURE trigger_function();

CREATE FUNCTION trigger_function ()
  RETURNS trigger
AS $$
BEGIN
if(select count(*) from 读者,inserted where 读者.证件号=inserted.证件号)=0
then
	raise notice '没有该读者信息';
	rollback;
end if;
END; $$
LANGUAGE plpgsql;

CREATE TRIGGER UPDATE_借阅 BEFORE INSERT ON 借阅
FOR EACH ROW 
EXECUTE PROCEDURE trigger_function();

CREATE FUNCTION trigger_update ()
  RETURNS trigger
AS $$
BEGIN
	raise notice '不能手工修改借阅日期';
	rollback;
END; $$
LANGUAGE plpgsql;

CREATE TRIGGER _update_借阅 BEFORE UPDATE of "借阅日期"
ON 借阅
FOR EACH ROW 
EXECUTE PROCEDURE trigger_update();

CREATE FUNCTION trigger_delete ()
  RETURNS TRIGGER
AS $$
BEGIN
	DELETE FROM 借阅 
	WHERE 证件号 IN
	(SELECT 证件号 FROM DELETED);
END; $$
LANGUAGE plpgsql;

CREATE TRIGGER delete_借阅 BEFORE DELETE
ON 借阅
FOR EACH ROW 
EXECUTE PROCEDURE trigger_delete();



