class Game < ApplicationRecord
  require 'csv'
  require 'activerecord-import/base'
  belongs_to :season
  accepts_nested_attributes_for :season
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |line|
      year = line[0]
      if line[6] == 'CHN'
        Game.create(game_year: year[(0..3)], park: line[6], home_team: 'Chicago National',
                    away_team: "#{line[3]} #{line[4]}", home_homeruns: line[53],
                    away_homeruns: line[25], total_homeruns: (line[53] + line[3]),
                    season: Season.where(year: year[(0..3)]).first)
      end
      # do a case statement to translate each team name, park
    end
  end
end
