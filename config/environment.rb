# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
SupplyChainPilot::Application.initialize!




#config.action_mailer.default_url_options = { :host => 'supplychainpilot.heroku.com' }

#config.action_mailer.delivery_method = :smtp
#config.action_mailer.raise_delivery_errors = true
ActionMailer::Base.smtp_settings = {
  #:enable_starttls_auto => true,
  :address        => "smtp.sendgrid.net",
  :port           => "25",
  :authentication => :plain,
  :user_name      => 'app723004@heroku.com',
  :password       => '8c4e24ea19c4ab99f6',
  :domain         => 'heroku.com'
}
