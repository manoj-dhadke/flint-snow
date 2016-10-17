# begin
require 'json'
@log.trace("Started executing 'flint-snow:list_tables.rb' flintbit...")
begin
    # Flintbit Input Parameters
    @connector_name = @input.get('connector_name') 		  # Name of the ServiceNow Connector
    if @connector_name.nil?
       @connector_name = 'servicenow'
    end
    @action = 'get-records'                   	  # Contains the name of the operation: list
    @sysparm_display_value = @input.get("sysparm_display_value")
    @sysparm_limit  = 40
    @sysparm_offset = 0
    @flag = true
    table_list = @config.global("servicenow.table_list") #["cmdb_ci_service", "sys_user","sys_user_grmember", "core_company",sys_user]

   table_list.each do |tableName|

    for i in 0..10000

       if @flag
         @sysparm_offset = 0
         @flag = false
       else
         @sysparm_offset = @sysparm_offset+@sysparm_limit
         @log.info("|||||||||||| :: #{@sysparm_offset}")
       end
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
     
     if response_exitcode == 0

     response_body = response.get('body')	   # Response body
     test =response.get('headers')
     count = test.fetch("X-Total-Count")
     counts = count[0].to_i
     @log.info("COUNTS :: #{counts.to_s}")

      #result = @util.json(response_body)

	 @log.info("Success in executing serviceNow Connector, where exitcode :: #{response_exitcode} | message :: #{response_message}")
         @call.bit("flint-snow:sync_tables:arrango_collections.rb").set("table-name",tableName).sync
         response = @call.bit("serviceNow:incident:list_tables_process_data.rb").setraw(response_body).set("table-name",tableName).sync
         @output.set('result', response.get('data'))
         @log.trace("Finished executing 'serviceNow' flintbit with success...")

    else
        @log.error("Failure in executing serviceNow Connector where, exitcode :: #{response_exitcode} | message :: #{response_message}")
        @output.set('error', response_message)
        @log.trace("Finished executing 'serviceNow' flintbit with error...")
    end

   if counts <= @sysparm_offset
    @log.info("############### BREAKING THE LOOP ###################")
    @flag = true
    break
   end
  end
end
rescue Exception => e
    @log.error(e.message)
    @output.set('exit-code', 1).set('message', e.message)
end
@log.trace("Finished executing 'flint-snow:list_tables.rb' flintbit...")
# end
