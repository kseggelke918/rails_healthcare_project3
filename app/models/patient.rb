class Patient < ApplicationRecord
    has_many :appointments
    has_many :users, through: :appointments
    validates :name, presence: true 

    def appointments_attributes=(appointments)
        self.appointments.create(appointments)
    end 

    def doctor_names
        @users 

        # self.users.map do |user|
        #     user.name
        # end.join 
    end 

    def appointment_times 
        if self.appointments = []
            "None"
        else 
            self.appointments.map do |appointment|
                appointment.time.strftime("%A, %d %b %Y %l:%M %p")
            end.join
        end 
    end 

    def self.search(search)
        if search 
            searched_patient = Patient.where('name LIKE ?', "%#{search}%")
            if searched_patient 
                self.where(id: searched_patient)
            else 
                @patients = Patient.all 
            end 
        else 
            @patients = Patient.all 
        end 
    end 

end
