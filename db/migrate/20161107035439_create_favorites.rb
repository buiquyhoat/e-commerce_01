class CreateFavorites < ActiveRecord::Migration[5.0]
  def change
    create_table :favorites do |t|
      t.integer :user_id
      t.references :product
      t.references :user

      t.timestamps
    end
  end
end
