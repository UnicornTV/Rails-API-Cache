secret = Rails.env.production? ? ENV['SECRET_TOKEN'] : 'supersecrettoken'
Manticore::Application.config.secret_key_base = secret
Manticore::Application.config.secret_key = secret
