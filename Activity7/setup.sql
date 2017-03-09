set echo on
connect system/qwe  

--Create PHP Application User
drop user RuedaJj cascade;
create user RuedaJj identified by Yown;
grant connect, resource to RuedaJj; 
alter user RuedaJj default tablespace users
temporary tablespace temp account unlock;

--Create user owner security information about the app

drop user php_sec_admin cascade; 
create user php_sec_admin identified by Yown;
alter user php_sec_admin default tablespace system
temporary tablespace temp account unlock;
grant create procedure,create session,create table,
resource,select any dictionary to php_sec_admin;

connect RuedaJj/Yown

--"Parts" table for the application demo
--Table for The Application

create table users  
(User_id number primary key, 
username varchar2(20),
password varchar2(20),
firstname varchar2(20),
middlename varchar2(20),
lastname varchar2(20),
email varchar2(20));

create table games
(title varchar2(20),
lsit_of_tips varchar2(20),
pros_cons varchar2(20));

create table photos
(title varchar2(20),
photo_content varchar2(20));

create table songs
(List_of_songs varchar2(20),
Genre varchar2(20),
title varchar2(20));
commit;



connect php_sec_admin/Yown;


--Authentication table with the web user username & password
--A real application would NEVER store plain-text passwords
--but this code is a demo for client identifiers and not about 
--authentication.

create table php_authentication
(app_username varchar2(20) primary key, 
app_password varchar2(20) not null);

grant select on php_authentication to RuedaJj;