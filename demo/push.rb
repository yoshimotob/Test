# Simple demonstration of pushing a new task to Vineyard
require 'vineyard'
require './my_task.rb'

task = MyTask.new
task.priority = 2
task.denominator = 100
task.init_data = {'my_param' => "I'm a simple demo task!"}

# In the real world you would use a resource agreed upon by your team, depending on your task requirements,
# instead of :my_demo_resource 
Q = Vineyard::Queue.new(:my_demo_resource, {:host => "task07", :port => 8081, :debug => false})

id = Q.push(task)
puts "Pushed new task, id: #{id}"
