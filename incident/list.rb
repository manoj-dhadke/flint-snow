=begin
#
#  INFIVERVE TECHNOLOGIES PTE LIMITED CONFIDENTIAL
#  _______________________________________________
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

# begin
@log.trace("Started executing 'flint-snow:incident:list.rb' flintbit...")
begin
    # Flintbit Input Parameters
    @connector_name = @input.get('connector_name') # Name of the ServiceNow Connector
   if @connector_name.nil?
       @connector_name = @config.global("flintserve.connector_name")
      if @connector_name.nil?
       @connector_name = 'servicenow'
    end
   end
    @action = 'get-records'                     # Contains the name of the operation: list
    # optional
    @tableName = 'incident'
    @sysparm_limit  = @input.get('sysparm_limit')
    @sysparm_query = @input.get('sysparm_query')
  @sysparm_display_value =@input.get('sysparm_display_value')
    sysparm_fields = "sys_id, number, closed_at, priority, incident_state, state, assigned_to, category ,correlation_id, sys_updated_by, sys_updated_on ,caller_id, assignment_group, short_description, escalation, opened_at, urgency"

    @log.info("Flintbit input parameters are, connector name :: #{@connector_name} |action :: #{@action}| tableName :: #{@tableName}")

          response = @call.connector(@connector_name)
                          .set('action', @action)
                          .set('table-name', @tableName)
                          .set('sysparm_limit', @sysparm_limit)
                          .set('sysparm_query', @sysparm_query)
                          .set('sysparm_display_value', @sysparm_display_value)
                          .set('sysparm_fields', sysparm_fields)
                          .sync
    # ServiceNow Connector Response Meta Parameters
    response_exitcode = response.exitcode           # Exit status code
    response_message = response.message             # Execution status message

    # ServiceNow Connector Response Parameters
  response_body = response.get('body')# Response body   
  
    if response_exitcode == 0
    	result = @util.json(response_body)
	
	 @log.info("Success in executing serviceNow Connector, where exitcode :: #{response_exitcode} | message :: #{response_message}")
         @call.bit("flint-snow:incident:process_data.rb").setraw(response_body).sync        
         @output.set("message", 'Success')
         @log.trace("Finished executing 'serviceNow' flintbit with success...")
    else
        @log.error("Failure in executing serviceNow Connector where, exitcode :: #{response_exitcode} | message :: #{response_message}")
        @output.set('error', response_message)
        @log.trace("Finished executing 'serviceNow' flintbit with error...")
    end
rescue Exception => e
    @log.error(e.message)
    @output.set('exit-code', 1).set('message', e.message)
end
@log.trace("Finished executing 'flint-snow:incident:list.rb' flintbit...")
# end
