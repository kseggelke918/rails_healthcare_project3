class CreateUserPatients < ActiveRecord::Migration[6.0]
  def change
    create_table :user_patients do |t|
      t.integer :patient_id
      t.integer :user_id

      t.timestamps
    end
  end
end
