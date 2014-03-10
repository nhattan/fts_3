# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
Fts3::Application.config.secret_key_base = 'db58b217cecb132987219bb0f53622a07b6b1c63c427d0a3d18de2a4b61ca53419bf809202d18ea4cdcabf321a9ea1689733155620a5321f5d20dfda89a2d7d8'
