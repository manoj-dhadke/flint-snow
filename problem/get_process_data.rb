@log.info("Starting called flintbit problem:get_process_data.rb")
   
   data = @input.get("result")

        if ((!data["assignment_group"].nil?) && (!data["assignment_group"]["value"].nil?))
	data["assignment_group"] = data["assignment_group"]["value"]
        response = @call.bit("flint-snow:problem:list_assignmentgroup.rb").set("sys-id", data["assignment_group"]).sync
        data["assignment_group"]=response.get("name")
        #@log.info(data["assignment_group"])
        end

        if ((!data["assigned_to"].nil?) && (!data["assigned_to"]["value"].nil?))
        data["assigned_to"] = data["assigned_to"]["value"]
        #response = @call.bit("flint-snow:problem:list_assigned_to_user.rb").set("sys-id", data["assigned_to"]).sync
        #data["assigned_to"]=response.get("name")
	#@log.info(data["assignment_group"])
      	end

      	if ((!data["opened_by"].nil?) && (!data["opened_by"]["value"].nil?))
        data["opened_by"] = data["opened_by"]["value"]
        response = @call.bit("flint-snow:problem:list_opened_by.rb").set("sys-id", data["opened_by"]).sync
        data["opened_by"]=response.get("name")
 	end

      	if ((!data["location"].nil?) && (!data["location"]["value"].nil?))
        data["location"] = data["location"]["value"]
	@log.info("LOCATION ::: #{data["location"]}")
        response = @call.bit("flint-snow:problem:list_location.rb").set("sys-id", data["location"]).sync
        data["location"]=response.get("name")
      	end

	if ((!data["sys_domain"].nil?) && (!data["sys_domain"]["value"].nil?))
        data["sys_domain"] = data["sys_domain"]["value"]
	end

	if ((!data["cmdb_ci"].nil?) && (!data["cmdb_ci"]["value"].nil?))
        data["cmdb_ci"] = data["cmdb_ci"]["value"]
        response = @call.bit("flint-snow:problem:list_cmdb_ci.rb").set("sys-id", data["cmdb_ci"]).sync
        data["cmdb_ci"]=response.get("name")
	end

	if ((!data["closed_by"].nil?) && (!data["closed_by"]["value"].nil?))
        data["closed_by"] = data["closed_by"]["value"]
        response = @call.bit("flint-snow:problem:list_closed_by.rb").set("sys-id", data["closed_by"]).sync
        data["closed_by"]=response.get("name")
        end

	if ((!data["company"].nil?) && (!data["company"]["value"].nil?))
        data["company"] = data["company"]["value"]
        response = @call.bit("flint-snow:problem:list_company.rb").set("sys-id", data["company"]).sync
        data["company"]=response.get("name")
	end

	if ((!data["caller_id"].nil?) && (!data["caller_id"]["value"].nil?))
        data["caller_id"] = data["caller_id"]["value"]
        response = @call.bit("flint-snow:problem:list_caller_id.rb").set("sys-id", data["caller_id"]).sync
        data["caller_id"]=response.get("name")
	end

	if ((!data["problem_id"].nil?) && (!data["problem_id"]["value"].nil?))
        data["problem_id"] = data["problem_id"]["value"]
        response = @call.bit("flint-snow:problem:list_problem_id.rb").set("sys-id", data["problem_id"]).sync
        data["problem_id"]=response.get("name")
        end

        if ((!data["requested_by"].nil?) && (!data["requested_by"]["value"].nil?))
        data["requested_by"] = data["requested_by"]["value"]
        response = @call.bit("flint-snow:problem:list_assignmentgroup.rb").set("sys-id", data["requested_by"]).sync
        data["requested_by"]=response.get("name")
        end

        if ((!data["std_change_producer_version"].nil?) && (!data["std_change_producer_version"]["value"].nil?))
        data["std_change_producer_version"] = data["std_change_producer_version"]["value"]
        response = @call.bit("flint-snow:problem:list_assignmentgroup.rb").set("sys-id", data["std_change_producer_version"]).sync
        data["std_change_producer_version"]=response.get("name")
        end

        if ((!data["u_resolver_user"].nil?) && (!data["u_resolver_user"]["value"].nil?))
        data["u_resolver_user"] = data["u_resolver_user"]["value"]
	#@log.info("resolved_by #{data["u_resolver_user"]}")
        response = @call.bit("flint-snow:problem:list_resolved_by.rb").set("sys-id", data["u_resolver_user"]).sync
        data["u_resolver_user"]=response.get("name")
        end

        if ((!data["business_service"].nil?) && (!data["business_service"]["value"].nil?))
        data["business_service"] = data["business_service"]["value"]
        response = @call.bit("flint-snow:problem:list_business_service.rb").set("sys-id", data["business_service"]).sync
        data["business_service"]=response.get("name")
        @log.info("BUSINESS_SERVICE :: #{data["business_service"]}")
        end

        if ((!data["configuration_item"].nil?) && (!data["configuration_item"]["value"].nil?))
        data["configuration_item"] = data["configuration_item"]["value"]
        response = @call.bit("flint-snow:problem:list_configuration_item.rb").set("sys-id", data["configuration_item"]).sync
        data["configuration_item"]=response.get("name")
        end

	if ((!data["u_service_desk_agent"].nil?) && (!data["u_service_desk_agent"]["value"].nil?))
        data["u_service_desk_agent"] = data["u_service_desk_agent"]["value"]
        response = @call.bit("flint-snow:problem:list_u_service_desk_agent.rb").set("sys-id", data["u_service_desk_agent"]).sync
        data["u_service_desk_agent"]=response.get("name")
        end

        if ((!data["resolved_by"].nil?) && (!data["resolved_by"]["value"].nil?))
        data["resolved_by"] = data["resolved_by"]["value"]
        response = @call.bit("flint-snow:problem:list_resolved_by.rb").set("sys-id", data["resolved_by"]).sync
        data["resolved_by"]=response.get("name")
        end

        if ((!data["rfc"].nil?) && (!data["rfc"]["value"].nil?))
        data["rfc"] = data["rfc"]["value"]
        @log.info("22222222222222222  #{data["rfc"]}")
        response = @call.bit("flint-snow:problem:list_rfc.rb").set("sys-id", data["rfc"]).sync
        data["rfc"]=response.get("name")
        end
         
	data["parent"] = data["parent"]
        #response = @call.bit("flint-snow:problem:list_assignmentgroup.rb").set("sys-id", data["assignment_group"]).sync
        #data["assignment_group"]=response.get("name")
        @log.info("11111111111111  #{data["parent"]}")
        

        response1 = @call.bit("flint-snow:problem:list_activity.rb").set("sys-id",data["sys_id"]).sync
        response2 = @call.bit("flint-snow:problem:list_attachment.rb").set("sys-id",data["sys_id"]).sync
        response3 = @call.bit("flint-snow:problem:list_email.rb").set("sys-id",data["sys_id"]).sync
        
        @log.info("result :: #{data}")
        @output.set("data", data).set("activity", response1.get("activity")).set("attachment",response2.get("attachment")).set("email",response3.get("email"))


  @log.info("End")











=begin

        post_data["problem_id"] = data["problem_id"]["display_value"]
        post_data["caller_id"] = data["caller_id"]["display_value"]
        post_data["assignment_group"] = data["assignment_group"]["display_value"]
        post_data["assigned_to"] = data["assigned_to"]["display_value"]
        post_data["location"] = data["location"]["display_value"]
        post_data["sys_domain"] = data["sys_domain"]["display_value"]
        post_data["cmdb_ci"] = data["cmdb_ci"]["display_value"]
	post_data["opened_by"] = data["opened_by"]["display_value"]
        post_data["closed_by"] = data["closed_by"]["display_value"]
        post_data["company"] = data["company"]["display_value"]
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
        post_data["upon_approval"] = data["upon_approval"]
        post_data["expected_start"] = data["expected_start"]
        post_data["reopen_count"] = data["reopen_count"]
        post_data["close_notes"] = data["close_notes"]
        post_data["additional_assignee_list"] = data["additional_assignee_list"]
        post_data["impact"] = data["impact"]
        post_data["urgency"] = data["urgency"]
	post_data["sys_tags"] = data["sys_tags"]
	post_data["description"] = data["description"]
	post_data["group_list"] = data["group_list"]
	post_data["delivery_plan"] = data["delivery_plan"]
 	post_data["sys_mod_count"] = data["sys_mod_count"]
	post_data["work_notes_list"] = data["work_notes_list"]
 	post_data["business_service"] = data["business_service"]
	post_data["follow_up"] = data["follow_up"]
	post_data["sla_due"] = data["sla_due"]
	post_data["delivery_task"] = data["delivery_task"]
	post_data["sys_updated_on"] = data["sys_updated_on"]
	post_data["parent"] = data["parent"]
	post_data["work_end"] = data["work_end"]
	post_data["work_start"] = data["work_start"]
	post_data["calendar_stc"] = data["calendar_stc"]
	post_data["business_duration"] = data["business_duration"]
	post_data["activity_due"] = data["activity_due"]
	post_data["correlation_display"] = data["correlation_display"]
	post_data["active"] = data["active"]
	post_data["due_date"] = data["due_date"]
	post_data["knowledge"] = data["knowledge"]
	post_data["made_sla"] = data["made_sla"]
	post_data["comments_and_work_notes"] = data["comments_and_work_notes"]
	post_data["parent_incident"] = data["parent_incident"]
	post_data["state"] = data["state"]
	post_data["user_input"] = data["user_input"]
	post_data["sys_created_on"] = data["sys_created_on"]
	post_data["approval_set"] = data["approval_set"]
	post_data["reassignment_count"] = data["reassignment_count"]
	post_data["child_incidents"] = data["child_incidents"]
	post_data["opened_at"] = data["opened_at"]
	post_data["order"] = data["order"]
	post_data["sys_updated_by"] = data["sys_updated_by"]
	post_data["notify"] = data["notify"]
	post_data["upon_reject"] = data["upon_reject"]
	post_data["approval_history"] = data["approval_history"]
	post_data["work_notes"] = data["work_notes"]
	post_data["calendar_duration"] = data["calendar_duration"]
	post_data["close_code"] = data["close_code"]
	post_data["approval"] = data["approval"]
	post_data["caused_by"] = data["caused_by"]
	post_data["severity"] = data["severity"]
	post_data["sys_created_by"] = data["sys_created_by"]
	post_data["resolved_at"] = data["resolved_at"]
	post_data["business_stc"] = data["business_stc"]
	post_data["wf_activity"] = data["wf_activity"]
	post_data["sys_domain_path"] = data["sys_domain_path"]
	post_data["subcategory"] = data["subcategory"]
	post_data["rejection_goto"] = data["rejection_goto"]
	post_data["sys_class_name"] = data["sys_class_name"]
	post_data["watch_list"] = data["watch_list"]
	post_data["time_worked"] = data["time_worked"]
	post_data["contact_type"] = data["contact_type"]
	post_data["escalation"] = data["escalation"]
	post_data["comments"] = data["comments"]
=end

     
