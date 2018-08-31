class AddSeasonsIdToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :seasons_id, :integer
  end
end
