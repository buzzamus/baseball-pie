class Game < ApplicationRecord
  require 'csv'
  require 'activerecord-import/base'
  belongs_to :season
  has_and_belongs_to_many :teams

  def self.import(file)
    month_names = ["January", "February", "March", "April",
                   "May", "June", "July", "August",
                   "September", "October", "November", "December"]
    CSV.foreach(file.path, headers: true) do |line|
      date = line[0]
        @game = Game.create(
          game_year: date[(0..3)],
          park: line[6],
          home_team: Team.where(sheet_key: line[6]).first_or_create(league: line[7], sheet_key: line[6]).sheet_key,
          away_team: Team.where(sheet_key: line[3]).first_or_create(league: line[4], sheet_key: line[3]).sheet_key,
          home_homeruns: line[53],
          away_homeruns: line[25],
          total_homeruns: (line[53] + line[3]),
          day_of_week: line[2],
          month: month_names[(date[(4..5)].to_i - 1)],
          season: Season.where(year: date[(0..3)]).first
        )
    end
  end
end
