class Patient < ApplicationRecord
    has_many :user_patients 
    has_many :users, through: :user_patients


    def doctor_names
        self.users.map do |user|
            user.name
        end 
    end 
end
