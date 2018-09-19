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
          home_team: Team.where(sheet_key: line[6]).first_or_create(league: line[7], sheet_key: line[6], city: self.city_adder(line[6].to_sym)).sheet_key,
          away_team: Team.where(sheet_key: line[3]).first_or_create(league: line[4], sheet_key: line[3], city: self.city_adder(line[3].to_sym)).sheet_key,
          home_homeruns: line[53],
          away_homeruns: line[25],
          total_homeruns: (line[53].to_i + line[25].to_i).to_s,
          day_of_week: line[2],
          month: month_names[(date[(4..5)].to_i - 1)],
          season: Season.where(year: date[(0..3)]).first
        )
    end
  end

  private
  # need to add previous team names (such as Florida Marlins) for older seasons
  def self.city_adder(arg)
    cities = {
      TBA: "Tampa Bay",
      TOR: "Toronto",
      PIT: "Pittsburgh",
      SLN: "St. Louis",
      ANA: "Los Angeles",
      CHN: "Chicago",
      BAL: "Baltimore",
      MIN: "Minnesota",
      OAK: "Oakland",
      CHA: "Chicago",
      TEX: "Texas",
      SEA: "Seattle",
      ARI: "Arizona",
      COL: "Colorado",
      ATL: "Atlanta",
      WAS: "Washington",
      CIN: "Cincinnati",
      PHI: "Philadelphia",
      MIL: "Milwaukee",
      SFN: "San Francisco",
      SDN: "San Diego",
      LAN: "Los Angeles",
      CLE: "Cleveland",
      BOS: "Boston",
      KCA: "Kansas City",
      NYN: "New York",
      NYA: "New York",
      HOU: "Houston",
      MIA: "Miami",
      DET: "Detroit"
    }
    return cities[arg]
  end
end
