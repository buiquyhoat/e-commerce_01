class CreateOrderDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :order_details do |t|
      t.integer :quantity
      t.string :product_uuid
      t.string :product_name
      t.references :product
      t.references :order

      t.timestamps
    end
  end
end
