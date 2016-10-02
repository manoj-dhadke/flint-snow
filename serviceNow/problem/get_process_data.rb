@log.info("Starting called flintbit get_process_data.rb")
data = @input.get("result")

#post_data = {}
	
    if !data["assignment_group"].nil?
	data["assignment_group"] = data["assignment_group"]["display_value"]
    end
    if !data["assigned_to"].nil?
        data["assigned_to"] = data["assigned_to"]["display_value"]
	end
	if !data["opened_by"].nil?
        data["opened_by"] = data["opened_by"]["display_value"]
 	end
	if !data["location"].nil?
        data["location"] = data["location"]["display_value"]
	end
	if !data["sys_domain"].nil?
        data["sys_domain"] = data["sys_domain"]["display_value"]
	end
	if !data["cmdb_ci"].nil?
        data["cmdb_ci"] = data["cmdb_ci"]["display_value"]
	end
	if !data["closed_by"].nil?
        data["closed_by"] = data["closed_by"]["display_value"]
        end
	if !data["company"].nil?
        data["company"] = data["company"]["display_value"]
	end
	if !data["caller_id"].nil?
        data["caller_id"] = data["caller_id"]["display_value"] 
	end
	if !data["problem_id"].nil? 
        data["problem_id"] = data["problem_id"]["display_value"] 
    end
    if !data["requested_by"].nil? 
        data["requested_by"] = data["requested_by"]["display_value"] 
    end
    if !data["std_change_producer_version"].nil? 
        data["std_change_producer_version"] = data["std_change_producer_version"]["display_value"] 
    end
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

       @log.info("result :: #{data}")
       @output.set("data", data)
@log.info("End")
