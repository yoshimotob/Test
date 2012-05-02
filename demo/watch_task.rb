# Does a watch on the specified task
require 'vineyard'

id = ARGV[0]
Q = Vineyard::Queue.new("dummy_res", {:host => "localhost", :port => 8080} )
Q.watch_task_id(id)
