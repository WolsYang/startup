# README

state	1.待處理	2.進行中	3.完成  
level	1.首要	2.優先	3.可延宕	4.無DL
root	1.所有事	2.可新增	3.只能看  

任務mission  				
name:string	kind:string	content:text	state:integer	level:integer	end_date:integer	supervisor:string  

使用者user  					
names:tring	email:string	root:integer  					

工作管理work  
misson_id:string	user_id:string  

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...