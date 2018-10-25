FactoryBot.define do
  factory :game do
    home_team { 'CHN' }
    away_team { 'CHA' }
    game_year { '2016' }
    park { 'CHN' }
    home_homeruns {}
    away_homeruns {}
    day_of_week { 'Wednesday' }
    month { 'August' }
    season { FactoryBot.create(:season) }
    # not sure line above works
    # add more here to make full game record
  end
end
