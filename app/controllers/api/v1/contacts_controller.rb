# frozen_string_literal: true

require 'httpclient'

module Api
  module V1
    # Controller for managing contacts
    class ContactsController < ActionController::API
      require 'httpclient'

      def create
        @contact = Contact.new(contact_params)

        begin
          Mailjet::MailjetEmailService.new.call(@contact)
          render json: { message: 'Message sent successfully' }, status: :created
        rescue StandardError => e
          render json: { error: e.message }, status: :unprocessable_entity
        end
      end

      private

      def contact_params
        params.require(:contact).permit(:name, :email, :message, :nickname, :title)
      end
    end
  end
end
