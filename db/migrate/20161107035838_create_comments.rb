class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :content
      t.integer :rating
      t.references :product
      t.references :user

      t.timestamps
    end
  end
end
