class CreateExcavators < ActiveRecord::Migration[5.2]
  def change
    create_table :excavators do |t|
      t.integer :ticket_id
      t.string :company_name
      t.string :address
      t.boolean :crewonsite, default: false
      t.timestamps
    end
  end
end
