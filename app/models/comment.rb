class Comment < ApplicationRecord
  belongs_to :event
  belongs_to :user
  validates :comment, length: { minimum: 6 }
  validates :user_id, uniqueness: { scope: :event_id, message: "Vous ne pouvez laisser qu'un seul avis par évènement" }
end
