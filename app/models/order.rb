class Order < ApplicationRecord
  enum status: %i[drafted completed]

  belongs_to :user
  has_many :line_items
  has_many :products, through: :line_items
  has_one :address, as: :addressable
  accepts_nested_attributes_for :address
end
