class CreateMarquees < ActiveRecord::Migration[5.1]
  def change
    create_table :marquees do |t|
      t.string :image1
      t.string :image2
      t.string :image3
      t.string :marquee_name
      t.integer :numbe_of_marquee
      t.string :address_line_1
      t.string :address_line_2
      t.string :city
      t.integer :budget_per_head
      t.integer :guest_capacity
      t.integer :user_id
      t.boolean :approve, :default => false
      t.timestamps
    end
    add_index :marquees, :user_id
  end
end
