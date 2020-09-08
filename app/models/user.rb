class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :wish_lists
  has_many :reviews
  has_many :orders
  has_many :line_items, through: :orders
  has_one :drafted_order, -> { drafted }, class_name: 'Order'
  has_many :completed_orders, -> { completed }, class_name: 'Order'
  has_one :address, as: :addressable
  accepts_nested_attributes_for :address
end
