class Dose < ApplicationRecord
  belongs_to :cocktail
  belongs_to :ingredient

  validates :description , presence: true
  validates :cocktail , presence: true
  validates :dose , presence: true
end
