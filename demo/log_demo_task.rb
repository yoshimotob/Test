# A task that demonstrates various forms of logging
require 'vineyard'

class LogDemoTask < Vineyard::Task

    def do_work
      puts "LogDemoTask [master]: this is a puts line. STARTING..."
      #sleep 60*20
      puts "Start test 2"
      log << "LogDemoTask [master]: this is a log line"
      heartbeat

      warn "LogDemoTask: this is a warn line"

      10.times do |i|
        sleep 60
        log << "LogDemoTask v14-master: log loop # #{i}"
        heartbeat
      end

      puts "LogDemoTask: this is another puts line. DONE."
    end
end
