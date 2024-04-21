class Rating < ApplicationRecord
  belongs_to :event
  belongs_to :user
  validates :user_id, uniqueness: { scope: :event_id, message: "Vous ne pouvez laisser qu'une seule note par évènement" }
  validates :rating, numericality: { greater_than_or_equal_to: 0, less_than: 6 }
end
