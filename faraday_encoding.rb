require 'faraday'
require 'uri'

connection = Faraday.new do |c|
  c.request :url_encoded
  c.response :logger
  c.adapter Faraday.default_adapter
end

connection.post do |request|
  request.url 'http://localhost:3000/' # returns 200 OK when I use my Rails server
  request.body = "From: \"Me\" <info@info.com>\nTo: \"You\" <info@info.com>\nHello"
end

puts "----------------------------------------------"

connection.post do |request|
  request.url 'http://localhost:3000/' # returns 400 Bad Request when I use my Rails server
  request.body = "From: \"Me\" <info@info.com>\nTo: \"You\" <info@info.com>\nHello %%"
end

puts "----------------------------------------------"

connection.post do |request|
  request.url 'http://localhost:3000/' # returns 200 OK when I use my Rails server
  request.body = URI.encode_www_form_component("From: \"Me\" <info@info.com>\nTo: \"You\" <info@info.com>\nHello %%")
end
