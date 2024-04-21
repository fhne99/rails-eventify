class Event < ApplicationRecord
  validates :title, :description, :location, :start_date, presence: true
  validates :title, length: { maximum: 100 }
  validates :description, length: { maximum: 1000 }
  validates :end_date_after_start_date
  validates :available_tickets, numericality: { greater_than_or_equal_to: 0 }
  validates :start_date, :end_date, timeliness: { type: :datetime }

  # Catégories d'évènements prédéfinies disponibles
  CATEGORIES = ["Concert", "Festival", "Spectacle", "Sport", "Art et culture", "Conférence", "Cours et atelier"]
  validates :category, inclusion: { in: CATEGORIES }

  def end_date_after_start_date
    errors.add(:end_date, "Doit être après l'heure et la date de début définies") if end_date <= start_date
  end
end