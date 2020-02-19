class Appointment < ApplicationRecord
    belongs_to :patient 
    belongs_to :user  

    def next_appointment
        "Hello World"
    end 
end
