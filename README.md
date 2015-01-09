ans-mysql-task
==============

mysql タスクを提供する

install
-------

lib/tasks/mysql.rake 等に以下のファイルを設置する

```ruby
class MysqlTask
  include Ans::Mysql::Task::Builder

  def database_prefix
    "myapp"
  end
end

namespace :mysql do
  MysqlTask.new.build_mysql_tasks
end
```


タスク
------

### user

	rake mysql:user
	rake mysql:user MODE=devel # 開発用 (デフォルト)
	rake mysql:user MODE=test # テスト用
	rake mysql:user MODE=production # 本番用

	rake mysql:user DELETE=true # grant ではなく drop user を echo する

grant 文を echo する


### database

	rake mysql:database
	rake mysql:database MODE=devel # 開発用 (デフォルト)
	rake mysql:database MODE=test # テスト用
	rake mysql:database MODE=production # 本番用

	rake mysql:database DELETE=true # create ではなく drop を echo する

create database 文を echo する

設定
----

オーバーライド可能なメソッドとデフォルト

	class MysqlTask
	  include Ans::Mysql::Task::Builder
	
	  def database_prefix
	    # データベース名(必須)
	    "myapp"
	  end
	
	  def production_suffixes
	    # production 用データベースの接尾辞
	    ["", "Rstaging"]
	  end
	  def test_suffixes
	    # test 用データベースの接尾辞
	    (ENV["TEST_ENV_LIMIT"] || 4).times.map{|i| "T#{ENV["RAILS_DEVEL_NAME"]}#{i+1 if i > 0}"}
	  end
	  def devel_suffixes
	    # development 用データベースの接尾辞
	    ["D#{ENV["RAILS_DEVEL_NAME"]}"]
	  end
	end
	
	MysqlTask.new.build_mysql_tasks

