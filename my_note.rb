# config.action_mailer.smtp_settings = {
#   :address        => 'smtp.sendgrid.net',
#   :port           => '587',
#   :authentication => :plain,
#   :user_name      => ENV['ANDREAFOMERA_SENDGRID_USERNAME'],
#   :password       => ENV['ANDREAFOMERA_SENDGRID_PASSWORD'],
#   :domain         => 'sendgrid.example.com',
#   :enable_starttls_auto => true
# }

config.action_mailer.smtp_settings = {
  :address        => 'smtp.sendgrid.net',
  :port           => '587',
  :authentication => :plain,
  :user_name      => Rails.application.secrets.sendgrid_username,
  :password       => Rails.application.secrets.sendgrid_password,
  :domain         => 'sendgrid.example.com',
  :enable_starttls_auto => true
}

# # Rails.application.secrets will show config/secrets.yml
# production:
#   secret_key_base: 998bc1ec2e62e61bacde52f19813eab0af270f14ac59d9afdc275bf2b8f8c70a41090a061df042b266bada8fdb447443dee8ffa20a9289b13664d2edaf1ded7e
#   sendgrid_username: myusernameisawesome
#   sendgrid_password: herptyderpderpteherppassword