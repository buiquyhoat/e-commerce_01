class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :status
      t.float :total_amount
      t.string :message
      t.references :user

      t.timestamps
    end
  end
end
