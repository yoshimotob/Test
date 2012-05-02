# Pushes a new LoggerDemoTask to Vineyard
require 'rubygems'
require 'vineyard'
require './log_demo_task.rb'

task = LogDemoTask.new
task.impl = {:repo => "git@github.com:Factual/vineyard-ruby-driver.git",
             :dir => "demo"}
task.init_data = {:key1 => :val1}

Q = Vineyard::Queue.new(:dev04_root1, {:host => "task03", :port => 8086} )
id = Q.push(task)
puts "Pushed LogDemoTask, id: #{id}"

task.watch
