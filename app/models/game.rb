class Game < ApplicationRecord
  require 'csv'
  require 'activerecord-import/base'
  belongs_to :season
  has_and_belongs_to_many :teams

  # One of the below validations causing issue w/ total hr number per season

  validates :home_team, presence: true, length: { is: 3 }
  validates :away_team, presence: true, length: { is: 3 }
  validates :game_year, presence: true, length: { is: 4 }
  validates :park, presence: true, length: { in: 1..70 }
  validates :month, presence: true, length: { in: 3..10 }


  def self.import(file)
    month_names = ["January", "February", "March", "April",
                   "May", "June", "July", "August",
                   "September", "October", "November", "December"]
    CSV.foreach(file.path, headers: true) do |line|
      date = line[0]
        @game = Game.create(
          game_year: date[(0..3)],
          full_date: line[0],
          park: line[6],
          home_team: Team.where(sheet_key: line[6]).first_or_create(league: line[7], sheet_key: line[6], city: self.city_adder(line[6].to_sym)).sheet_key,
          away_team: Team.where(sheet_key: line[3]).first_or_create(league: line[4], sheet_key: line[3], city: self.city_adder(line[3].to_sym)).sheet_key,
          home_homeruns: line[53],
          away_homeruns: line[25],
          home_score: line[10],
          away_score: line[9],
          total_homeruns: (line[53].to_i + line[25].to_i).to_s,
          winner: self.winning_team(line[6], line[3], line[10], line[9]),
          loser: self.losing_team(line[6], line[3], line[10], line[9]),
          day_of_week: line[2],
          month: month_names[(date[(4..5)].to_i - 1)],
          season: Season.where(year: date[(0..3)]).first_or_create(year: date[(0..3)])
        )
    end
  end

  private
  # refactor this
  def self.winning_team(home_team, away_team, home_runs, away_runs)
    if home_runs > away_runs
      home_team
    else
      away_team
    end
  end

  def self.losing_team(home_team, away_team, home_runs, away_runs)
    if home_runs < away_runs
      home_team
    else
      away_team
    end
  end
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
      DET: "Detroit",
      FLO: "Florida"
    }
    return cities[arg]
  end
end
