class Product < ApplicationRecord

  extend FriendlyId
  friendly_id :name, use: :slugged
  validates :name, uniqueness: true

  has_many :wish_list_items
  has_many :wish_lists, through: :wish_list_items

  has_many :line_items
  has_many :orders, through: :line_items
  has_many_attached :images
  validates_size_of :images, maximum: 5

  belongs_to :category

  before_update :assign_in_stock, if: :will_save_change_to_quantity?

  private

  def assign_in_stock
    self.in_stock = quantity.positive?
  end
end
