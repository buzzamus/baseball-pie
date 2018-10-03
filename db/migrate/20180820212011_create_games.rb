class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.integer :game_year
      t.string :full_date
      t.string :day
      t.string :day_of_week
      t.string :month
      t.string :home_team
      t.string :away_team
      t.string :park
      t.integer :home_homeruns
      t.integer :away_homeruns
      t.integer :home_score
      t.integer :away_score
      t.string :winner
      t.string :loser
      t.integer :total_homeruns
      t.timestamps
    end
  end
end
