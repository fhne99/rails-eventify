class Price < ApplicationRecord
  belongs_to :event
  validates :ticket_price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :category, presence: true, uniqueness: { scope: :event_id, message: "Ne peut pas y avoir deux catégories identiques" }
end
