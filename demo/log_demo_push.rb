# Pushes a new LoggerDemoTask to Vineyard
require 'rubygems'
require 'vineyard'
require './log_demo_task.rb'

task = LogDemoTask.new
task.impl = {:repo => "git@github.com:yoshimotob/Test.git",
             :dir => "demo"}
task.init_data = {:key1 => :val1}

Q = Vineyard::Queue.new(:my_demo_resource, {:host => "localhost", :port => 8080} )
id = Q.push(task)
puts "Pushed LogDemoTask, id: #{id}"

task.watch
