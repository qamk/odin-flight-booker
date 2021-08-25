class CreateAirports < ActiveRecord::Migration[6.1]
  def change
    create_table :airports do |t|
      t.string :code, null: false
      t.string :country
      t.string :city
      t.timestamps
    end
  end
end
