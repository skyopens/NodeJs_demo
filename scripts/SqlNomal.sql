图书馆 借出去了一本书，借给了谁，什么时候借的？规定什么时候还？

DROP TABLE BookExchangeLog
CREATE TABLE BookExchangeLog
(
	Id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,	-- 主键
	MemberId INT NOT NULL,	-- 会员Id
	AdminId	INT NOT NULL,	-- 柜台员Id
	BookId INT NOT NULL,	-- 书Id
	BorrowTime DATETIME NOT NULL,	-- 借出时间
	ExpiredTime DATETIME NOT NULL,	-- 最后还书时间
	IsBack BOOL NOT NULL	-- 是否归还
)

DELETE FROM book WHERE id=1

SELECT * FROM admin


SELECT * FROM BookExchangeLog	

INSERT INTO BookExchangeLog(MemberId,AdminId,BookId,BorrowTime,ExpiredTime,IsBack) VALUES(1,1,3,NOW(),DATE_ADD(NOW(),INTERVAL 30 DAY),FALSE)
INSERT INTO BookExchangeLog(MemberId,AdminId,BookId,BorrowTime,ExpiredTime,IsBack) VALUES(2,1,3,NOW(),DATE_ADD(NOW(),INTERVAL 30 DAY),FALSE)
INSERT INTO BookExchangeLog(MemberId,AdminId,BookId,BorrowTime,ExpiredTime,IsBack) VALUES(2,1,4,NOW(),DATE_ADD(NOW(),INTERVAL 30 DAY),FALSE)


SELECT a.Name 柜台员,m.Name 借书人,b.Name AS 书名,be.BorrowTime 借出时间,be.ExpiredTime 归还时间,
getStatus(be.IsBack) 状态 FROM BookExchangeLog be
LEFT JOIN member m ON be.MemberId=m.Id
LEFT JOIN admin a ON be.AdminId=a.Id
LEFT JOIN book b ON be.BookId=b.Id

DROP FUNCTION getStatus
DELIMITER $$
CREATE FUNCTION getStatus(IsBack BOOL) RETURNS VARCHAR(10) CHARACTER SET utf8 COLLATE utf8_general_ci
BEGIN
	IF IsBack = 0 THEN 
		RETURN '未归还';
	ELSE 
		RETURN '已归还';
	END IF;
END
$$
DELIMITER ;

-- 计算1 ~ 指定数据之间的和
DROP FUNCTION my_sum
DELIMITER $$
CREATE FUNCTION my_sum(X INT) RETURNS INT
BEGIN
    SET @i = 1;
    SET @sum = 0;
    WHILE @i <= X DO
        SET @sum = @sum + @i;
        SET @i = @i + 1;
    END WHILE;
    RETURN @sum;
END
$$
DELIMITER ;

SELECT * FROM book WHERE id IN (
SELECT BookId FROM BookExchangeLog WHERE isBack=0)


SELECT bookId,COUNT() FROM BookExchangeLog WHERE isBack=0 GROUP BY bookId

SELECT Author,COUNT(Id) FROM book GROUP BY Author


SELECT COUNT(*) FROM book;