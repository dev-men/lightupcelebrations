class AddRoleAndApproveToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :role, :integer
    add_column :users, :approve, :boolean
  end
end
