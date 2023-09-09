# require 'net/http'
#
# url = URI.parse('https://blog-ag2f.onrender.com/')
# http = Net::HTTP.new(url.host, url.port)
# http.use_ssl = (url.scheme == 'https')
#
# puts "Script executed at #{Time.now}"
#
# response = http.request(Net::HTTP::Get.new(url.path))
# puts "Response Code: #{response.code}"
# `mkdir /home/nguyenloi/Desktop/noname`

require 'net/http'
url = URI.parse('https://blog-ag2f.onrender.com/')
http = Net::HTTP.new(url.host, url.port)
http.use_ssl = (url.scheme == 'https')
response = http.request(Net::HTTP::Get.new(url.path))

# Mở hoặc tạo tệp tin /home/nguyenloi/Desktop/result.txt để ghi dữ liệu vào
File.open('/home/nguyenloi/Desktop/result.txt', 'a') do |file|
  file.puts("=====> Result from Blog app!!!  <=====")
  file.puts("Response Code: #{response.code} #{Time.now}")
end
