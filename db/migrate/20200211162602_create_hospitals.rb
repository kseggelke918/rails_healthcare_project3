class CreateHospitals < ActiveRecord::Migration[6.0]
  def change
    create_table :hospitals do |t|
      t.integer :patient_id
      t.integer :doctor_id

      t.timestamps
    end
  end
end
