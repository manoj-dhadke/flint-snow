# begin
@log.trace("Started executing 'flint-util:serviceNow:list_company.rb' flintbit...")
begin
    # Flintbit Input Parameters
    @connector_name = @input.get('connector_name') 		  # Name of the ServiceNow Connector
    if @connector_name.nil?
       @connector_name = 'servicenow'
    end
    @action = 'get-records'                   	  # Contains the name of the operation: list
    @sysparm_limit  = 20
    @sysparm_offset = 0
    @flag = true
    for i in 0..32
    table_list = ["sys_user", "sys_user_grmember", "core_company"]  #config.global("servicenow.table_list")
    if @flag
       @sysparm_offset = 0
       @flag = false
    else
       @sysparm_offset = @sysparm_offset+@sysparm_limit       
    end
    table_list.each do |tableName|     
    @sysparm_display_value = @input.get("sysparm_display_value")
    

    @log.info("Flintbit input parameters are, connector name :: #{@connector_name} |action :: #{@action}| tableName :: #{tableName}")

          response = @call.connector(@connector_name)
                          .set('action', @action)
                          .set('table-name', tableName)
			  .set('sysparm_display_value',@sysparm_display_value)
                          .set('sysparm_limit',@sysparm_limit)
                          .set('sysparm_offset',@sysparm_offset)
                          .sync

    # ServiceNow Connector Response Meta Parameters
    response_exitcode = response.exitcode           # Exit status code
    response_message = response.message             # Execution status message

    # ServiceNow Connector Response Parameters
  response_body = response.get('body')# Response body  
  #@log.info(response_body) 
  
    if response_exitcode == 0
    	result = @util.json(response_body)
	 @log.info("Success in executing serviceNow Connector, where exitcode :: #{response_exitcode} | message :: #{response_message}")
         #@log.info("#{result}")
         response = @call.bit("serviceNow:incident:process_tables.rb").setraw(response_body).sync
       #  dataa = response.get('data')
       #  sys_id = dataa["sys_id"]
         if response.get('data').nil?
         break     
         @log.info("Breaking the loop")
         end 
         @output.set('result', response.get('data'))
         @log.trace("Finished executing 'serviceNow' flintbit with success...")
         
    else
        @log.error("Failure in executing serviceNow Connector where, exitcode :: #{response_exitcode} | message :: #{response_message}")
        @output.set('error', response_message)
        @log.trace("Finished executing 'serviceNow' flintbit with error...")
    end
end
end
rescue Exception => e
    @log.error(e.message)
    @output.set('exit-code', 1).set('message', e.message)
end
@log.trace("Finished executing 'flint-util:serviceNow:list_company.rb' flintbit...")
# end
