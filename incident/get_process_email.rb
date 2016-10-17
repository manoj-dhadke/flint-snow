require 'json'
@log.info("Starting called flintbit get_process_email.rb")
data = @input.get("result")

 data.each do |data|

    if ((!data["instance"].nil?) && (!data["instance"]["value"].nil?))
	data["instance"] = data["instance"]["value"]
    end       
 end
       @output.set("data", data)
