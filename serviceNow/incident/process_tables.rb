require 'json'
@log.info("Starting flintbit process_data.rb")

data = @input.get("result")
      # @log.info("Data #{data}")
        post_data = {}
 	data.each do |post_data|  
        @log.info("#{post_data}")
        @output.set("data", post_data)
        end
       
@log.info("End")
