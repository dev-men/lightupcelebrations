class AddCategoryIdToVendor < ActiveRecord::Migration[5.1]
  def change
    add_column :vendors, :categoryid, :integer
  end
end
