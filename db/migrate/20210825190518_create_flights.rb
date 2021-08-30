class CreateFlights < ActiveRecord::Migration[6.1]
  def change
    create_table :flights do |t|
      t.references :departing_airport, foreign_key: { to_table: :airports }
      t.references :arriving_airport, foreign_key: { to_table: :airports }

      t.date :date, null: false
      t.time :time, null: false
      t.timestamps
    end
  end
end
