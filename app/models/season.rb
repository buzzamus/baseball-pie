class Season < ApplicationRecord
  validates :year, presence: true, length: { is: 4 }
  has_many :games

end
