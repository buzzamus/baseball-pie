class Season < ApplicationRecord
  validates :year, presence: true, length: { is: 4 },
                   uniqueness: true
  has_many :games
end
