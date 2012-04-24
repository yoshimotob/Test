require "rubygems"
require "bundler/setup"



class LogDemoTask < Vineyard::Task

    def do_work
      puts "LogDemoTask [develop]: this is a puts line. STARTING..."

      log << "LogDemoTask [develop]: this is a log line"
      heartbeat

      warn "LogDemoTask: this is a warn line"

      10.times do |i|
        sleep 3
        log << "LogDemoTask v14[develop]: log loop # #{i}"
        heartbeat
      end

      puts "LogDemoTask: this is another puts line. DONE."
    end
end


class CreateSampleFileTask < Vineyard::Task
   def do_work
     puts "Start create sample file"
     # Call hitman
     suspend
   end

   def resume_work
     puts "Sample file created"
     task = DownloadSampleFileTask.new
     id = Q.push(task)
   end

end

class DownloadSampleFileTask < Vineyard::Task
   def do_work
     puts "Start download sample file"
     # Call hitman
     suspend
   end

   def resume_work
     puts "Sample file downloaded"
     task = ImportSampleFileTask.new
     id = Q.push(task)
   end

end

class ImportSampleFileTask < Vineyard::Task
   def do_work
     puts "Start sample file import"
     # Call hitman
     suspend
   end

   def resume_work
     puts "Sample file imported"
     task = LaunchHitJobTask.new
     id = Q.push(task)
   end

end

class LaunchHitJobTask < Vineyard::Task
   def do_work
     puts "Start launch hit job"
     # Call hitman
     suspend
   end

   def resume_work
     puts "Hit job finished"
   end

end
