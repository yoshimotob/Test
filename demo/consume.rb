require 'vineyard'
require './my_task.rb'

# We're hoping the queue named :my_demo_resource has at least one task waiting to be consumed
Q = Vineyard::Queue.new(:my_demo_resource, {:host => "task07", :port => 8081, :debug => false})

task = Q.pop

if(task)
  puts "popped task with id: #{task.id}..."
  task.run
  puts "done."
else
  puts "no tasks on queue"
end
