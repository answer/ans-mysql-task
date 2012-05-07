ans-mysql-task
==============

mysql タスクを提供する


	class MysqlTask
	  include Ans::Mysql::Task::Builder
	
	  def database_prefix
	    "myapp"
	  end
	
	  def production_suffixes
	    ["", "Rstaging"]
	  end
	  def test_suffixes
	    (ENV["TEST_ENV_LIMIT"] || 4).times.map{|i| "T#{ENV["RAILS_DEVEL_NAME"]}#{i+1 if i > 0}"}
	  end
	  def devel_suffixes
	    ["D#{ENV["RAILS_DEVEL_NAME"]}"]
	  end
	end
	
	MysqlTask.new.build_mysql_tasks


タスク
------

### user

	rake user
	rake user MODE=devel # 開発用 (デフォルト)
	rake user MODE=test # テスト用
	rake user MODE=production # 本番用

	rake mysql:user DELETE=true # grant ではなく drop user を echo する

grant 文を echo する


### database

	rake database
	rake database MODE=devel # 開発用 (デフォルト)
	rake database MODE=test # テスト用
	rake database MODE=production # 本番用

	rake database DELETE=true # create ではなく drop を echo する

create database 文を echo する

設定
----

### production_suffixes, test_suffixes, devel_suffixes

各 MODE で使用される DB の接尾辞

