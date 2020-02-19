class Appointment < ApplicationRecord
    belongs_to :patient 
    belongs_to :user  

    def next_appointment
        # method to show the next patient's appointment
    end 
end
