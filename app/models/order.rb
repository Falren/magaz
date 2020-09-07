class Order < ApplicationRecord
  enum status: %i[drafted completed archived]

  belongs_to :user

  has_many :line_items
  has_many :products, through: :line_items

  has_one :address, as: :addressable

  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :line_items

  delegate :post_index, :number, :building_address, to: :address, prefix: false, allow_nil: true
  after_touch :update_total
  before_update :update_product_quantity, if: :will_save_change_to_status?

  private

  def update_product_quantity
    line_items.each do |li|
      li.product.update(quantity: li.product.quantity - li.quantity)
    end
  end

  def update_total
    update(total: line_items.sum(:subtotal))
  end
end
