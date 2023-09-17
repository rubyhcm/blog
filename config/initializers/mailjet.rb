require 'mailjet'
Mailjet.configure do |config|
  config.api_key = ENV['MAILJET_API_KEY']
  config.secret_key = ENV['MAILJET_SECRET_KEY']
  config.default_from = ENV['DEFAULT_EMAIL']
  config.api_version = 'v3.1'
  config.end_point = "https://api.mailjet.com"
end
