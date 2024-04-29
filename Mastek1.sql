alter session set "_ORACLE_SCRIPT" = true;
create user HJ identified by root;
Select 
username,
default_tablespace,
profile,
authentication_type
from
dba_users
where account_status = 'OPEN'
order by
username;

Grant create session to HJ;
Grant create table to HJ;
Grant create view to HJ;
Grant create any trigger to HJ;
Grant create any procedure to HJ;
Grant create sequence to HJ;
Grant create synonym to HJ;
Grant ALL PRIVILEGES to HJ;
Grant CONNECT to HJ;
Grant RESOURCE to HJ;
Grant DBA to HJ;