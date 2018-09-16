class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :league
      t.string :city
      t.string :park
      t.string :sheet_key
    end
  end
end
