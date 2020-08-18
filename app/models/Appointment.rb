class Appointment < ApplicationRecord
    belongs_to :patient 
    belongs_to :user  
    scope :upcoming_appointments, -> { where("time > ?", Time.now) } 
    scope :next_appointment, -> { upcoming_appointments.order(:time).limit(1).first } 

    validates :time, uniqueness: { scope: :user, message: "Doctor already has appointment at this time"}
    validate :time_not_in_past

    def time_not_in_past
       if time < Time.now 
            errors.add(:time, "Error - Please enter a future date and time")
       end 
    end

end
