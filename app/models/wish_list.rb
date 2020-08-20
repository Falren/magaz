class WishList < ApplicationRecord
  has_many :wish_list_items
  has_many :products, through: :wish_list_items
  belongs_to :user
end
