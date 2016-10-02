// begin
log.trace("Started executing 'flint-util:serviceNow:incident:update.groovy' flintbit...")
try{
    // Flintbit Input Parameters
    connector_name = input.get("connector_name") // Name of the ServiceNow Connector
    if (connector_name == null){
        connector_name = 'servicenow'
    }
    action = 'update-record'                     // Contains the name of the operation: list
    tableName = 'incident'
    sysid = input.get('sys-id')
    sysparm_display_value = input.get('sysparm_display_value')
    data = input.get('data')

    log.info("Flintbit input parameters are, connector name :: ${connector_name} |action :: ${action}| tableName :: ${tableName}")

           response = call.connector(connector_name)
                          .set('action', action)
                          .set('table-name', tableName)
                          .set('sys-id', sysid)
                          .set('sysparm_display_value', sysparm_display_value)
                          .set('data', data)
                          .sync()

    // ServiceNow Connector Response Meta Parameters
    response_exitcode = response.exitcode()           // Exit status code
    response_message = response.message()             // Execution status message

    // ServiceNow Connector Response Parameters
    response_body = response.get('body')            //Response body

    if (response_exitcode == 0){
        result = util.json(response_body)       
    
        log.info("Success in executing serviceNow Connector, where exitcode :: ${response_exitcode} | message :: ${response_message}")
        response = call.bit("serviceNow:incident:get_process_data.groovy").setraw(response_body).sync()
        output.set('result', response.get('data'))
        log.trace("Finished executing 'serviceNow' flintbit with success...")
    }else{
        log.error("Failure in executing serviceNow Connector where, exitcode :: ${response_exitcode} | message :: ${response_message}")
        output.set('error', response_message)
        log.trace("Finished executing 'serviceNow' flintbit with error...")
    }
}
catch(Exception e){
    log.error(e.message)
    output.set('exit-code', 1).set('message', e.message)
}
log.trace("Finished executing 'flint-util:serviceNow:incident:update.groovy' flintbit...")
// end
