@log.info("Starting called flintbit :: flint-snow:problem:note_process_data.rb")
 
 data = @input.get("result")
 post_data = {}
 post_data["comments"] = data["comments"].gsub(/[\n]/, ' ')
 post_data["work_notes"] = data["work_notes"].gsub(/[\n]/, ' ')
 
 
 @log.info("result :: #{post_data}")
 @output.set("data", "#{post_data}")

@log.info("End :: flint-snow:problem:note_process_data.rb")




 #@log.info("result :: #{post_data.class}")
 #name = post_data.map{|k,v| "#{k}=#{v}"}.join('&')
 #@log.info("result :: #{name.class}")
 #@output.set("data", post_data)
