class CreateRooms < ActiveRecord::Migration[7.1]
  def change
    create_table :rooms do |t|
      t.integer :room_number
      t.string :room_type

      t.timestamps
    end
  end
end
