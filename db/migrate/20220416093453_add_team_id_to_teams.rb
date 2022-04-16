class AddTeamIdToTeams < ActiveRecord::Migration[7.0]
  def change
    add_column :teams, :team_id, :integer
    add_index :teams, :team_id
  end
end
