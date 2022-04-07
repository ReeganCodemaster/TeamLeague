class AddCoordinatorToTeam < ActiveRecord::Migration[7.0]
  def change
    add_column :teams, :coordinator, :string
  end
end
