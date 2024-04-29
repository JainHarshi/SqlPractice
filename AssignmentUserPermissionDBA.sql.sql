alter session set "_ORACLE_SCRIPT" = true;
create user assignmentUser identified by root;
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

Grant create session to assignmentUser;
Grant create table to assignmentUser;
Grant create view to assignmentUser;
Grant create any trigger to assignmentUser;
Grant create any procedure to assignmentUser;
Grant create sequence to assignmentUser;
Grant create synonym to assignmentUser;
Grant ALL PRIVILEGES to assignmentUser;
Grant CONNECT to assignmentUser;
Grant RESOURCE to assignmentUser;
Grant DBA to assignmentUser;