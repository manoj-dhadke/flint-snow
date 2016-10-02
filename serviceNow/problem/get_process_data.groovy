log.info("Starting flintbit process_data.rb")
data = input.get("result")
    
  assignment_group = data["assignment_group"]
  if( assignment_group != null && !(assignment_group instanceof String)){
     data["assignment_group"] = data["assignment_group"]["display_value"]
 }
  assigned_to = data["assigned_to"]
 if( assigned_to != null && !(assigned_to instanceof String)){
   data["assigned_to"]= data["assigned_to"]["display_value"]
 }
   caller_id = data["caller_id"]
 if( caller_id != null && !(caller_id instanceof String)){
   data["caller_id"] = data["caller_id"]["display_value"]
 }
   opened_by = data["opened_by"]
 if( opened_by != null && !(opened_by instanceof String)){
   data["opened_by"] = data["opened_by"]["display_value"] 
 }
  sys_domain = data["sys_domain"]
 if( sys_domain != null && !(sys_domain instanceof String)){
   data["sys_domain"] = data["sys_domain"]["display_value"] 
 }
  company = data["company"]
 if( company != null && !(company instanceof String)){
   data["company"] = data["company"]["display_value"]  
 }
  cmdb_ci = data["cmdb_ci"]
if( cmdb_ci != null && !(cmdb_ci instanceof String)){
    data["cmdb_ci"] = data["cmdb_ci"]["display_value"]
 }
  problem_id = data["problem_id"]
if( problem_id != null && !(problem_id instanceof String)){ 
 data["problem_id"] = data["problem_id"]["display_value"]
 }
  requested_by = data["requested_by"]
if( requested_by != null && !(requested_by instanceof String)){ 
 data["requested_by"] = data["requested_by"]["display_value"] 
}
 location = data["location"]
if( location != null && !(location instanceof String)){ 
 data["location"] = data["location"]["display_value"]
}
 std_change_producer_version = data["std_change_producer_version"]
if( std_change_producer_version != null && !(std_change_producer_version instanceof String)){
 data["std_change_producer_version"] = data["std_change_producer_version"]["display_value"]
}

log.info(""+data.toString()) 
output.set("data", data)

/*   
 log.info(data.class)
 post ={}
  assignment_group = data["assignment_group"]
  if( assignment_group != null && !(assignment_group instanceof String)){
   data["assignment_group"] = data["assignment_group"]["display_value"]
   log.info(""+data["assignment_group"])
	}
     assigned_to = data["assigned_to"]
     if( assigned_to != null && !(assigned_to instanceof String)){
   	data["assigned_to"]= data["assigned_to"]["display_value"]
    log.info(""+data["assigned_to"])
  }
   caller_id = post["caller_id"]
   if( caller_id != null && !(caller_id instanceof String)){
   data["caller_id"] = data["caller_id"]["display_value"]
       log.info(""+data["caller_id"])

  
     log.info(""+data)

}
  
   post["sys_id"] = data["sys_id"]
   post["sys_updated_on"] = data["sys_updated_on"]
   post["sys_id"] = data["sys_id"]
   post["number"] = data["number"]
	 post["sys_updated_by"] = data["sys_updated_by"]
	 post["incident_state"] = data["incident_state"]
	 post["correlation_id"] = data["correlation_id"]
	 post["category"] = data["category"]
   post["comments"]= data["comments"] 
   */

 // @call.bit("logictest:Servicenowurl.rb.rb").set('connector_name', 'http').set('body',post_data).sync

log.info("End")
