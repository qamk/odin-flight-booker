class ApplicationMailer < ActionMailer::Base
  default from: 'noreply@odin.com'
  layout 'mailer'
  # helper ApplicationHelper # Give view access to the Application Controller's helper methods
end
