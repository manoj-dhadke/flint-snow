require 'json'
@log.info("Starting flintbit process_data.rb")

data = @input.get("result")
      # @log.info("Data #{data}")
        post_data = {}
 	data.each do |data|       
        post_data["group"] = data["group"]["display_value"] 
        post_data["user"] = data["user"]["display_value"]
        post_data["group"] = data["group"]["value"] 
        post_data["user"] = data["user"]["value"]
        post_data["sys_id"] = data["sys_id"]
        @log.info("#{post_data}")
        @output.set("data", post_data)
        end
        
@log.info("End")
