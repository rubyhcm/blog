require 'httpclient'

class ContactsController < ApplicationController
  require 'httpclient'
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      @contact.deliver
      # Mailjet::MailjetEmailService.new.call(@contact.email, @contact.name)
      flash.now[:error] = nil
      flash[:success] = 'Message sent successfully.'
      redirect_to root_path
    else
      flash.now[:error] = 'Cannot send message.'
      render :new
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :message, :nickname)
  end
end
