class Patient < ApplicationRecord
    has_many :hospitals 
    has_many :doctors, through: hospitals
end
