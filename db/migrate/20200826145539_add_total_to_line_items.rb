class AddTotalToLineItems < ActiveRecord::Migration[6.0]
  def change
    add_column :line_items, :subtotal, :integer, default: 0
  end
end
