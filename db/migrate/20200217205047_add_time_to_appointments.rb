class AddTimeToAppointments < ActiveRecord::Migration[6.0]
  def change
    add_column :appointments, :time, :datetime
  end
end
