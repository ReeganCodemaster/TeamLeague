class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.references :team_1, foreign_key: {to_table: :teams}
      t.references :team_2, foreign_key: {to_table: :teams}
      t.integer :team_1_score
      t.integer :team_2_score

      t.timestamps
    end
  end
end
