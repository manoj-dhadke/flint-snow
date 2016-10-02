log.info("Starting flintbit process_data.rb")
data = input.get("result")
 //log.info("Data ${data}")
 post1={ }
  data.each {post -> 
 // log.info("" +post)
 assignment_group = post["assignment_group"]
  if( assignment_group != null && !(assignment_group instanceof String)){
   post["assignment_group"] = post["assignment_group"]["display_value"]
	}
  assigned_to = post["assigned_to"]
   if( assigned_to != null && !(assigned_to instanceof String)){
   	post["assigned_to"]= post["assigned_to"]["display_value"]
  }
   caller_id = post["caller_id"]
   if( caller_id != null && !(caller_id instanceof String)){
   post["caller_id"] = post["caller_id"]["display_value"]
}
   post["closed_at"] = post["closed_at"]
   post["sys_updated_on"] = post["sys_updated_on"]
   post["sys_id"] = post["sys_id"]
   post["number"] = post["number"]
	post["sys_updated_by"] = post["sys_updated_by"]
	post["incident_state"] = post["incident_state"]
	post["correlation_id"] = post["correlation_id"]
	post["category"] = post["category"]
    post["comments"]= post["comments"]

  post_data = post.toString()
  log.info(post_data)
  
}
  output.set("data", post_data)

 // @call.bit("logictest:Servicenowurl.rb.rb").set('connector_name', 'http').set('body',post_data).sync
log.info("End")
