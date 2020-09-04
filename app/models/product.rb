class Product < ApplicationRecord
  enum status: %i[in_stock out_of_stock archived]
  extend FriendlyId
  friendly_id :name, use: :slugged
  validates :name, uniqueness: true

  has_many :wish_list_items
  has_many :wish_lists, through: :wish_list_items

  has_many :reviews
  has_many :line_items
  has_many :orders, through: :line_items
  has_one_attached :main_image
  has_many_attached :images
  validates_size_of :images, maximum: 5

  belongs_to :category

  before_update :assign_in_stock, if: :will_save_change_to_quantity?
  after_touch :update_rating

  private

  def update_rating
    update(average_rating: reviews.sum(:rating) / reviews.size)
  end

  def assign_in_stock
    status[:in_stock] = quantity.positive?
  end
end
