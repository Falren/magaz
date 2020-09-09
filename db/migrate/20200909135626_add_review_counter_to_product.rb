class AddReviewCounterToProduct < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :review_counter, :integer, default: 0, null: false
  end
end
