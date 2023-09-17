
ALTER SESSION SET CONTAINER = ORCLPDB1;

ALTER SESSION SET CURRENT_SCHEMA = sfo;


CREATE TABLE item (
  id         NUMBER(8) CONSTRAINT nc_item_id NOT NULL,
  CONSTRAINT pk_item   PRIMARY KEY (id),
);

BEGIN
  -- insert 6xxxxxx rows first
  INSERT INTO item (id)
       SELECT (6 *  1000000 + level)      AS id
      CONNECT BY LEVEL <= 1000000;
  COMMIT;
  -- insert 1xxxxxx to 5xxxxxx rows first
  FOR i IN 1..5 LOOP
    INSERT INTO item (id)
         SELECT (i *  1000000 + level)      AS id
        CONNECT BY LEVEL <= 1000000;
    COMMIT;
  END LOOP;
  -- insert 7xxxxxx to 9xxxxxx rows first
  FOR i IN 7..9 LOOP
    INSERT INTO item (id)
         SELECT (i *  1000000 + level)      AS id
        CONNECT BY LEVEL <= 1000000;
    COMMIT;
  END LOOP;
END;
/

EXEC DBMS_STATS.GATHER_TABLE_STATS(ownname => 'sfo', tabname => 'item');
