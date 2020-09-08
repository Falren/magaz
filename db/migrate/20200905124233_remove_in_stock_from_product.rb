class RemoveInStockFromProduct < ActiveRecord::Migration[6.0]
  def change
    remove_column :products, :in_stock, :boolean
  end
end
