class CreateTechnicianRoles < ActiveRecord::Migration[5.0]
  def change
    create_table :technician_roles do |t|
      t.references :technician, foreign_key: true
      t.references :role, foreign_key: true

      t.timestamps
    end
  end
end
