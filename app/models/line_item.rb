class LineItem < ApplicationRecord
  belongs_to :product
  belongs_to :order, touch: true

  delegate :name, :price, :quantity, to: :product, prefix: true, allow_nil: true

  before_save :change_subtotal, if: :will_save_change_to_quantity?
  validates_uniqueness_of :product_id, scope: :order_id

  private

  def change_subtotal
    self.subtotal = product_price * quantity
  end
end
