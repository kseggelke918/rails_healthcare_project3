class Patient < ApplicationRecord
    has_many :appointments
    has_many :users, through: :appointments


    def doctor_names
        self.users.map do |user|
            user.name
        end 
    end 
end
