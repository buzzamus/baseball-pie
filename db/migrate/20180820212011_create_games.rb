class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :year
      t.string :day
      t.string :day_of_week
      t.string :month
      t.string :home_team
      t.string :away_team
      t.string :park
      t.string :homeruns
      t.timestamps
    end
  end
end
