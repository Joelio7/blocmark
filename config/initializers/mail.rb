config.action_mailer.delivery_method = :smtp
config.action_mailer.smtp_settings = {
  :authentication => :plain,
  :address => "smtp.mailgun.org",
  :port => 587,
  :domain => "app87c8e48cb0e146f595f8e3feef21cf08.mailgun.org",
  :user_name => "postmaster@app87c8e48cb0e146f595f8e3feef21cf08.mailgun.org",
  :password => "e0b5aff1a308115b847afa63713c581b",
  :content_type => 'text/html'
}
ActionMailer::Base.delivery_method = :smtp

ActionMailer::Base.raise_delivery_errors = true

class DevelopmentMailInterceptor
  def self.delivering_email(message)
    message.to = 'joel.scalera@gmail.com'
    message.cc = nil
    message.bcc = nil
  end
end

if Rails.env.development?
  ActionMailer::Base.register_interceptor(DevelopmentMailInterceptor)
end
