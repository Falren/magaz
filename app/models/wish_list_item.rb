class WishListItem < ApplicationRecord
  belongs_to :wish_list
  belongs_to :product

  delegate :name, to: :product, prefix: true, allow_nil: true
end
