class CreatePhotographers < ActiveRecord::Migration[5.1]
  def change
    create_table :photographers do |t|
      t.string :image1
      t.string :image2
      t.string :image3
      t.string :name
      t.string :description
      t.string :equipments
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
    add_index :photographers, :user_id
  end
end
