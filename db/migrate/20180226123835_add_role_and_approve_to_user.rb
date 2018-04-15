class AddRoleAndApproveToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name, :string
    add_column :users, :cnic, :string
    add_column :users, :number, :string
    add_column :users, :image, :string
    add_column :users, :role, :integer
    add_column :users, :vendor_role, :integer, :default => 0
  end
end
