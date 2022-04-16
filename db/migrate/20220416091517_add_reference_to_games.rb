class AddReferenceToGames < ActiveRecord::Migration[7.0]
  def change
    add_reference :games, :team_1, refernces: :teams
    add_reference :games, :team_2, refernces: :teams
  end
end
