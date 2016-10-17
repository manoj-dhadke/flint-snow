# begin
@log.trace("Started executing 'flint-snow:problem:note.rb' flintbit...")
begin
    #@log.trace(@input.raw())
    # Flintbit Input Parameters
    @connector_name = @input.get('connector_name')                 # Name of the ServiceNow Connector
    if @connector_name.nil?
       @connector_name = @config.global("flintserve.connector_name")
      if @connector_name.nil?
       @connector_name = 'servicenow'
    end
   end
    @action = 'update-record'                     
    @tableName = 'incident' 
    @sysid  = @input.get('sys-id')
    @sysparm_display_value = @input.get('sysparm_display_value')
    data = @input.get('data')
    #data["work_notes"]=@input.get('work_notes')
    #data["comments"]=@input.get('comments')
       
    @log.info("Flintbit input parameters are, connector name :: #{@connector_name} |action :: #{@action}| tableName :: #{@tableName} | sys-id :: #{@sysid} | data :: #{data}")

          response = @call.connector(@connector_name)
                          .set('action', @action)
                          .set('table-name', @tableName)
                          .set('data', data)
                          .set('sys-id', @sysid)
                          .set('sysparm_display_value', @sysparm_display_value)
                          .sync
            

    # ServiceNow Connector Response Meta Parameters
    response_exitcode = response.exitcode           # Exit status code
    response_message = response.message             # Execution status message
   
    
    # ServiceNow Connector Response Parameters
    response_body = response.get('body')

    if response_exitcode == 0
        result = @util.json(response_body)
        
        @log.info("Success in executing service-now Connector, where exitcode :: #{response_exitcode} | message :: #{response_message}")
        #response1 = @call.bit("service-now:incident:list_activity.rb").set("sys-id",data["sys_id"]).sync
        response=@call.bit("flint-snow:incident:note_get.rb").setraw(response_body).set('sys-id', @sysid).set('sysparm_display_value', @sysparm_display_value).sync
        #@output.setraw('result', response_body)
        @output.set('result', response.get("result"))
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
@log.trace("Finished executing 'flint-snow:problem:note.rb' flintbit...")
# end
