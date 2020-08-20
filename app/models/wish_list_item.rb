class WishListItem < ApplicationRecord
  belongs_to :wish_lists
  belongs_to :products
end
