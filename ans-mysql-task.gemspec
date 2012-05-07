# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "ans-mysql-task/version"

Gem::Specification.new do |s|
  s.name        = "ans-mysql-task"
  s.version     = Ans::Mysql::Task::VERSION
  s.authors     = ["sakai shunsuke"]
  s.email       = ["sakai@ans-web.co.jp"]
  s.homepage    = "https://github.com/answer/ans-mysql-task"
  s.summary     = %q{mysql タスクを提供する}
  s.description = %q{ユーザー作成、データベース作成の sql を echo する}

  s.rubyforge_project = "ans-mysql-task"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
  # s.add_runtime_dependency "rest-client"
  s.add_development_dependency "ans-releaser"
end
