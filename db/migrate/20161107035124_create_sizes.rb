class CreateSizes < ActiveRecord::Migration[5.0]
  def change
    create_table :sizes do |t|
      t.string :size_name
      t.references :product

      t.timestamps
    end
  end
end
