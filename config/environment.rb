# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Confiture::Application.initialize!
#config.action_mailer.raise_delivery_errors = true

ActionMailer::Base.smtp_settings = {
  :address        => 'smtp.gmail.com',
  :domain         => 'mail.google.com',
  :port           => 587,
  :user_name      => 'pierre.lecigne@gmail.com',
  :password       => '14la27nov10',
  :authentication => :plain,
  :enable_starttls_auto => true
}

