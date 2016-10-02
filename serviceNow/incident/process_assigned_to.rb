require 'json'
@log.info("Starting flintbit process_data.rb")

data = @input.get("result")
      # @log.info("Data #{data}")
        post_data = {}
 	data.each do |data|       
        post_data["name"] = data["name"]
        post_data["user_name"] = data["user_name"]
        post_data["sys_id"] = data["sys_id"]
	post_data["first_name"] = data["first_name"]
	post_data["middle_name"] = data["middle_name"]
	post_data["last_name"] = data["last_name"]
	post_data["email"] = data["email"]
	post_data["company"] = data["company"]["display_value"]
	post_data["manager"] = data["manager"]["display_value"]
	post_data["location"] = data["location"]["display_value"]
        post_data["company"] = data["company"]["value"]
	post_data["manager"] = data["manager"]["value"]
	post_data["location"] = data["location"]["value"]
       
        @log.info("#{post_data}")
        @output.set("data", post_data)
        end
        
@log.info("End")
