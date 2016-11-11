class AddDefaultToStatusOrder < ActiveRecord::Migration[5.0]
  def change
    change_column_default :orders, :status, 0
  end
end
