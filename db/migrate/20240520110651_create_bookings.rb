class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.references :client, null: false, foreign_key: true
      t.references :room, null: false, foreign_key: true
      t.date :check_in_date
      t.decimal :total_amount

      t.timestamps
    end
  end
end
