class Product < ApplicationRecord
  enum status: %i[drafted completed]

  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :line_items
  has_many :orders, through: :line_items

  belongs_to :category

  validates :name, uniqueness: true
end
