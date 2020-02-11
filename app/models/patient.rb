class Patient < ApplicationRecord
    has_many :user_patients 
    has_many :doctors, through: :user_patients
end
