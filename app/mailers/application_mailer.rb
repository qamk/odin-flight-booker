class ApplicationMailer < ActionMailer::Base
  default from: 'noreply@odin.com'
  layout 'mailer'
  helper ApplicationController # Gain access to the controller's helper method
end
