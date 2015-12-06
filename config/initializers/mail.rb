ActionMailer::Base.smtp_settings = {
port:              587,
address:           'smtp.mailgun.org',
user_name:         ENV['postmaster@app87c8e48cb0e146f595f8e3feef21cf08.mailgun.org'],
password:          ENV['e0b5aff1a308115b847afa63713c581b'],
domain:            'app87c8e48cb0e146f595f8e3feef21cf08.mailgun.org',
authentication:    :plain,
content_type:      'text/html'
}
ActionMailer::Base.delivery_method = :smtp

class DevelopmentMailInterceptor
  def self.delivering_email(message)
    message.to =  'app87c8e48cb0e146f595f8e3feef21cf08.mailgun.org'
    message.cc = nil
    message.bcc = nil
  end
end

if Rails.env.development?
  ActionMailer::Base.register_interceptor(DevelopmentMailInterceptor)
end
