class RenameUserPatientsToAppointments < ActiveRecord::Migration[6.0]
  def change
    rename_table :user_patients, :appointments
  end
end
