class Product < ApplicationRecord
  enum status: %i[in_stock out_of_stock archived]

  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :wish_list_items
  has_many :wish_lists, through: :wish_list_items

  has_many :reviews
  has_many :top_rated, -> { where('rating >= ?', 4) }, class_name: 'Review'
  has_many :line_items
  has_many :orders, through: :line_items

  has_one_attached :main_image
  has_many_attached :images
  validates_size_of :images, maximum: 5

  belongs_to :category

  validates :name, uniqueness: true
  after_touch :update_rating
  before_save :assign_in_stock, if: -> { will_save_change_to_quantity? && !archived? }
  before_save :deplete_quantity, if: %i[will_save_change_to_status? archived?]

  scope :products_for_users, -> { where(status: %i[in_stock out_of_stock]) }
  private

  def deplete_quantity
    self.quantity = 0
  end

  def update_rating
    self.average_rating = reviews.sum(:rating) / reviews.size
  end

  def assign_in_stock
    quantity.positive? ? in_stock! : out_of_stock!
  end
end
