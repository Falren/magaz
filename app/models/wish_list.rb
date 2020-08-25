class WishList < ApplicationRecord
  belongs_to :user
  has_many :wish_list_items, dependent: :destroy
  has_many :products, through: :wish_list_items
  validates_uniqueness_of :name
end
