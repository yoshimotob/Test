# Pushes a "Gremlin Task" to Vineyard. The GremlinTask is a simple demo of
# logging and error'ing out.
require 'vineyard'
require './gremlin_task.rb'

task = GremlinTask.new

task.system = {:deps =>
                {:repo => "git@github.com:Factual/vineyard-ruby-driver.git",
                 :dir => "vineyard-ruby-driver/demo",
                 :lang => "ruby",
                 :classfiles => ["gremlin_task"]}}

id = Vineyard::Queue.new(:dev_04_root1, {:host => "task07", :port => 8080} ).push(task)

puts "Pushed Gremlin Task, id: #{id}"
