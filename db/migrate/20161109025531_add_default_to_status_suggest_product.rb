class AddDefaultToStatusSuggestProduct < ActiveRecord::Migration[5.0]
  def change
    change_column_default :suggest_products, :status, 0
  end
end
