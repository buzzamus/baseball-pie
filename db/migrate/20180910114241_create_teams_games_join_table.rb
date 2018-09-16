class CreateTeamsGamesJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :teams, :games do |t|
      t.index :team_id
      t.index :game_id
    end
  end
end
