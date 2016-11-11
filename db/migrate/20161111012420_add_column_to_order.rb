class AddColumnToOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :shipping_name, :string
    add_column :orders, :shipping_email, :string
    add_column :orders, :shipping_address, :string
  end
end
