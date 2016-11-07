class CreateSuggestProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :suggest_products do |t|
      t.string :product_name
      t.text :product_description
      t.integer :status
      t.references :user

      t.timestamps
    end
  end
end
