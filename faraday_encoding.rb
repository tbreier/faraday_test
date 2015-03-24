require 'faraday'

connection = Faraday.new do |c|
  c.response :logger
  c.adapter Faraday.default_adapter
end

connection.token_auth 'my_token'

connection.post do |request|
  request.url 'http://localhost:3000/' # returns 200 Success when I use my Rails server
  request.body = "From: \"Me\" <info@info.com>\nTo: \"You\" <info@info.com>\nHello"
end

puts "----------------------------------------------"

connection.post do |request|
  request.url 'http://localhost:3000/' # returns 400 Bad Request when I use my Rails server
  request.body = "From: \"Me\" <info@info.com>\nTo: \"You\" <info@info.com>\nHello %%"
end