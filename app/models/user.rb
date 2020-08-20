class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :wish_lists

  has_many :orders
  has_one :drafted_order, -> { drafted }, class_name: 'Order'

  has_one :address, as: :addressable
  accepts_nested_attributes_for :address

end
