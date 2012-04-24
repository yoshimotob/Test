require "rubygems"
require "bundler/setup"
require "vineyard"

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
