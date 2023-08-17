class CreatePatients < ActiveRecord::Migration[7.0]
  def change
    create_table :patients do |t|
      t.string :name
      t.string :email
      t.date :dob

      t.timestamps
    end
  end
end
