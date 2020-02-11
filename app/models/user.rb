class User < ApplicationRecord
    has_many :user_patients 
    has_many :patients, through: :user_patients 
    has_secure_password 
end
