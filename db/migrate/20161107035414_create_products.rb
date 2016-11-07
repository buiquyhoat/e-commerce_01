class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :uuid
      t.string :product_name
      t.text :description
      t.string :image
      t.float :price
      t.float :rating
      t.integer :quantity
      t.references :category

      t.timestamps
    end
  end
end
