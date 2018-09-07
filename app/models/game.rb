class Game < ApplicationRecord
  require 'csv'
  require 'activerecord-import/base'
  belongs_to :season
  accepts_nested_attributes_for :season
  def self.import(file)
    month_names = ["January", "February", "March", "April",
                   "May", "June", "July", "August",
                   "September", "October", "November", "December"]
    CSV.foreach(file.path, headers: true) do |line|
      date = line[0]
      if line[6] == 'CHN'
        Game.create(game_year: date[(0..3)], park: line[6], home_team: 'Chicago National',
                    away_team: "#{line[3]} #{line[4]}", home_homeruns: line[53],
                    away_homeruns: line[25], total_homeruns: (line[53] + line[3]),
                    day_of_week: line[2], month: month_names[date[(4..5)].to_i],
                    season: Season.where(year: date[(0..3)]).first)
      end
      # do a case statement to translate each team name, park
    end
  end
end
