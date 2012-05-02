require 'vineyard'
 
class HadoopPut < Vineyard::Task
    def do_work
      src = init_data['src']
      dest = init_data['dest']
      puts "HadoopPut.do_work: put #{src} to #{dest}..."
      `hadoop fs -put #{src} #{dest}`
      puts "HadoopPut.do_work: Done."
    end
end


#  aaron@dev04:~$ hadoop fs -put test.txt /apps/extract/product/Longtail/input/hotels/raw_data
#aaron@dev04:~$ hadoop fs -ls /apps/extract/product/Longtail/input/hotels/raw_data
#Found 3 items
#-rw-rw-r--   3 justin extract   26011227 2011-12-20 18:10 /apps/extract/product/Longtail/input/hotels/raw_data/freetext_sample.json
#-rw-rw-r--   3 justin extract 5765035174 2012-01-23 15:57 /apps/extract/product/Longtail/input/hotels/raw_data/leafgrabber.json
#-rw-rw-r--   3 aaron  extract         13 2012-02-08 11:37 /apps/extract/product/Longtail/input/hotels/raw_data/test.txt
