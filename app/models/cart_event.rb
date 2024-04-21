class CartEvent < ApplicationRecord
  belongs_to :event
  belongs_to :cart
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
