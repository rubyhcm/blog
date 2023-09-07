require 'net/http'

url = URI.parse('https://blog-ag2f.onrender.com/')
http = Net::HTTP.new(url.host, url.port)
http.use_ssl = (url.scheme == 'https')

puts "Script executed at #{Time.now}"

response = http.request(Net::HTTP::Get.new(url.path))
puts "Response Code: #{response.code}"
`mkdir /home/nguyenloi/Desktop/noname`
