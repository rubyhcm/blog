class Mailjet::MailjetEmailService
  def call(email, subject)
    Mailjet::Send.create(messages: [{
                                      'From' => {
                                        'Email' => "namnguyen111k@gmail.com",
                                        'Name' => "Hỗ trợ lập trình HCM"
                                      },
                                      'To' => [
                                        {
                                          'Email' => email,
                                          'Name' => 'New member'
                                        }
                                      ],
                                      'TemplateID' => 4994360,
                                      'TemplateLanguage' => true,
                                      'Subject' => "[[data:name:#{subject}]]",
                                      'Variables' => {
                                        "name" => "Xin chào #{email}"
                                      }
                                    }])
  end
end