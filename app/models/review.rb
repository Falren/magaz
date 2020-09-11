class Review < ApplicationRecord
  belongs_to :user
  belongs_to :product, counter_cache: :review_counter
  scope :created_since, ->(time) { where('created_at > ?', time) if time.present? }
  scope :most_recent, ->(limit) { order(created_at: :desc).limit(limit) }
  scope :rated_product, ->(rating) { where('rating > ?', rating) if rating.present? }

  def edited?
    updated_at != created_at
  end
end
