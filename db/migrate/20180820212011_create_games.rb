class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :game_year
      t.string :day
      t.string :day_of_week
      t.string :month
      t.string :home_team
      t.string :away_team
      t.string :park
      t.string :home_homeruns
      t.string :away_homeruns
      t.string :total_homeruns
      t.timestamps
    end
  end
end
