class Address < ApplicationRecord
  belongs_to :addressable, polymorphic: true
  validates_presence_of :building_address, :post_index, :number, presence: true
end
