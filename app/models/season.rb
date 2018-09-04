class Season < ApplicationRecord
  validates :year, presence: true, length: { is: 4 },
            uniqueness: { case_sensitive: false }
  has_many :games

end
