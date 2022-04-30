class AddTournamentRefToGames < ActiveRecord::Migration[7.0]
  def change
    add_reference :games, :tournament, null: true, foreign_key: true
  end
end
