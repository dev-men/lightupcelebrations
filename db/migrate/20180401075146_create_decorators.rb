class CreateDecorators < ActiveRecord::Migration[5.1]
  def change
    create_table :decorators do |t|
      t.string :image1
      t.string :image2
      t.string :image3
      t.string :compnay_name
      t.string :theme
      t.string :address_line_1
      t.string :address_line_2
      t.string :city
      t.integer :mayo
      t.integer :mehndi
      t.integer :barat
      t.integer :walima
      t.integer :party
      t.integer :other
      t.integer :user_id
      t.boolean :approve, :default => false
      t.timestamps
    end
    add_index :decorators, :user_id
  end
end
