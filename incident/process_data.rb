=begin
##########################################################################
#
#  INFIVERVE TECHNOLOGIES PTE LIMITED CONFIDENTIAL
#  __________________
# 
#  (C) INFIVERVE TECHNOLOGIES PTE LIMITED, SINGAPORE
#  All Rights Reserved.
#  Product / Project: Flint IT Automation Platform
#  NOTICE:  All information contained herein is, and remains
#  the property of INFIVERVE TECHNOLOGIES PTE LIMITED.
#  The intellectual and technical concepts contained
#  herein are proprietary to INFIVERVE TECHNOLOGIES PTE LIMITED.
#  Dissemination of this information or any form of reproduction of this material
#  is strictly forbidden unless prior written permission is obtained
#  from INFIVERVE TECHNOLOGIES PTE LIMITED, SINGAPORE.
=end

@log.info("Starting flintbit flint-snow:incident:process_data.rb")
data = @input.get("result")
      # @log.info("Data #{data}")
        post_data = {}
 	data.each do |data|       
         
        if ((!data["assignment_group"].nil?) && (!data["assignment_group"]["value"].nil?))
	post_data["assignment_group"] = data["assignment_group"]["value"]
        response = @call.bit("flint-snow:incident:list_assignmentgroup.rb").set("sys-id", post_data["assignment_group"]).sync
        if !response.nil?
        post_data["assignment_group"]=response.get("name")
        end	
        end
        if ((!data["assigned_to"].nil?) && (!data["assigned_to"]["value"].nil?))
        post_data["assigned_to"] = data["assigned_to"]["value"]
        response = @call.bit("flint-snow:incident:list_assigned_to_user.rb").set("sys-id", post_data["assigned_to"]).sync
        if !response.nil?
        post_data["assigned_to"]=response.get("name")
      	end
        end
        if ((!data["caller_id"].nil?) && (!data["caller_id"]["value"].nil?))
        post_data["caller_id"] = data["caller_id"]["value"]
        response = @call.bit("flint-snow:incident:list_caller_id.rb").set("sys-id", post_data["caller_id"]).sync
        if !response.nil?
        post_data["caller_id"]=response.get("name")
	end
        end
        post_data["priority"] = data["priority"]
        post_data["short_description"] = data["short_description"]
	post_data["closed_at"] = data["closed_at"]
	post_data["sys_updated_on"] = data["sys_updated_on"]
	post_data["sys_id"] = data["sys_id"]
	post_data["number"] = data["number"]
	post_data["sys_updated_by"] = data["sys_updated_by"]
	post_data["incident_state"] = data["incident_state"]
        post_data["state"] = data["state"]
	post_data["correlation_id"] = data["correlation_id"]
	post_data["category"] = data["category"] 
	post_data["escalation"] = data["escalation"] 
        post_data["opened_at"] = data["opened_at"]

          @log.info("#{post_data}")
          @call.bit("flint-snow:incident:servicenowurl.rb").set("connector_name", "http").set('body',post_data).sync

@log.info("End :: flint-snow:incident:process_data.rb")
      
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
	
        #@output.set("data", post_data)
        
       
end

