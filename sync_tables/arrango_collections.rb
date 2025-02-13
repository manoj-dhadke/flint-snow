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
@log.trace("Started executing 'flint-snow:sync_tables:arrango_collection.rb' flintbit...")
begin
    # Flintbit Input Parameters
    @connector_name = @input.get('connector_name') # Name of the ServiceNow Connector
    if @connector_name.nil?
        @connector_name = 'arrango_db'
    end
    @action = 'create-collection'                     # Contains the name of the operation: list
    @tableName = 'service_now_'+@input.get("table-name")

    @log.info("Flintbit input parameters are, connector name :: #{@connector_name} |action :: #{@action}| tableName :: #{@tableName}")

          response = @call.connector(@connector_name)
                          .set('action', @action)
                          .set('collection-name', @tableName)
                          .sync

    # Connector Response Meta Parameters
    response_exitcode = response.exitcode           # Exit status code
    response_message = response.message             # Execution status message
    if response_exitcode == 0   
        @log.info("Success in executing arrango_db Connector, where exitcode :: #{response_exitcode} | message :: #{response_message}")
    else
        @log.error("Failure in executing arrango_db Connector where, exitcode :: #{response_exitcode} | message :: #{response_message}")
    end
rescue Exception => e
        @log.error(e.message)
        @output.set('exit-code', 1).set('message', e.message)
end
@log.trace("Finished executing 'flint-snow:sync_tables:arrango_collection.rb' flintbit...")
# end
