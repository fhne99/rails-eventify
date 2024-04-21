class Bookmark < ApplicationRecord
  belongs_to :event
  belongs_to :user
  validates :user_id, uniqueness: { scope: :event_id, message: "Cet évènement est déjà enregistré dans vos signets" }
end
