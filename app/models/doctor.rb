class Doctor < ApplicationRecord
    has_many :hospitals 
    has_many :patients, through: hospitals 
end
