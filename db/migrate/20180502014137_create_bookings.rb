class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.datetime :start
      t.datetime :end
      t.string :location
      t.integer :user_id
      t.references :imageable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
