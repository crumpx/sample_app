# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
#SampleApp::Application.config.secret_key_base = 'ed846441872e52609b2c9ffe4953f390dcadceb0a151e4a7a7494e1861ef4a5ca0415b6d04de49b2f0f21f47423f1c9294d906f734adb7dacbf0548cfad03df2'

require 'securerandom'
def secure_token
  token_file = Rails.root.join('.secert')
  if File.exist?(token_file)
    File.read(token_file).chomp
  else
    token = SecureRandom.hex(64)
    File.write(token_file, token)
    token
end

end

SampleApp::Application.config.secret_key_base = secure_token