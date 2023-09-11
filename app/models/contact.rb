class Contact < MailForm::Base
  attribute :name, :validate => true
  attribute :email, :validate => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  attribute :message, :validate => true
  attribute :nickname, :captcha => true

  validates :name, presence: true
  validates :message, presence: true

  def headers
    {
      :subject => 'Contact Form',
      :to => 'phucloi.2311@gmail.com',
      :from => %("#{name}" <#{email}>)
    }
  end
end
