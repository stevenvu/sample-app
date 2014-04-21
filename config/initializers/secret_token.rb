# SampleApp::Application.config.secret_key_base = '7906d91e75adf5087111f21894d0689d63fa35214aa07f995620aeeded5c3fd696b74b6ba28b674cd8204d2ce4eda2fa2e79cd8a11f4159eead73a21c2cbc17f'

# Be sure to restart your server when you modify this file.
# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.
# Make sure your secret_key_base is kept private # if you're sharing your code publicly.
require 'securerandom'
def secure_token
  token_file = Rails.root.join('.secret')
  if File.exist?(token_file)
	# Use the existing token.
    File.read(token_file).chomp
  else
    # Generate a new token and store it in token_file.
    token = SecureRandom.hex(64)
    File.write(token_file, token)
    token
end end
SampleApp::Application.config.secret_key_base = secure_token