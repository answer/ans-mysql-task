# -*- coding: utf-8 -*-

module Ans::Mysql::Task::Builder
  include Rake::DSL if defined? Rake::DSL

  def build_mysql_tasks
    [
      [:user, "grant 文を echo"],
      [:database, "create table 文を echo"],
    ].each do |task_name,description|
      desc description
      task task_name do
        send task_name
      end
    end
  end

  private

  def user
    require "yaml"

    yml = YAML.load_file "config/database.yml"

    prefix = database_prefix
    is_delete = ENV["DELETE"]

    env, suffixes = env_suffixes
    puts "-- #{env} user"

    suffixes.each do |suffix|
      db = "#{prefix}#{suffix}"
      password = yml[env]["password"]

      if is_delete
        puts "DROP USER `#{db}`@localhost;"
      else
        puts "GRANT ALL PRIVILEGES ON `#{db}`.* TO `#{db}`@localhost IDENTIFIED BY '#{password}';"
      end
    end
  end

  def database
    prefix = database_prefix
    is_delete = ENV["DELETE"]

    env, suffixes = env_suffixes
    puts "-- #{env} database"

    suffixes.each do |suffix|
      db = "#{prefix}#{suffix}"

      if is_delete
        puts "DROP DATABASE `#{db}`;"
      else
        puts "CREATE DATABASE `#{db}`;"
      end
    end
  end

  def database_prefix
    "myapp"
  end

  def env_suffixes
    case mode = ENV["MODE"]
    when "production", "test"
      [mode, send(:"#{mode}_suffixes")]
    else
      ["development", devel_suffixes]
    end
  end

  def production_suffixes
    ["", "Rstaging"]
  end
  def test_suffixes
    (ENV["TEST_ENV_LIMIT"] || 4).to_i.times.map{|i| "T#{ENV["RAILS_DEVEL_NAME"]}#{i+1 if i > 0}"}
  end
  def devel_suffixes
    ["D#{ENV["RAILS_DEVEL_NAME"]}"]
  end

end
