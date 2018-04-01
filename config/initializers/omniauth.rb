# config/initializers/omniauth.rb

OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '659394411369-uir2671khso2odigai6ds9aojoihnd3h.apps.googleusercontent.com', 'Tr7_dW_J86j2OSOkB83Codj6', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end
