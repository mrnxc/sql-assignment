set echo on
connect system/amakal  

--Create PHP Application User
drop user RuedaJj cascade; /* Dapat kung ano ung nilagay sa may connect ganun din dito  */
create user RuedaJj identified by Yown; /* Dito din */
grant connect, resource to RuedaJj; /* Dito din */
alter user RuedaJj default tablespace users /* Dito din */
temporary tablespace temp account unlock;

--Create user owner security information about the app

drop user php_sec_admin cascade; 
create user php_sec_admin identified by Yown;
alter user php_sec_admin default tablespace system
temporary tablespace temp account unlock;
grant create procedure,create session,create table,
resource,select any dictionary to php_sec_admin;

connect RuedaJj/Yown /* Bawal may space */

--"Parts" table for the application demo
--Table for The Application

create table user  
(User_id number primary key, 
username varchar2(20), /* Dikit mo ung parenthesis sa varchar2 */
password varchar2(20),
firstname varchar2(20),
middlename varchar2(20),
lastname varchar2(20),
email varchar2(20));

create table games
(title varchar2(20),
lsit of tips varchar2(20),
pros and cons varchar2(20));

create table photos
(title varchar2(20),
photo content varchar2(20));

create table songs
(List of songs varchar2(20),
Genre varchar2(20),
title varchar2(20));
commit;
/* Dapat may commit */


connect php_sec_admin/Yown;


--Authentication table with the web user username & password
--A real application would NEVER store plain-text passwords
--but this code is a demo for client identifiers and not about 
--authentication.

create table php_authentication
(app_username varchar2(20) primary key, 
app_password varchar2(20) not null);

/*insert into php_authentication values ('mirana','tiger');
insert into php_authentication values ('luna','leopard');*/
commit;

grant select on php_authentication to phpuser;