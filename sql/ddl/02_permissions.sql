
ALTER SESSION SET CONTAINER = ORCLPDB1;

GRANT CONNECT TO sfo CONTAINER=CURRENT;
GRANT CREATE SESSION TO sfo CONTAINER=CURRENT;
GRANT RESOURCE TO sfo CONTAINER=CURRENT;

GRANT SELECT_CATALOG_ROLE TO sfo CONTAINER=CURRENT;
GRANT EXECUTE_CATALOG_ROLE TO sfo CONTAINER=CURRENT;

GRANT SELECT_CATALOG_ROLE TO sfo CONTAINER=CURRENT;

ALTER USER sfo QUOTA 5000M ON USERS;
