require 'json'

@log.info("Starting flintbit process_data.rb")
data = @input.get("result")
    #   @log.info("Data #{data}")
        post_data = {}
 	data.each do |data|       
         
        if !data["assignment_group"].nil?
	post_data["assignment_group"] = data["assignment_group"]["display_value"]
	end
        if !data["assigned_to"].nil?
	post_data["assigned_to"] = data["assigned_to"]["display_value"]
        end
        if !data["caller_id"].nil?
        post_data["caller_id"] = data["caller_id"]["display_value"]
        end
        post_data["priority"] = data["priority"]
        post_data["short_description"] = data["short_description"]
	post_data["closed_at"] = data["closed_at"]
	post_data["sys_updated_on"] = data["sys_updated_on"]
	post_data["sys_id"] = data["sys_id"]
	post_data["number"] = data["number"]
	post_data["sys_updated_by"] = data["sys_updated_by"]
	post_data["incident_state"] = data["incident_state"]
	post_data["correlation_id"] = data["correlation_id"]
	post_data["category"] = data["category"] 
        post_data["comments"]= data["comments"]

       
      
=begin

	post_data["assignment_group"] = data["assignment_group"]["display_value"]
	post_data["assigned_to"] = data["assigned_to"]["display_value"]
	post_data["caller_id"] = data["caller_id"]["display_value"]
	post_data["short_description"] = data["short_description"]
	post_data["closed_at"] = data["closed_at"]
	post_data["sys_updated_on"] = data["sys_updated_on"]
	post_data["priority"] = data["priority"]
	post_data["sys_id"] = data["sys_id"]
	post_data["number"] = data["number"]
	post_data["sys_updated_by"] = data["sys_updated_by"]
	post_data["incident_state"] = data["incident_state"]
	post_data["correlation_id"] = data["correlation_id"]
	post_data["category"] = data["category"]
=end
        
	@log.info("#{post_data}")
        @output.set("data", post_data)
        
      # @call.bit("logictest:Servicenowurl.rb.rb").set('connector_name', 'http').set('body',post_data).sync 
end
@log.info("End")
