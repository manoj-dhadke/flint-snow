require 'json'
@log.trace("Started executing 'http_assignment_group.rb' flintbit...")
begin
@connector_name = "http"                                                                    
@ContentType = "application/json"
@username= "admin"                                      #@config.global("servicenow_authorization.username")
@password= "Infiverve@123"                                   #@config.global("servicenow_authorization.password")                                    
@url =@input.get("url")

@log.info(@url)
@log.trace("Calling HTTP Connector..."+@body.to_s)
connector_name_response = @call.connector(@connector_name)
                               .set("method","get")
                               .set("url",@url)
                               .set("header", ["cache-control:no-cache","username:#{@username}","password:#{@password}"])
                               .set("timeout",60000)
                               .sync

#HTTP Connector Response Meta Parameters
response_exitcode = connector_name_response.exitcode   #Exit status code
response_message = connector_name_response.message     #Execution status message

#HTTP Connector Response Parameters
response_body = connector_name_response.get("body")        #Response Body
response_headers = connector_name_response.get("headers")  #Response Headers

@log.info("response_body # #{response_body}")
if response_exitcode == 0
    @log.info('Success in executing HTTP Connector where, exitcode ::'+response_exitcode.to_s+' | message :: '+response_message)
    @output.set("exit-code",0).setraw("message",response_body.to_s)
    @log.info('New-case is Created in SalesForce')
else
    @log.error('Failure in executing HTTP Connector where, exitcode ::'+response_exitcode.to_s+' | message :: ' +response_message)
    @output.set("exit-code",-1).set("message",response_message)
end
rescue => e
    @log.error(e.message)
    @output.set('message', e.message).set('exit-code', -1)
    @output.message(e.message)
end
@log.trace("Finised executing 'http_assignment_group.rb' flintbit...")
