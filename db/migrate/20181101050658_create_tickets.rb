class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.string :request_number
      t.string :sequence_number
      t.string :request_type
      t.json :date_times
      t.json :service_area
      t.json :digsiteinfo, default: '{}'
      t.timestamps
    end
  end
end
