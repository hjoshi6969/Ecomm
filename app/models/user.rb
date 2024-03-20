# app/models/user.rb
class User < ApplicationRecord
    has_secure_password
    has_many :orders
  end