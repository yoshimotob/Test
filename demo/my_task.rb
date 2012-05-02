require 'vineyard'
 
class MyTask < Vineyard::Task
    def do_work
      puts "MyTask is running! my_param=#{init_data['my_param']}"
    end
end