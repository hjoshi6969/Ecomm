# app/controllers/email_controller.rb

class EmailController < ApplicationController
  before_action :authenticate_customer!
  def index
  end

  def send
    require 'mailjet'

    # Extract form data from params
    subject = params[:subject]
    message = params[:message]
    email = params[:email]

    # Define the email parameters
    email_params = {
      Messages: [{
        From: {
          Email: 'himanshujoshi3304@gmail.com'
        },
        To: [{
          Email: 'www.himanshubhavika2004@gmail.com'
        }],
        Subject: subject,
        TextPart: message
      }]
    }

    # Send the email through Mailjet
    response = Mailjet::Send.create(email_params)

    # Redirect or render a response based on the response from Mailjet
    if response.status == 'success'
      redirect_to root_path, notice: 'Message sent successfully!'
    else
      redirect_to root_path, alert: 'Failed to send message. Please try again.'
    end
  end
end
