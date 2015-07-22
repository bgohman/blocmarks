if Rails.env.development? || Rails.env.production?
  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtp_settings = {
    address:         'smtp.mailgun.org',
    port:            '587',
    authentication:  :plain,
    user_name:       ENV['MAILGUN_SMTP_LOGIN'],
    password:        ENV['MAILGUN_SMTP_PASSWORD'],
    domain:          'heroku.com',
    content_type:    'text/hmtl', 
    enable_starttls_auto: true
  }
  ActionMailer::Base.raise_delivery_errors = true


end