# Simple demo task that logs a statement, then errors out.
# Both the log statement and the error message will be
# saved to Vineyard for later viewing.
require 'vineyard'
 
class GremlinTask < Vineyard::Task
    def do_work

      # Simple log statement
      log << "do_work: starting..."
      # Must explicitly heartbeat, to flush log to Vineyard
      heartbeat

      # Task errors out with a runtime error. The error message will
      # be saved to Vineyard for later viewing.
      raise "Oh noes! Gremlins!"
      
      # This will not run:
      log << "do_work: normal finish!?"
    end
end
