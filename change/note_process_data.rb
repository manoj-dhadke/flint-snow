=begin
#
#  INFIVERVE TECHNOLOGIES PTE LIMITED CONFIDENTIAL
#  _______________________________________________
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

@log.info("Starting called flintbit :: flint-snow:change:note_process_data.rb")
 
 data = @input.get("result")
 post_data = {}
 post_data["comments"] = data["comments"].gsub(/[\n]/, ' ')
 post_data["work_notes"] = data["work_notes"].gsub(/[\n]/, ' ')
 
 
 @log.info("result :: #{post_data}")
 @output.set("data", "#{post_data}")

@log.info("End :: flint-snow:change:note_process_data.rb")




 #@log.info("result :: #{post_data.class}")
 #name = post_data.map{|k,v| "#{k}=#{v}"}.join('&')
 #@log.info("result :: #{name.class}")
 #@output.set("data", post_data)
