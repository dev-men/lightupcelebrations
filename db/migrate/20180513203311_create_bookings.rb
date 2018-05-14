class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.date :day
      t.time :start
      t.time :end
      t.string :location
      t.integer :user_id
      t.references :imageable, polymorphic: true, index: true

      t.timestamps
    end
    add_index :bookings, :user_id
  end
end
