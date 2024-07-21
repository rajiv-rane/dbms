CREATE TABLE O_RollCall(id int, name varchar(100));
INSERT INTO O_RollCall (id,name) VALUES(1,'John'),(2,'Alice'),(3,'Bob');

CREATE TABLE N_RollCall(id int, name varchar(100));

DELIMITER //
CREATE PROCEDURE MergeRollCallData()
BEGIN
    DECLARE done INT default FALSE;
    DECLARE o_id INT;
    DECLARE o_name varchar(100);
    DECLARE n_count INT;

    DECLARE o_cursor CURSOR FOR 
        SELECT id,name FROM O_RollCall;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done =TRUE;
    OPEN o_cursor;
    read_loop: LOOP
        FETCH o_cursor into o_id,o_name;
        IF done THEN
            LEAVE read_loop;
        END IF;
        SELECT COUNT(*) INTO n_count from N_RollCall WHERE id=o_id;
        if n_count=0 THEN
            insert into N_RollCall(id,name) VALUES (o_id,o_name);
        END if;
    END LOOP;
    CLOSE o_cursor;
END //
DELIMITER ;

CALL MergeRollCallData();

SELECT * FROM N_RollCall;