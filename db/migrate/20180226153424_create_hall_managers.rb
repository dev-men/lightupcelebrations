class CreateHallManagers < ActiveRecord::Migration[5.1]
  def change
    create_table :hall_managers do |t|
      t.string :image1
      t.string :image2
      t.string :image3
      t.string :image4
      t.string :image5
      t.string :image6
      t.integer :number
      t.string :line1
      t.string :line2
      t.string :city
      t.integer :budget
      t.integer :guest
      t.integer :vendor_id

      t.timestamps
    end
    add_index :hall_managers, :vendor_id
  end
end
