log.info("Starting called flintbit note_process_data.rb")
 data = input.get("result")
 post_data = {}
 post_data = data["work_notes"]
 //log.info("result :: #{post_data.class}")
 //name = post_data.map{|k,v| "#{k}=#{v}"}.join('&')
 //@log.info("result :: #{name.class}")
  output = post_data.sub(/[\n]/, ' ')
 //log.info("result :: #{output}")
 //@output.set("data", post_data)
 log.info("End")