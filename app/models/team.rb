class Team < ApplicationRecord
  has_and_belongs_to_many :games
  validates :sheet_key, presence: true, length: { is: 3 },
                        uniqueness: { case_sensitive: false }
  validates :league, presence: true, length: { is: 2 }
  validates :city, allow_nil: true, length: { in: 4..50 }
  validates :park, allow_nil: true, length: { in: 4..50 }
end
