=begin
@connector_name = 'service-now' 
@action = 'get-assignment-user-group'                     
tableName = 'sys_user_grmember'
 @log.info("Flintbit input parameters are, connector name :: #{@connector_name} |action :: #{@action}")
         response = @call.connector(@connector_name)
                          .set('table-name', tableName)
                          .set('action', @action)
                          .sync
     #@log.info("#{response}")
    response_exitcode = response.exitcode           # Exit status code
    @log.info("#{response_exitcode}")
    response_message = response.message             # Execution status message
    response_body = response.get('body')            # Response body
    result = @util.json(response_body)
    @call.bit("service-now:incident:process_assignmentgroup.rb").setraw(response_body).sync  
=end

# begin
@log.trace("Started executing 'flint-snow:list_assignmentgroup.rb' flintbit...")
begin
    # Flintbit Input Parameters
    @connector_name = @input.get('connector_name') 		  # Name of the service-now Connector
    if @connector_name.nil?
       @connector_name = @config.global("flintserve.connector_name")
      if @connector_name.nil?
       @connector_name = 'servicenow'
    end
   end
    @action = 'find-record'                   	  # Contains the name of the operation: list
    tableName = 'sys_user_group'
    @sysid = @input.get('sys-id')

    @log.info("Flintbit input parameters are, connector name :: #{@connector_name} |action :: #{@action}| tableName :: #{tableName}")

          response = @call.connector(@connector_name)
                          .set('action', @action)
                          .set('table-name', tableName)
			  .set('sys-id', @sysid)
                          .sync
    # service-now Connector Response Meta Parameters
    response_exitcode = response.exitcode           # Exit status code
    response_message = response.message             # Execution status message

    # service-now Connector Response Parameters
  response_body = response.get('body')
  #@log.info(response_body)
 
    if response_exitcode == 0
    	result = @util.json(response_body)
	
	 @log.info("Success in executing service-now Connector, where exitcode :: #{response_exitcode} | message :: #{response_message}")
         result = result.get("result.name")
         @log.info("$$$ :: #{result}")
         @output.set("name", result)
         @log.trace("Finished executing 'service-now' flintbit with success...")
    else
        @log.error("Failure in executing service-now Connector where, exitcode :: #{response_exitcode} | message :: #{response_message}")
        @output.set('error', response_message)
        @log.trace("Finished executing 'service-now' flintbit with error...")
    end
rescue Exception => e
    @log.error(e.message)
    @output.set('exit-code', 1).set('message', e.message)
end
@log.trace("Finished executing 'flint-snow:list_assignmentgroup.rb' flintbit...")
# end
