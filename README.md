Just run the server `bin/rails server` and then run the script `ruby faraday_encoding.rb`.

I get the following output for the script:
```
$ ruby faraday_encoding.rb 
I, [2015-03-23T18:25:52.041359 #10667]  INFO -- : post http://localhost:3000/
D, [2015-03-23T18:25:52.041475 #10667] DEBUG -- request: User-Agent: "Faraday v0.9.1"
Content-Type: "application/x-www-form-urlencoded"
I, [2015-03-23T18:25:52.366326 #10667]  INFO -- Status: 200
D, [2015-03-23T18:25:52.366479 #10667] DEBUG -- response: x-frame-options: "SAMEORIGIN"
x-xss-protection: "1; mode=block"
x-content-type-options: "nosniff"
content-type: "text/html; charset=utf-8"
etag: "W/\"505a83f220c02df2f85c3810cd9ceb38\""
cache-control: "max-age=0, private, must-revalidate"
x-request-id: "c4eb0384-12d5-43ae-8755-d516f02959c6"
x-runtime: "0.301850"
server: "WEBrick/1.3.1 (Ruby/2.1.2/2014-05-08)"
date: "Tue, 24 Mar 2015 01:25:52 GMT"
content-length: "7"
connection: "close"
set-cookie: "request_method=POST; path=/"
----------------------------------------------
I, [2015-03-23T18:25:52.366799 #10667]  INFO -- : post http://localhost:3000/
D, [2015-03-23T18:25:52.366875 #10667] DEBUG -- request: User-Agent: "Faraday v0.9.1"
Content-Type: "application/x-www-form-urlencoded"
I, [2015-03-23T18:25:52.382343 #10667]  INFO -- Status: 400
D, [2015-03-23T18:25:52.382431 #10667] DEBUG -- response: server: "WEBrick/1.3.1 (Ruby/2.1.2/2014-05-08)"
date: "Tue, 24 Mar 2015 01:25:52 GMT"
content-length: "0"
connection: "close"
----------------------------------------------
I, [2015-03-23T18:25:52.382684 #10667]  INFO -- : post http://localhost:3000/
D, [2015-03-23T18:25:52.382730 #10667] DEBUG -- request: User-Agent: "Faraday v0.9.1"
Content-Type: "application/x-www-form-urlencoded"
I, [2015-03-23T18:25:52.391251 #10667]  INFO -- Status: 200
D, [2015-03-23T18:25:52.391365 #10667] DEBUG -- response: x-frame-options: "SAMEORIGIN"
x-xss-protection: "1; mode=block"
x-content-type-options: "nosniff"
content-type: "text/html; charset=utf-8"
etag: "W/\"505a83f220c02df2f85c3810cd9ceb38\""
cache-control: "max-age=0, private, must-revalidate"
x-request-id: "dd284530-a797-41f6-818d-124ffc674426"
x-runtime: "0.004482"
server: "WEBrick/1.3.1 (Ruby/2.1.2/2014-05-08)"
date: "Tue, 24 Mar 2015 01:25:52 GMT"
content-length: "7"
connection: "close"
set-cookie: "request_method=POST; path=/"
```

And for the Rails Server (notice how the second request doesn't show up here):
```
$ bin/rails server
=> Booting WEBrick
=> Rails 4.2.1 application starting in development on http://localhost:3000
=> Run `rails server -h` for more startup options
=> Ctrl-C to shutdown server
[2015-03-23 18:25:48] INFO  WEBrick 1.3.1
[2015-03-23 18:25:48] INFO  ruby 2.1.2 (2014-05-08) [x86_64-darwin13.0]
[2015-03-23 18:25:48] INFO  WEBrick::HTTPServer#start: pid=10647 port=3000


Started POST "/" for ::1 at 2015-03-23 18:25:52 -0700
Processing by ApplicationController#hello_world as */*
  Parameters: {"From: \"Me\" <info@info.com>\nTo: \"You\" <info@info.com>\nHello"=>nil}
  Rendered text template (0.0ms)
Completed 200 OK in 23ms (Views: 12.3ms | ActiveRecord: 0.0ms)


Started POST "/" for ::1 at 2015-03-23 18:25:52 -0700
Processing by ApplicationController#hello_world as */*
  Parameters: {"From: \"Me\" <info@info.com>\nTo: \"You\" <info@info.com>\nHello %%"=>nil}
  Rendered text template (0.0ms)
Completed 200 OK in 1ms (Views: 0.5ms | ActiveRecord: 0.0ms)
```
