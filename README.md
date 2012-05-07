ans-mysql-task
==============

mysql タスクを提供する


    class MysqlTask
	  include Ans::Mysql::Task::Builder
	end

	MysqlTask.build_mysql_tasks


タスク
------

* mysql:user
* mysql:database


### mysql:user

    rake mysql:user
	rake mysql:user MODE=devel # 開発用 (デフォルト)
	rake mysql:user MODE=test # テスト用
	rake mysql:user MODE=production # 本番用

grant 文を echo する


### mysql:database

    rake mysql:database
	rake mysql:database MODE=devel # 開発用 (デフォルト)
	rake mysql:database MODE=test # テスト用
	rake mysql:database MODE=production # 本番用

create database 文を echo する
