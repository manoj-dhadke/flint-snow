=begin
##########################################################################
#
#  INFIVERVE TECHNOLOGIES PTE LIMITED CONFIDENTIAL
#  __________________
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
@log.trace("Started executing 'flint-snow:incident:assignment_group.rb' flintbit...")
begin
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
    data = {}
    data["assignment_group"]=@input.get('assignment_group')
       
    @log.info("Flintbit input parameters are, connector name :: #{@connector_name} |action :: #{@action}| tableName :: #{@tableName} | sysid :: #{@sysid} | 
state :: #{data}")

          response = @call.connector(@connector_name)
                          .set('action', @action)
                          .set('table-name', @tableName)
                          .set('data', data)
                          .set('sys-id', @sysid)
                          .sync
            

    # ServiceNow Connector Response Meta Parameters
    response_exitcode = response.exitcode           # Exit status code
    response_message = response.message             # Execution status message
   
    
    # ServiceNow Connector Response Parameters
  response_body = response.get('body')# Response body

    if response_exitcode == 0
        result = @util.json(response_body)
        
        @log.info("Success in executing servicenow Connector, where exitcode :: #{response_exitcode} | message :: #{response_message}")
        #response= @call.bit("service-now:incident:get_process_data.rb").setraw(response_body).sync
        #@output.setraw('result', response_body)
        result = result.get("result.name")        
         @output.set("name", result)
       # @output.set('result', response.get('data'))
        @log.trace("Finished executing 'servicenow' flintbit with success...")
    else
        @log.error("Failure in executing servicenow Connector where, exitcode :: #{response_exitcode} | message :: #{response_message}")
        @output.set('error', response_message)
        @log.trace("Finished executing 'servicenow' flintbit with error...")
    end
rescue Exception => e
    @log.error(e.message)
    @output.set('exit-code', 1).set('message', e.message)
end
@log.trace("Finished executing 'flint-snow:incident:assignment_group.rb' flintbit...")
# end
