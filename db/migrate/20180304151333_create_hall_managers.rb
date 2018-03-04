class CreateHallManagers < ActiveRecord::Migration[5.1]
  def change
    create_table :hall_managers do |t|
      t.string :image1
      t.string :image2
      t.string :image3
      t.string :image4
      t.string :image5
      t.string :image6
      t.string :hall_name
      t.integer :number_of_halls
      t.string :address_line_1
      t.string :address_line_2
      t.string :city
      t.integer :budget_per_head
      t.integer :guest_capacity
      t.integer :user_id

      t.timestamps
    end
    add_index :hall_managers, :user_id
  end
end
