class WishListItem < ApplicationRecord
  belongs_to :wish_list
  belongs_to :product
  validates_uniqueness_of :product_id, scope: :wish_list_id
  delegate :name, to: :product, prefix: true, allow_nil: true
end
