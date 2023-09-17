SELECT id
  FROM item
 FETCH FIRST 10 ROWS ONLY;

-- should return 6xxxxxxx

-- Session#1 should block

SELECT 1
  FROM item
 WHERE id BETWEEN 1000000 AND 6999999
 ORDER BY id
   FOR UPDATE;

-- Session#2 should terminate first

SELECT 1
  FROM item
 WHERE id BETWEEN 4000000 AND 9999999
 ORDER BY id
   FOR UPDATE;

SELECT SW.EVENT,
       S.ROW_WAIT_OBJ#   AS object_number,
       S.ROW_WAIT_FILE#  AS relative_fno,
       S.ROW_WAIT_BLOCK# AS block_number,
       S.ROW_WAIT_ROW#   AS row_number
 FROM V$SESSION_WAIT sw
 JOIN V$SESSION S ON sw.sid = s.sid
WHERE S.username IS NOT NULL
  AND sw.event = 'enq: TX - row lock contention';

SELECT id
  FROM item
 WHERE ROWID = DBMS_ROWID.ROWID_CREATE(rowid_type    => 1,
                                       object_number => 71913,
                                       relative_fno  => 4,
                                       block_number  => 4259,
                                       row_number    => 0);
