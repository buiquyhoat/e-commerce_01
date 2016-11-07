class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string :category_name
      t.string :description
      t.integer :left_node
      t.integer :right_node
      t.integer :depth

      t.timestamps
    end
  end
end
