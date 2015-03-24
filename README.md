Just run the server `bin/rails server` and then run the script `ruby faraday_encoding.rb`.

I get the following output for the script:
```
$ ruby faraday_encoding.rb 
I, [2015-03-23T17:39:39.596767 #8274]  INFO -- : post http://localhost:3000/
D, [2015-03-23T17:39:39.596874 #8274] DEBUG -- request: User-Agent: "Faraday v0.9.1"
I, [2015-03-23T17:39:39.937822 #8274]  INFO -- Status: 200
D, [2015-03-23T17:39:39.937929 #8274] DEBUG -- response: x-frame-options: "SAMEORIGIN"
x-xss-protection: "1; mode=block"
x-content-type-options: "nosniff"
content-type: "text/html; charset=utf-8"
etag: "W/\"505a83f220c02df2f85c3810cd9ceb38\""
cache-control: "max-age=0, private, must-revalidate"
x-request-id: "1f383679-c613-4717-ac1c-72adc9720021"
x-runtime: "0.329230"
server: "WEBrick/1.3.1 (Ruby/2.1.2/2014-05-08)"
date: "Tue, 24 Mar 2015 00:39:39 GMT"
content-length: "7"
connection: "close"
set-cookie: "request_method=POST; path=/"
----------------------------------------------
I, [2015-03-23T17:39:39.938169 #8274]  INFO -- : post http://localhost:3000/
D, [2015-03-23T17:39:39.938230 #8274] DEBUG -- request: User-Agent: "Faraday v0.9.1"
I, [2015-03-23T17:39:39.942782 #8274]  INFO -- Status: 400
D, [2015-03-23T17:39:39.942874 #8274] DEBUG -- response: server: "WEBrick/1.3.1 (Ruby/2.1.2/2014-05-08)"
date: "Tue, 24 Mar 2015 00:39:39 GMT"
content-length: "0"
connection: "close"
```

And for the Rails Server (notice how the second request doesn't show up here):
```
$ bin/rails server
=> Booting WEBrick
=> Rails 4.2.1 application starting in development on http://localhost:3000
=> Run `rails server -h` for more startup options
=> Ctrl-C to shutdown server
[2015-03-23 17:39:24] INFO  WEBrick 1.3.1
[2015-03-23 17:39:24] INFO  ruby 2.1.2 (2014-05-08) [x86_64-darwin13.0]
[2015-03-23 17:39:24] INFO  WEBrick::HTTPServer#start: pid=8154 port=3000


Started POST "/" for ::1 at 2015-03-23 17:39:39 -0700
Processing by ApplicationController#hello_world as */*
  Parameters: {"From: \"Me\" <info@info.com>\nTo: \"You\" <info@info.com>\nHello"=>nil}
  Rendered text template (0.0ms)
Completed 200 OK in 20ms (Views: 8.8ms | ActiveRecord: 0.0ms)
```
