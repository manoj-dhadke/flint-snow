@log.trace("Started executing 'flint-snow:change:list_problem_id.rb' flintbit...")
begin
    # Flintbit Input Parameters
    @connector_name = @input.get('connector_name')        # Name of the ServiceNow Connector
    if @connector_name.nil?
       @connector_name = @config.global("flintserve.connector_name")
      if @connector_name.nil?
       @connector_name = 'servicenow'
    end
   end
    @action = 'find-record'                   	  # Contains the name of the operation: list
    tableName = 'problem'
    @sysid = @input.get("sys-id")

    @log.info("Flintbit input parameters are, connector name :: #{@connector_name} |action :: #{@action}| tableName :: #{tableName}")

          response = @call.connector(@connector_name)
                          .set('action', @action)
                          .set('table-name', tableName)
                          .set('sys-id', @sysid)
                          .sync
    # ServiceNow Connector Response Meta Parameters
    response_exitcode = response.exitcode           # Exit status code
    response_message = response.message             # Execution status message

    # ServiceNow Connector Response Parameters
  response_body = response.get('body')

    if response_exitcode == 0
    	result = @util.json(response_body)

	 @log.info("Success in executing serviceNow Connector, where exitcode :: #{response_exitcode} | message :: #{response_message}")
         result = result.get("result.name")
         @output.set("name", result)
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
@log.trace("Finished executing 'flint-snow:change:list_problem_id.rb' flintbit...")
# end
