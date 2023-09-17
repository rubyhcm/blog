require 'mailjet'

class Mailjet::MailjetEmailService
  def call(contact, subject = nil)
    debugger
    Mailjet::Send.create(messages: [{
                                      'From' => {
                                        'Email' => ENV['DEFAULT_EMAIL'],
                                        'Name' => "Chia sẻ về Lập trình web"
                                      },
                                      'To' => [
                                        {
                                          'Email' => contact.email,
                                          'Name' => contact.name
                                        }
                                      ],
                                      # 'TemplateID' => 4994360,
                                      # 'TemplateLanguage' => true,
                                      # 'Subject' => "[[data:name:#{subject}]]",
                                      # 'Variables' => {
                                      #   "name" => "Xin chào #{email}"
                                      'Subject' => contact.title || 'Hỗ trợ lập trình!',
                                      'TextPart'=> 'Greetings from Mailjet!',
                                      'HTMLPart' => "<h3>Dear #{contact.name}!</h3>
                                        <br /> #{contact.message}"
                                    }])
  end
end