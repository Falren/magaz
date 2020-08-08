class Product < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  has_many :line_items
  has_many :orders, through: :line_items

  validates :name, uniqueness: true
end
