require 'json'

@log.info("Starting flintbit problem:process_data.rb")
data = @input.get("result")
    
        post_data = {}
 	data.each do |post_data|       
         
        if ((!post_data["assignment_group"].nil?) && (!post_data["assignment_group"]["value"].nil?))
	post_data["assignment_group"] = post_data["assignment_group"]["value"]
        response = @call.bit("flint-snow:problem:list_assignmentgroup.rb").set("sys-id", post_data["assignment_group"]).sync
        post_data["assignment_group"]=response.get("name")
        end

        if ((!post_data["assigned_to"].nil?) && (!post_data["assigned_to"]["value"].nil?))           
        post_data["assigned_to"] = post_data["assigned_to"]["value"]
        @log.info("VALUE :: #{post_data["assigned_to"]}")
        response = @call.bit("flint-snow:problem:list_assigned_to_user.rb").set("sys-id", post_data["assigned_to"]).sync
        post_data["assigned_to"]=response.get("name")
        end

        if ((!post_data["cmdb_ci"].nil?) && (!post_data["cmdb_ci"]["value"].nil?))
        post_data["cmdb_ci"] = post_data["cmdb_ci"]["value"]
        @log.info("VALUE CMDB_CI :: #{post_data["cmdb_ci"]}")
        response = @call.bit("flint-snow:problem:list_configuration_item.rb").set("sys-id", post_data["cmdb_ci"]).sync
        post_data["cmdb_ci"]=response.get("name")
        end

        post_data["priority"] = post_data["priority"]
        post_data["short_description"] = post_data["short_description"]
        post_data["description"] = post_data["description"]
	post_data["closed_at"] = post_data["closed_at"]
	post_data["sys_updated_on"] = post_data["sys_updated_on"]
	post_data["sys_id"] = post_data["sys_id"]
	post_data["number"] = post_data["number"]
	post_data["sys_updated_by"] = post_data["sys_updated_by"]
	post_data["incident_state"] = post_data["incident_state"]
        post_data["state"] = post_data["state"]
	post_data["correlation_id"] = post_data["correlation_id"]
	post_data["category"] = post_data["category"] 
        post_data["comments"]= post_data["comments"]
        post_data["opened_at"] = post_data["opened_at"]

        @log.info("#{post_data}")
        @output.set("data", post_data)
        
       @call.bit("flint-snow:problem:servicenowurl.rb").set('connector_name', 'http').set('body',post_data).sync 
end
@log.info("End")

       
      
=begin


=begin  if ((!data["caller_id"].nil?) && (!data["caller_id"]["value"].nil?))
        data["caller_id"] = data["caller_id"]["value"]
        response = @call.bit("service-now:problem:list_caller_id.rb").set("sys-id", data["caller_id"]).sync
        data["caller_id"]=response.get("name")
	end

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
        
	
