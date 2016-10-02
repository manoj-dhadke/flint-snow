# begin
@log.trace("Started executing 'serviceNow:incident:create.rb' flintbit...")
begin
    # Flintbit Input Parameters
    @connector_name = @input.get('connector_name') # Name of the ServiceNow Connector
    if @connector_name.nil?
       @connector_name = 'servicenow'
    end
    @action = 'create-record'                     # Contains the name of the operation: list
    @tableName = 'incident'
    @data = @input.get('data')
    to = @config.global("flint-twilio.to")
    number=""
    @log.info("Flintbit input parameters are, connector name :: #{@connector_name} |action :: #{@action}| tableName :: #{@tableName}")

          response = @call.connector(@connector_name)
                          .set('action', @action)
                          .set('table-name', @tableName)
                          .set('data', @data)
                          .sync
     
    # ServiceNow Connector Response Meta Parameters
    response_exitcode = response.exitcode           # Exit status code
    response_message = response.message             # Execution status message

    # ServiceNow Connector Response Parameters
    response_body = response.get('body')            # Response body

    if response_exitcode == 0
        result = @util.json(response_body)       
         
        @log.info("Success in executing serviceNow Connector, where exitcode :: #{response_exitcode} | message :: #{response_message}")
        response = @call.bit("serviceNow:incident:get_process_data.rb").setraw(response_body).sync 
        OUT = response.get('data')
        number = OUT["number"]
        priority = OUT["priority"]
        message = "A new incident P#{priority} created with Incident # #{number}"
        @log.info(message)
         to.each do |number|
       @log.info(number.to_s)
        @response = @call.bit("flint-twilio:sms:send.rb").set("to", " #{number} ").set("message",message).sync
        end
       # @response = @call.bit("flint-twilio:sms:send.rb").set("to","+6582999526").set("message",message).sync
        @output.set('result', OUT)
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
@log.trace("Finished executing 'serviceNow:incident:create.rb' flintbit...")
# end
