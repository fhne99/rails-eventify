class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_events
  has_many :events, through: :cart_events

  #def total_price
  #  cart_events.sum { |cart_event| cart_event.event.prices.sum(:amount) * cart_event.quantity }
  #end
end
